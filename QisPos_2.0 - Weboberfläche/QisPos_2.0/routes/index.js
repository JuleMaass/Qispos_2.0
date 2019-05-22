 var express = require('express');
var router = express.Router();

/* GET home page. */
/*router.get('/', function(req, res, next) {
  res.render('index', { title: 'QisPos 2.0', condition: true });
});*/

router.get('/', (req, res) => res.render('welcome'));

module.exports = router;
