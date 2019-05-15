var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('responds with a resource');
});

router.get('/detail', function(req, res, next) {
  res.send('detail');
});

//localhost:8000/users/detail

module.exports = router;
