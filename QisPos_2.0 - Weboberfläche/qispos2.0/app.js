const express = require('express');
const session = require('express-session');
const expressLayouts = require('express-ejs-layouts');
var bodyParser = require('body-parser');

var Student = require('./models/Student');



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
app.use(express.urlencoded({extended: true}));
app.use(bodyParser.json());

get_breadcrumbs = function(url) {
  var rtn = [{name: "HOME", url: "/"}],
      acc = "", // accumulative url
      arr = url.substring(1).split("/");

  for (i=0; i<arr.length; i++) {
      acc = i != arr.length-1 ? acc+"/"+arr[i] : null;
      rtn[i+1] = {name: arr[i].toUpperCase(), url: acc};
  }
    return rtn;
};

app.use(function(req, res, next) {
  req.breadcrumbs = get_breadcrumbs(req.originalUrl);
  next();
});


//Routes
app.use('/', require('./routes/index'));
app.use('/users', require('./routes/users'));


//Set the static files location.
app.use(express.static('public'))



const PORT = process.env.PORT || 5000;
app.listen(PORT, console.log(`Server started on port ${PORT}`));


