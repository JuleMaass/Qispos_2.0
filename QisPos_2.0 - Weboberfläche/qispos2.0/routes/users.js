'use strict';

const express = require('express');
const router = express.Router();
var db = require('../services/connection');



// Welcome Page für nicht eingeloggte
router.get('/', (req, res) => res.redirect('../login'));

router.post('/navheader', (req, res) => {

  console.log("Es hat funktioniert");
});



//Logout Page/view
router.get('/logout', (req, res) => res.redirect('../welcome'));




//Dashboard
router.get('/dashboard', (req, res) => {
  let sess = req.session;

  if (sess.nutzername == null) {
    res.redirect('../login')
  } else {

    res.render('dashboard', {
      nutzername: sess.nutzername,
      nutzerid: sess.nutzerid

    });

  }
});

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