'use strict';

var mysql = require('mysql');
var config = require('../config');

const db = mysql.createConnection(config.db);

exports.create_connection = function () {
db.connect((err) => {
  if (err) {
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});
return db;
};