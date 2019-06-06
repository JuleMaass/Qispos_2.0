const express = require('express');
const router = express.Router();
var db = require('../services/connection');

var User = require('../models/User');


// Welcome Page
router.get('/', (req, res) => res.redirect('welcome'));


router.get('/welcome', (req, res) => res.render('welcome'));

//Register Page/view
router.get('/register', (req, res) => res.render('register'));

//Register handle
router.post('/register', (req, res) => {
    const {
        vorname,
        nachname,
        PW
    } = req.body;
    let errors = [];

    //check requires fields
    if (!PW || !vorname || !nachname) {
        errors.push({
            msg: 'Please fill in all fields'
        });

    }
    if (errors.length > 0) {
        res.render('register', {
            errors,
            vorname,
            nachname,
            PW
        })
    } else {


        var benutzername = vorname.substring(0, 1) + nachname;
        var id;
        User.findAndCountAll().then(result => {
            id = result.count + 1;
            var email = benutzername + '@hs-bremen.de'

            User.create({
                benutzername: benutzername,
                id: id,
                email: email,
                PW: PW,
                vorname: vorname,
                nachname: nachname
            }).then(() => {
                res.redirect('/login')
            });
        });

    }
    // User.create({
    //     benutzername: benutzername,
    //     id: id,
    //     email: email,
    //     PW: PW,
    //     vorname: vorname,
    //     nachname: nachname
    // }).then(() => {
    // });
});
//Login Page/view
router.get('/login', (req, res) => res.render('login', {

    error: ''
}));


//Login handle
router.post('/login', (req, res) => {
    let sess = req.session;

    const {
        email,
        password,
        dozent
    } = req.body;
    let errors = [];

    //check requires fields
    if (!email || !password) {

        errors.push({
            msg: 'Please fill in all fields'
        });
    }

    console.log(dozent)


    if (dozent) {
        var sqlabfrage = "SELECT benutzername, id FROM dozents WHERE email = ? AND PW = ?;";
    } else {
        var sqlabfrage = "SELECT benutzername, id FROM students WHERE email = ? AND PW = ?;";
    }




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
            var nutzerid = result[0].id;


            sess.nutzername = nutzername; // equivalent to $_SESSION['email'] in PHP.
            sess.nutzerid = nutzerid;

            if (dozent) {
                sess.dozent = true;
                res.redirect('/users/dashboard_dozent');
            } else {
                sess.dozent = false;
                res.redirect('/users/dashboard');
            }
        }
    });

});

module.exports = router;