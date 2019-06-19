const express = require('express');
const router = express.Router();
var sequelize = require('../services/sequelize');

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
                    benutzername: benutzername.toLowerCase()
                }
            }).then(user => {

                test = user
                if (test != null) {
                    buchstabenanzahl++;
                    benutzername = (vorname.substring(0, buchstabenanzahl) + nachname).toLowerCase();
                }
            });
        } while (test != null);



        var email = benutzername.toLowerCase() + '@hs-bremen.de'

        Student.create({
            benutzername: benutzername.toLowerCase(),
            email: email,
            PW: PW,
            vorname: jsUcfirst(vorname.toLowerCase()),
            nachname: jsUcfirst(nachname.toLowerCase()),
        }).then((result) => {

            Student.update({
                matrikelnummer: result.id + 40000
            }, {
                where: {
                    id: result.id
                }
            })

            res.redirect('/login')
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
        var result = await Dozent.findOne({
            where: {
                benutzername: benutzername,
                PW: password
            }
        });

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
            sess.dozent = true;
            res.redirect('/users/dashboard_dozent');
        }


    } else {
        var result = await Student.findOne({
            where: {
                benutzername: benutzername,
                PW: password
            }
        });

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
            sess.hash = "Noten";


            sess.nutzer = result;
            sess.dozent = false;
   

            sess.studiengang = await sequelize
                .query(' call student_studies(:id)', {
                    replacements: {
                        id: sess.nutzer.id
                    }
                });


            res.redirect('/users/dashboard#' + sess.hash);


        }





    }

});


function jsUcfirst(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}




module.exports = router;