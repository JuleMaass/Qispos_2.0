'use strict';
var sequelize = require('../services/sequelize');
const express = require('express');
const router = express.Router();
var Student = require('../models/Student');
var url = require('url');
var sess;


// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));



//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));



router.post('/dashboard', async (req, res) => {
  sess = req.session;


  console.log(req.body);
  

  sess.hash = req.body.hash;


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
    

    var neuesDatum =
    req.body.termin_datum[6] +
    req.body.termin_datum[7] +
    req.body.termin_datum[8] +
    req.body.termin_datum[9] +
    req.body.termin_datum[3] +
    req.body.termin_datum[4] +
    req.body.termin_datum[0] +
    req.body.termin_datum[1];

console.log(neuesDatum);
 
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
      ges_note: ges_note
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