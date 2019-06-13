'use strict';

const express = require('express');
const router = express.Router();
var db = require('../services/connection');
var Student = require('../models/Student');
var Student_belegt_modul = require('../models/Student_belegt_modul');

var sess;


// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));

router.post('/navheader', (req, res) => {

  console.log("Es hat funktioniert");
});


//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));


//Dashboard
router.get('/dashboard', async (req, res) => {
  sess = req.session;

  if (sess.nutzer.benutzername == null) {
    res.redirect('../login')
  } else {


    var students = await Student.findAll();

    console.log("tes22t");
    res.render('dashboard', {
      nutzername: sess.nutzer.benutzername,
      nutzerid: sess.nutzer.id,
      students: students,
      student: sess.nutzer
    });

    // });

  }

});


//Dashboard Dozent
router.get('/dashboard_dozent', (req, res) => {
  let sess = req.session;

  if (sess.nutzername == null) {
    res.redirect('../login')
  } else {

    res.render('dashboard_dozent', {
      nutzername: sess.nutzername,
      nutzerid: sess.nutzerid

    });

  }
});


module.exports = router;