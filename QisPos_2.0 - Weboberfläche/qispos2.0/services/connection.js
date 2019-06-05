'use strict';

var mysql = require('mysql');
var config = require('../config');

const databaseConnection = mysql.createConnection(config.db);

exports.create_connection = function () {

  console.log(config);
  databaseConnection.connect((err) => {
  if (err) {
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});
return databaseConnection;
};