'use strict';

const express = require('express');
const router = express.Router();
var db = require('../services/connection');
var Student = require('../models/Student');
var Student_belegt_modul = require('../models/Student_belegt_modul');



var students;
var students_done = false;
var student;
var student_done = false;
var sess;

// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));

router.post('/navheader', (req, res) => {

  console.log("Es hat funktioniert");
});



//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));




//Dashboard
router.get('/dashboard', (req, res) => {
  sess = req.session;

  if (sess.nutzername == null) {
    res.redirect('../login')
  } else {

    // var test = [];
    // Student.findAll().then(result => {

    //   test = result;

    //   for (var i = 0; i < 13; i++) {

    //     Student.update({
    //       matrikelnummer:  50000+i
    //     }, {
    //       where: {
    //         id: test[i].id
    //       }
    //     });

    //   }

      Student.findAll().then(result => {
        console.log('eins')
        students = result;
        students_done = true;
      });

      Student.findOne({
        where: {
          benutzername: sess.nutzername
        }
      }).then(result => {
        console.log('zwei')
        student = result;
        student_done = true;

      });

      warten(res);

    // });

  }

});



function warten(res) {

  if ((students_done) && (student_done)) {
    res.render('dashboard', {
      nutzername: sess.nutzername,
      nutzerid: sess.nutzerid,
      students: students,
      student: student
    });
  } else {
    setTimeout(function () {
      warten(res);
    }, 200);
  }

}

//Dashboard
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