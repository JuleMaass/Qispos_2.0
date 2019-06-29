const express = require("express");
const router = express.Router();
var sequelize = require("../services/sequelize");
var Student = require("../models/Student");
var Dozent = require("../models/Dozent");
var Studiengang = require("../models/Studiengang");
const bcrypt = require("bcrypt");

var sess;

// Start, goes to Welcome Page
router.get("/", (req, res) => res.redirect("welcome"));

// Welcome Page
router.get("/welcome", async (req, res) => {
  
  sess = req.session;


  if(sess.nutzer != null) {
    res.redirect("/users/dashboard"+ "#Termine");
  } else {
  
  res.render("welcome")}
}
  
  );

//Register Page/view
router.get("/register", async (req, res) => {
  var studiengangs = await Studiengang.findAll();

  // var students = await Student.findAll();
  // for (i = 0; i < students.length; i++) {
  //     var password = await  bcrypt.hash(students[i].PW, 10);
  //     console.log(password)
  //     students[i].update({
  //         PW: password
  //     });
  // }

  res.render("register", {
    studiengangs
  });
});

//Register handle
router.post("/register", async (req, res) => {
  const { vorname, nachname, studiengang, PW } = req.body;
  let errors = [];

  //check requires fields
  if (!PW || !vorname || !nachname) {
    errors.push({
      msg: "Please fill in all fields"
    });
  }
  if (errors.length > 0) {
    res.render("register", {
      errors,
      vorname,
      nachname,
      PW
    });
  } else {
    var buchstabenanzahl = 1;
    var benutzername = vorname.substring(0, buchstabenanzahl) + nachname;
    var test;
    do {
      var test = await Student.findOne({
        where: {
          benutzername: benutzername.toLowerCase()
        }
      });
      if (test != null) {
        buchstabenanzahl++;
        benutzername = (
          vorname.substring(0, buchstabenanzahl) + nachname
        ).toLowerCase();
      }
    } while (test != null);

    var studiengang_id = await Studiengang.findOne({
      where: {
        bezeichnung: studiengang
      }
    });

    var hashedPassword = await bcrypt.hash(PW, 10);
    var email = benutzername.toLowerCase() + "@hs-bremen.de";

    var result = await Student.create({
      benutzername: benutzername.toLowerCase(),
      email: email,
      PW: hashedPassword,
      vorname: jsUcfirst(vorname.toLowerCase()),
      nachname: jsUcfirst(nachname.toLowerCase())
    });

    Student.update(
      {
        matrikelnummer: result.id + 40000
      },
      {
        where: {
          id: result.id
        }
      }
    );

    await sequelize.query(
      " call new_student_has_studiengangs(:student_id, :studiengangs_id)",
      {
        replacements: {
          student_id: result.id,
          studiengangs_id: studiengang_id.id
        }
      }
    );

    res.render("emailSent", {
      Benutzername: benutzername.toLowerCase(),
      Name: vorname
    });
  }
});

//Login Page
router.get("/login", (req, res) => {
  
  
  sess = req.session;

  if(sess.nutzer != null) {
    res.redirect("/users/dashboard"+ "#Termine");
  } else {


 
  res.render("login", {
    error: ""
  })

}
}
 
);

//Login handle
router.post("/login", async (req, res) => {
  let sess = req.session;
  const { benutzername, password, dozent } = req.body;
  let errors = [];

  //check requires fields
  if (!benutzername || !password) {
    errors.push({
      msg: "Please fill in all fields"
    });
  }

  if (dozent) {
    var result = await Dozent.findOne({
      where: {
        benutzername: benutzername
      }
    });
    if (result != null) var answer = await bcrypt.compare(password, result.PW);

    if (result == null || !answer) {
      errors.push({
        msg: "Bitte geben Sie die richtigen Nutzerdaten ein."
      });
    }
    if (errors.length > 0) {
      res.render("login", {
        error: errors[0].msg
      });
    } else {
      sess.nutzer = result;
      sess.dozent = true;
      res.redirect("/users/dashboard_dozent");
    }
  } else {
    var result = await Student.findOne({
      where: {
        benutzername: benutzername
      }
    });

    if (result != null) var answer = await bcrypt.compare(password, result.PW);
    if (result == null || !answer) {
      errors.push({
        msg: "Bitte geben Sie die richtigen Nutzerdaten ein."
      });
    }
    if (errors.length > 0) {
      console.log(errors[0].msg);
      res.render("login", {
        error: errors[0].msg
      });
    } else {
      sess.hash = "Termine";
      sess.nutzer = result;
      sess.dozent = false;
      sess.studiengang = await sequelize.query(" call student_studies(:id)", {
        replacements: {
          id: sess.nutzer.id
        }
      });
      res.redirect("/users/dashboard#" + sess.hash);
    }
  }
});

function jsUcfirst(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

module.exports = router;
