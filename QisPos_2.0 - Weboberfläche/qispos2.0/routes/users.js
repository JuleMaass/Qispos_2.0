"use strict";
var sequelize = require("../services/sequelize");
const express = require("express");
const router = express.Router();
var Student = require("../models/Student");
var Modul = require("../models/Modul");
var Pruefung = require("../models/Pruefung");
var Students_has_modul = require("../models/Students_has_modul");
var Students_has_pruefung = require("../models/Students_has_pruefung");
var Pusher = require("pusher");

var pusher = new Pusher({
  appId: "813648",
  key: "6e48ff07949cb7a49f5e",
  secret: "c2d294a4f31ae72e3b25",
  cluster: "eu",
  encrypted: true
});

var sess;

// Welcome Page für nicht eingeloggte
router.get("/", (req, res) => res.redirect("../login"));

//Logout Page/view
router.get("/logout", (req, res) => res.redirect("../welcome"));

// Antwort vom Dozenten-Dashboard
router.post("/dashboard_dozent", async (req, res) => {
  if (sess.nutzer == null) {
    res.redirect("../login");
  } else {
    sess = req.session;

    sess.hash = req.body.hash;
    // console.log(req.body);

    for (var note in req.body) {
      if (note.split("_")[0] == "note") {
        var stud_id = parseInt(note.split("_")[2]);
        var pruef_id = parseInt(note.split("_")[3]);

        await sequelize.query(" call update_note(:pruef_id, :stud_id, :note)", {
          replacements: {
            pruef_id: pruef_id,
            stud_id: stud_id,
            note: req.body.update_note
          }
        });

        sess.hash = "#Noteneintragung";
      }
    }

    var pruefungs = await sequelize.query(
      " call all_pruefungs_dozent(:doz_id)",
      {
        replacements: {
          doz_id: sess.nutzer.id
        }
      }
    );

    res.redirect("/users/dashboard_dozent" + sess.hash);
  }
});

router.post("/dashboard", async (req, res) => {
  if (sess == null) {
    res.redirect("../login");
  } else {
    sess = req.session;
    sess.hash = req.body.hash;

 
    // pusher.trigger('noten', 'test', {
    //   noten: noten
    // });

    // Termin löschen
    for (var termin in req.body) {
      if (termin.split("_")[0] == "termine") {
        var id = parseInt(termin.split("_")[3]);

        await sequelize.query(" call delete_termin(:id)", {
          replacements: {
            id: id
          }
        });

        // eventuell unnötig
        sess.hash = "#Termine";
      }
    }

    // Zur Prüfung anmelden
    for (var pruefung in req.body) {
      if (pruefung.split("_")[0] == "pruefung") {
        var id = pruefung.split("_")[2];

        // Prüfung finden
        var pruefung = await Pruefung.findOne({
          where: {
            id: id
          }
        });

        // Modul zur Prüfung finden
        var modul = await Modul.findOne({
          where: {
            id: pruefung.moduls_id
          }
        });

        // Überprüfen ob der Student bereits beim Modul angemeldet ist
        var student_has_modul = await Students_has_modul.findOne({
          where: {
            students_id: sess.nutzer.id,
            moduls_id: modul.id
          }
        });

        // Student zur Prüfung anmelden
        await sequelize.query(
          " call new_student_has_pruefungs(:student_id, :pruefungs_id)",
          {
            replacements: {
              student_id: sess.nutzer.id,
              pruefungs_id: pruefung.id
            }
          }
        );

        // Wenn der Student noch nicht im Modul angemeldet ist, dann anmelden
        if (student_has_modul == null) {
          await sequelize.query(
            " call new_student_has_moduls(:student_id, :modul_id)",
            {
              replacements: {
                student_id: sess.nutzer.id,
                modul_id: modul.id
              }
            }
          );
        }

        sess.hash = "#Module";
      }
    }

    // Von der Prüfung und möglicherweise auch vom Modul abmelden
    for (var abmelden in req.body) {
      if (abmelden.split("_")[0] == "abmelden") {
        var id = abmelden.split("_")[2];
        console.log("Ping!");
        // Prüfung finden
        var pruefung_abmelden = await Pruefung.findOne({
          where: {
            id: id
          }
        });

        // Student von der Prüfung abmelden
        await sequelize.query(
          " call delete_students_has_pruefungs(:stud_id, :pruef_id)",
          {
            replacements: {
              stud_id: sess.nutzer.id,
              pruef_id: pruefung_abmelden.id
            }
          }
        );

        // Modul finden
        var modul = await Modul.findOne({
          where: {
            id: pruefung_abmelden.moduls_id
          }
        });

        // Liste der Prüfungen die noch im Modul sein könnten
        var list_pruefungs = await Pruefung.findAll({
          where: {
            moduls_id: modul.id
          }
        });

        var modul_loeschen = true;

        // Alle Prüfungen überprüfen, ob der Student noch bei einer aus dieser Liste angemeldet ist
        for (i = 0; i < list_pruefungs; i++) {
          var student_has_pruefung = await Students_has_pruefung.findOne({
            where: {
              students_id: sess.nutzer.id,
              pruefungs_id: list_pruefungs[0].id
            }
          });

          // Wenn eine Prüfung gefunden wird, dann Modul nicht löschen
          if (student_has_pruefung != null) modul_loeschen = false;
        }

        // wenn keine Prüfung gefunden wurde, die der Student noch im Modul belegt,

        if (modul_loeschen) {
          // dann Modulzugehörigkeit löschen
          await sequelize.query(
            " call delete_students_has_moduls(:stud_id, :modul_id)",
            {
              replacements: {
                stud_id: sess.nutzer.id,
                modul_id: modul.id
              }
            }
          );
        }
      }
    }

    if (req.body.termin_name != "" && req.body.termin_datum != "") {
      var neuesDatum =
        req.body.termin_datum[6] +
        req.body.termin_datum[7] +
        req.body.termin_datum[8] +
        req.body.termin_datum[9] +
        req.body.termin_datum[3] +
        req.body.termin_datum[4] +
        req.body.termin_datum[0] +
        req.body.termin_datum[1];

      await sequelize.query(" call new_termin(:bezeichnung, :datum, :id)", {
        replacements: {
          id: sess.nutzer.id,
          bezeichnung: req.body.termin_name,
          datum: parseInt(neuesDatum)
        }
      });
    }
    res.redirect("/users/dashboard" + sess.hash);
  }
});

//Dashboard
router.get("/dashboard", async (req, res) => {
  sess = req.session;

  if (sess.nutzer == null) {
    res.redirect("../login");
  } else {
    var students = await Student.findAll();

    var termine = await sequelize.query(" call all_termins_student(:id)", {
      replacements: {
        id: sess.nutzer.id
      }
    });

    var noten = await sequelize.query(" call all_grades_student(:id)", {
      replacements: {
        id: sess.nutzer.id
      }
    });

    var ges_note = await sequelize.query(" call ges_note_student(:id)", {
      replacements: {
        id: sess.nutzer.id
      }
    });

    var all_ges_note = [];

    for (i = 0; i < students.length; i++) {
      all_ges_note[i] = await sequelize.query(" call ges_note_student(:id)", {
        replacements: {
          id: students[i].id
        }
      });
    }

    var semesters_studiengang = await sequelize.query(
      " call all_semesters_studiengang(:id)",
      {
        replacements: {
          id: sess.studiengang[0].id
        }
      }
    );

    var moduls_studiengang = await sequelize.query(
      " call all_moduls_studiengang(:studiengangs_id)",
      {
        replacements: {
          studiengangs_id: sess.studiengang[0].id
        }
      }
    );

    var pruefungs_student = await sequelize.query(
      " call all_pruefung_student(:student_id)",
      {
        replacements: {
          student_id: sess.nutzer.id
        }
      }
    );

    var pruefungs_studiengang = await sequelize.query(
      " call all_pruefungsinformationen_studiengang(:studiengangs_id)",
      {
        replacements: {
          studiengangs_id: sess.studiengang[0].id
        }
      }
    );

    var moduls = await sequelize.query(" call all_moduls_student(:id)", {
      replacements: {
        id: sess.nutzer.id
      }
    });

    res.render("dashboard", {
      students: students,
      student: sess.nutzer,
      termine: termine,
      studiengang: sess.studiengang,
      noten: noten,
      moduls: moduls,
      ges_note: ges_note,
      all_ges_note: all_ges_note,
      semesters_studiengang: semesters_studiengang,
      moduls_studiengang: moduls_studiengang,
      pruefungs_studiengang: pruefungs_studiengang,
      pruefungs_student: pruefungs_student
    });
  }
});

//Dashboard Dozent
router.get("/dashboard_dozent", async (req, res) => {
  let sess = req.session;
  var students = await Student.findAll();

  var pruefungs = await sequelize.query(" call all_pruefungs_dozent(:doz_id)", {
    replacements: {
      doz_id: sess.nutzer.id
    }
  });

  var pruefungs_once = await sequelize.query(
    " call all_pruefungs_once_dozent(:doz_id)",
    {
      replacements: {
        doz_id: sess.nutzer.id
      }
    }
  );

  if (sess.nutzer.benutzername == null) {
    res.redirect("../login");
  } else {
    res.render("dashboard_dozent", {
      students: students,
      dozent: sess.nutzer,
      pruefungs: pruefungs,
      pruefungs_once: pruefungs_once
    });
  }
});

module.exports = router;
