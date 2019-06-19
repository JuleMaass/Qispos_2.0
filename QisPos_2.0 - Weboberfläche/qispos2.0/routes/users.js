'use strict';
var sequelize = require('../services/sequelize');
const express = require('express');
const router = express.Router();
var db = require('../services/connection');
var Student = require('../models/Student');

var sess;


// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));



//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));


router.post('/dashboard', async (req, res) => {
  sess = req.session;

  console.log(req.body);

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


  if (req.body.termin_name != '' && req.body.termin_datum != '') {

    console.log(parseInt(req.body.termin_datum));
    await sequelize
    .query(' call new_termin(:bezeichnung, :datum, :id)', {
      replacements: {
        id: sess.nutzer.id,
        bezeichnung: req.body.termin_name,
        datum: parseInt(req.body.termin_datum)
      }
    });
  }





  res.redirect('/users/dashboard');

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

    var noten = await sequelize
      .query(' call all_grades_student(:id)', {
        replacements: {
          id: sess.nutzer.id

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
      moduls: moduls
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