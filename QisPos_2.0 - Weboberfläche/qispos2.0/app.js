const express = require('express');
const session = require('express-session');
const expressLayouts = require('express-ejs-layouts');
var bodyParser = require('body-parser');
var morgan = require('morgan');
// var passport = require('passport');
// var passportStrategy = require('./services/passportStrategy');

var User = require('./models/User');



const app = express();

///Sessions
app.use(session({
    
    secret: "sosecret",
    saveUninitialized: false,
    resave: false

}));

app.use(function(req, res, next) {
    res.locals.user = req.session.user;
    next();
  });

///EJS
app.use(expressLayouts);
app.set('view engine', 'ejs');

//Bodyparser
app.use(express.urlencoded({extended: false}));
app.use(bodyParser.json());

// 5: Hook up the HTTP logger.
app.use(morgan('dev'));

// // Hook up Passport.
// app.use(passport.initialize());

// // Hook the passport JWT strategy.
// passportStrategy(passport);


//Routes
app.use('/', require('./routes/index'));
app.use('/users', require('./routes/users'));


//Set the static files location.
app.use(express.static(__dirname + '../../public'));



// // Find all users
// User.findAll().then(users => {
//   console.log("All users:", JSON.stringify(users, null, 4));
// });

// // Change everyone without a last name to "Doe"
// User.update({ benutzername: "kkönig" }, {
//   where: {
//     nachname: 'König'
//   }
// }).then(() => {
//   console.log("Done");
// });


//  

const PORT = process.env.PORT || 5000;
app.listen(PORT, console.log(`Server started on port ${PORT}`));


