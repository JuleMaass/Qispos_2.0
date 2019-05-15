var mysql = require('mysql');
var http = require('http');
var dt = require('./myfirstmodule');
var url = require ('url');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Test123Jugend13",
  database: "mynewdb"
});



http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    var q = url.parse(req.url, true).query;
      var txt = q.year + " " + q.month;
  
    res.write("The date and time are currently: " +dt.myDateTime());
    res.write("runs..");
    res.end(txt);
  }).listen(8080);

  
con.connect(function(err) {
    if (err) throw err;
    con.query("SELECT id, bezeichnung FROM klausur", function (err, result, fields) {
      if (err) throw err;
      res.write(fields[1].name);
    });
  
  });
  
  