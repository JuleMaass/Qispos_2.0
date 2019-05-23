const express = require('express');
const router = express.Router();
var mysql = require('mysql');
var config = require('../config');


const db = mysql.createConnection(config.db);

db.connect((err) => {
  if (err) {
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});



//Login Page/view
router.get('/login', (req, res) => res.render('login', {
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

  var sqlabfrage = "SELECT benutzername FROM student WHERE email = ? AND PW = ?;";
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
      res.render('dashboard', {
        user: nutzername
      })
    }
  });

  

});


module.exports = router;