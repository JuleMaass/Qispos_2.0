require('dotenv').config({ path: 'variables.env' });

const express = require('express');
const session = require('express-session');
const expressLayouts = require('express-ejs-layouts');
var bodyParser = require('body-parser');

const webpush = require('web-push');

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


// const vapidKeys = webpush.generateVAPIDKeys();

// console.log(vapidKeys);


const publicVapidKey = process.env.PUBLIC_VAPID_KEY;

const privateVapidKey = process.env.PRIVATE_VAPID_KEY;


webpush.setVapidDetails(
  'mailto:masterbuchi@gmail.com',
  publicVapidKey,
  privateVapidKey
);

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


//Set the static files location.
app.use(express.static('public'));

//Routes
app.use('/', require('./routes/index'));
app.use('/users', require('./routes/users'));




const PORT = process.env.PORT || 5000;


app.listen(PORT, console.log(`Server started on port ${PORT}`));


