'use strict';
var sequelize = require('../services/sequelize');
const express = require('express');
const router = express.Router();
var Student = require('../models/Student');
var Modul = require('../models/Modul');
var Pruefung = require('../models/Pruefung');
var url = require('url');
var sess;


// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));



//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));



router.post('/dashboard', async (req, res) => {
  sess = req.session;


  sess.hash = req.body.hash;

  console.log(req.body)

  for (var termin in req.body) {
    if (termin.split('_')[0] == "termine") {

      var id = parseInt(termin.split('_')[3])


      await sequelize
        .query(' call delete_termin(:id)', {
          replacements: {
            id: id
          }
        });

      sess.hash = "Termine";

    }
  }

  for (var pruefung in req.body) {
    if (pruefung.split('_')[0] == "pruefung") {
      var id = pruefung.split('_')[2];
      

      var pruefung = await Pruefung.findOne({
        where: {
            id: id
        }
    });

    console.log(pruefung.moduls_id);
     

      await sequelize
      .query(' call new_student_has_moduls(:student_id, :modul_id)', {
        replacements: {
          student_id: sess.nutzer.id,
          modul_id: pruefung.moduls_id,
        }
      });

      await sequelize
      .query(' call new_student_has_pruefungs(:student_id, :pruefungs_id)', {
        replacements: {
          student_id: sess.nutzer.id,
          pruefungs_id: id,
        }
      });


       sess.hash = "Module";

    }
  }


  if (req.body.termin_name != '' && req.body.termin_datum != '') {


    var neuesDatum =
      req.body.termin_datum[6] +
      req.body.termin_datum[7] +
      req.body.termin_datum[8] +
      req.body.termin_datum[9] +
      req.body.termin_datum[3] +
      req.body.termin_datum[4] +
      req.body.termin_datum[0] +
      req.body.termin_datum[1];


    await sequelize
      .query(' call new_termin(:bezeichnung, :datum, :id)', {
        replacements: {
          id: sess.nutzer.id,
          bezeichnung: req.body.termin_name,
          datum: parseInt(neuesDatum)
        }
      });
  }

  res.redirect('/users/dashboard#' + sess.hash);

});
//Dashboard
router.get('/dashboard', async (req, res) => {
  sess = req.session;

  if (sess.nutzer.benutzername == null) {
    res.redirect('../../login')
  } else {


    var students = await Student.findAll();

    var termine = await sequelize
      .query(' call all_termins_student(:id)', {
        replacements: {
          id: sess.nutzer.id
        }
      });

    console.log("Deine Termine: " + termine);

    var noten = await sequelize
      .query(' call all_grades_student(:id)', {
        replacements: {
          id: sess.nutzer.id

        }
      });

    var ges_note = await sequelize
      .query(' call ges_note_student(:id)', {
        replacements: {
          id: sess.nutzer.id
        }
      });

    var semesters_studiengang = await sequelize
      .query(' call all_semesters_studiengang(:id)', {
        replacements: {
          id: sess.studiengang[0].id
        }
      });



    var moduls_studiengang = await sequelize
      .query(' call all_moduls_studiengang(:studiengangs_id)', {
        replacements: {
          studiengangs_id: sess.studiengang[0].id
        }
      });



    var pruefungs_studiengang = await sequelize
      .query(' call all_pruefungsinformationen_studiengang(:studiengangs_id)', {
        replacements: {
          studiengangs_id: sess.studiengang[0].id
        }
      });


    var moduls = await sequelize
      .query(' call all_moduls_student(:id)', {
        replacements: {
          id: sess.nutzer.id

        }
      });


    res.render('dashboard', {
      students: students,
      student: sess.nutzer,
      termine: termine,
      studiengang: sess.studiengang,
      noten: noten,
      moduls: moduls,
      ges_note: ges_note,
      semesters_studiengang: semesters_studiengang,
      moduls_studiengang: moduls_studiengang,
      pruefungs_studiengang: pruefungs_studiengang
    });


  }

});


//Dashboard Dozent
router.get('/dashboard_dozent', (req, res) => {
  let sess = req.session;

  if (sess.nutzer.benutzername == null) {
    res.redirect('../../login')
  } else {

    res.render('dashboard_dozent', {
      nutzername: sess.nutzer.benutzername,
      nutzerid: sess.nutzer.id,
      students: students,
      student: sess.nutzer

    });

  }
});


module.exports = router;