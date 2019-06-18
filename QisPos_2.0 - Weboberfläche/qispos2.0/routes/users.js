'use strict';
var sequelize = require('../services/sequelize');
const express = require('express');
const router = express.Router();
var db = require('../services/connection');
var Student = require('../models/Student');

var sess;


// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));

// router.get('/dashboard', (req, res) => {

//   console.log("Es hat funktioniert");
// });


//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));




//Dashboard
router.get('/dashboard', async (req, res) => {
  sess = req.session;

  if (sess.nutzer.benutzername == null) {
    res.redirect('../login')
  } else {


    // Beispiel für einen Callable
    


   
    var students = await Student.findAll();
    var pruefungen = await sequelize
    .query(' call all_pruefung_student(:id)', {
      replacements: {
        id: sess.nutzer.id
      }
    })
    .then(
      //v => console.log(v),
    );
    var studiengang = await sequelize
    .query(' call student_studies(:id)', {
      replacements: {
        id: sess.nutzer.id
      }
    })
    .then(
      //v => console.log(v),
    );
    var noten = await sequelize
    .query(' call all_grades_student(:id)', {
      replacements: {
        id: sess.nutzer.id

      }
    })
    .then(
      //v => console.log(v),
    );
    var moduls = await sequelize
    .query(' call all_moduls_student(:id)', {
      replacements: {
        id: sess.nutzer.id

      }
    })
    .then(
      //v => console.log(v),
    );
    
    console.log(noten[0].date_col_formed)
    res.render('dashboard', {
      nutzername: sess.nutzer.benutzername,
      nutzerid: sess.nutzer.id,
      students: students,
      student: sess.nutzer,
      pruefungen: pruefungen,
      studiengang: studiengang,
     noten: noten,
     moduls: moduls
    });

    // });

  }

});


//Dashboard Dozent
router.get('/dashboard_dozent', (req, res) => {
  let sess = req.session;

  if (sess.nutzer.benutzername == null) {
    res.redirect('../login')
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