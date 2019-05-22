const express = require('express');
const expressLayouts = require('express-ejs-layouts');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var sequelize = require('sequelize');
var passport = require('passport');
var jwt = require('jsonwebtoken');
var hookJWTStrategy = require('./services/passportStrategy');
var config = require('./config');
const app = express();


///EJS
app.use(expressLayouts);
app.set('view engine', 'ejs');

//Bodyparser
app.use(express.urlencoded({extended: false}));
app.use(bodyParser.json());

// 5: Hook up the HTTP logger.
app.use(morgan('dev'));

// Hook up Passport.
app.use(passport.initialize());

// Hook the passport JWT strategy.
hookJWTStrategy(passport);


//Routes
app.use('/', require('./routes/index'));
app.use('/users', require('./routes/users'));
app.use(passport.initialize());

//Set the static files location.
app.use(express.static(__dirname + '../../public'));

//Home route.
app.get('/', function(req, res) {
    res.send('Nice meeting you wizard, I\'m Gandalf!');
});


//Connection

// console.log(config);

const db = mysql.createConnection(config.db);


//  db.connect((err)=>{
//     if(err){
//           throw err;
//       }
//        console.log('MySql connected...');
//   });

//  console.log(db);

//  db.connect(function(err) {
//     if (err) throw err;
//     db.query("SELECT * FROM student", function (err, result, fields) {
//       if (err) throw err;
//       console.log(result);
//     });
//   });

const PORT = process.env.PORT || 5000;
app.listen(PORT, console.log(`Server started on port ${PORT}`));