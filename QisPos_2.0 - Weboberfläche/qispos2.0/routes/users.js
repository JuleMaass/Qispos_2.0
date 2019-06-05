'use strict';

const express = require('express');
const router = express.Router();
var mysql = require('mysql');
var config = require('../config');
var connection = require('../services/connection');

const db = connection.create_connection();

router.post('/navheader', (req, res) => {

  console.log("Es hat funktioniert");
});

//Login Page/view
router.get('/login', (req, res) => res.render('login', {

  error: ''
}));

//Logout Page/view
router.get('/logout', (req, res) => res.render('login', {
  error: ''
}));

//Register Page/view
router.get('/register', (req, res) => res.render('register'));

//Register handle
router.post('/register', (req, res) => {
  const {
    benutzername,
    id,
    email,
    PW
  } = req.body;
  let errors = [];

  //check requires fields
  if (!benutzername || !id || !email || !PW) {
    errors.push({
      msg: 'Please fill in all fields'
    });

  }
  if (errors.length > 0) {
    res.render('register', {
      errors,
      benutzername,
      id,
      email,
      PW
    })
  } else {
    res.send('pass')
  }

});

//Login handle
router.post('/login', (req, res) => {
  let sess = req.session;

  const {
    email,
    password
  } = req.body;
  let errors = [];

  //check requires fields
  if (!email || !password) {

    errors.push({
      msg: 'Please fill in all fields'
    });
  }

  var sqlabfrage = "SELECT benutzername, id FROM student WHERE email = ? AND PW = ?;";
  var sqlabfrage2 = "SELECT id FROM student WHERE benutzername = sqlabfrage;";
  db.query(sqlabfrage, [email, password], (err, result) => {
    if (result[0] == null) {
      errors.push({
        msg: 'Bitte geben Sie die richtigen Nutzerdaten ein.'
      });
    }

    if (errors.length > 0) {

      // console.log(errors.length)

      console.log(errors[0].msg)
      res.render('login', {
        error: errors[0].msg
      })
    } else {
      var nutzername = result[0].benutzername;
      console.log(result[0].id);
      console.log(result[0]);
      var nutzerid = result[0].id;


      sess.nutzername = nutzername; // equivalent to $_SESSION['email'] in PHP.
      sess.nutzerid = nutzerid;

      res.redirect('/users/dashboard');

    }
  });

});

//Register Page/view
router.get('/dashboard', (req, res) => {
      let sess = req.session;

      if (sess.nutzername == null) {
        res.render('login', {
            error: ''
          });
        }
        else {

          res.render('dashboard', {
              user: sess.nutzername,
              nutzerid: sess.nutzerid

          });

      }
 } );


    //Note handle
    router.post('/note', (req, res) => {
      const {
        email,
        password
      } = req.body;
      let errors = [];

      //check requires fields
      if (!email || !password) {

        errors.push({
          msg: 'Please fill in all fields'
        });
      }

      var sqlabfrage = "SELECT benutzername, id FROM student WHERE email = ? AND PW = ?;";
      var sqlabfrage2 = "SELECT id FROM student WHERE benutzername = sqlabfrage;";
      db.query(sqlabfrage, [email, password], (err, result) => {
        if (result[0] == null) {
          errors.push({
            msg: 'Bitte geben Sie die richtigen Nutzerdaten ein.'
          });
        }

        if (errors.length > 0) {

          // console.log(errors.length)

          console.log(errors[0].msg)
          res.render('login', {
            error: errors[0].msg
          })
        } else {
          var nutzername = result[0].benutzername;
          console.log(result[0].id);
          console.log(result[0]);
          var nutzerid = result[0].id;

        }

      });

    });


    module.exports = router;