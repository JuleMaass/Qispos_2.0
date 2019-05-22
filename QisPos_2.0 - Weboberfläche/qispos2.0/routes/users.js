const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const passport = require('passport');
var mysql = require('mysql');
var config = require('../config');

var test;

const db = mysql.createConnection(config.db);





//Login Page/view
router.get('/login', (req, res) => res.render('login'));

//Register Page/view
router.get('/register', (req, res) => res.render('register'));

//Register handle
router.post('/register', (req, res) => {
  const {benutzername, id, email, PW } = req.body;
  let errors = [];

  //check requires fields
  if(!benutzername || !id || !email || !PW ){
    errors.push({msg: 'Please fill in all fields'});

  }
if(errors.legth > 0){
res.render('register', {
  errors,
  benutzername,
  id,
  email,
  PW
})
}else{
  res.send('pass')
}
 
});


//Login handle
router.post('/login', (req, res) => {

    const {email, password } = req.body;
  let errors = [];

  // //check requires fields
  // if(!email || !password ){
  //   errors.push({msg: 'Please fill in all fields'});

    db.connect(function(err) {
      if (err) throw err;
      var sqlabfrage = "SELECT benutzername FROM student WHERE email = ? AND PW = ?;";
      db.query(sqlabfrage,[email,password],(err, result)=> {
        if (err) {
          res.render('login', {
              errors,
              email,
              password
            });
        };

        test = result[0].benutzername;
        res.render('dashboard', {
          user: test
        })
      });
    });

  
// if(errors.legth > 0){
// res.render('login', {
//   errors,
//   email,
//   password
// })
// }else{

// }
});



// Dashboard
router.get('/dashboard', (req, res) =>
  res.render('dashboard', {
    user: req.user
  })
);

module.exports = router;