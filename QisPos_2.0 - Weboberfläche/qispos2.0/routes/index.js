const express = require('express');
const router = express.Router();
var db = require('../services/connection');

var Student = require('../models/Student');


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


        var buchstabenanzahl = 1;
        var benutzername = vorname.substring(0, buchstabenanzahl) + nachname;
        var test;
        do {

            // search for attributes
            Student.findOne({
                where: {
                    benutzername: benutzername
                } 
            }).then(user => {

                test = user
                if (test != null) {
                    buchstabenanzahl++;
                    benutzername = vorname.substring(0, buchstabenanzahl) + nachname;
                }
            });
        } while (test != null);



        var id;
        Student.findAndCountAll().then(result => {
            id = result.count;
            var email = benutzername + '@hs-bremen.de'

            Student.create({
                benutzername: benutzername.toLowerCase(),
                email: email.toLowerCase(),
                PW: PW,
                vorname: vorname.toLowerCase(),
                nachname: nachname.toLowerCase(),
                matrikelnummer: 50000+ id
            }).then(() => {
                res.redirect('/login')
            });
        });

    }

});
//Login Page/view
router.get('/login', (req, res) => res.render('login', {

    error: ''
}));


//Login handle
router.post('/login', async (req, res) => {
    let sess = req.session;

    const {
        benutzername,
        password,
        dozent
    } = req.body;
    let errors = [];

    //check requires fields
    if (!benutzername || !password) {

        errors.push({
            msg: 'Please fill in all fields'
        });
    }




    if (dozent) {
        Dozent.findOne({
            where: {
                benutzername: benutzername,
                PW: password
            }
        }).then(result => {
    
            if (result == null) {
                errors.push({
                    msg: 'Bitte geben Sie die richtigen Nutzerdaten ein.'
                });
            }
    
            if (errors.length > 0) {
    
        
    
                console.log(errors[0].msg)
                res.render('login', {
                    error: errors[0].msg
                })
            } else {
    
    
                sess.nutzername = result.benutzername; 
                sess.nutzerid = result.id;
    
                if (dozent) {
                    sess.dozent = true;
                    res.redirect('/users/dashboard_dozent');
                } else {
                    sess.dozent = false;
                    res.redirect('/users/dashboard');
                }
            }
    
    
        });
    } else {
        Student.findOne({
            where: {
                benutzername: benutzername,
                PW: password
            }
        }).then(result => {
    
            if (result == null) {
                errors.push({
                    msg: 'Bitte geben Sie die richtigen Nutzerdaten ein.'
                });
            }
    
            if (errors.length > 0) {    
                console.log(errors[0].msg)
                res.render('login', {
                    error: errors[0].msg
                })
            } else {
    
                sess.nutzer = result;
    
                if (dozent) {
                    sess.dozent = true;
                    res.redirect('/users/dashboard_dozent');
                } else {
                    sess.dozent = false;
                    res.redirect('/users/dashboard');
                }
            }
    
    
        });
    }


    


    // db.query(sqlabfrage, [benutzername, password], (err, result) => {
    //     if (result[0] == null) {
    //         errors.push({
    //             msg: 'Bitte geben Sie die richtigen Nutzerdaten ein.'
    //         });
    //     }

    //     if (errors.length > 0) {

    //         // console.log(errors.length)

    //         console.log(errors[0].msg)
    //         res.render('login', {
    //             error: errors[0].msg
    //         })
    //     } else {
    //         var nutzername = result[0].benutzername;
    //         var nutzerid = result[0].id;


    //         sess.nutzername = nutzername; // equivalent to $_SESSION['email'] in PHP.
    //         sess.nutzerid = nutzerid;

    //         if (dozent) {
    //             sess.dozent = true;
    //             res.redirect('/users/dashboard_dozent');
    //         } else {
    //             sess.dozent = false;
    //             res.redirect('/users/dashboard');
    //         }
    //     }
    // });

});

module.exports = router;