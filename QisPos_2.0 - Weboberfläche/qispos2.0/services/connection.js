'use strict';

var mysql = require('mysql');
var config = require('../config');

const databaseConnection = mysql.createConnection(config.db);

  // if (databaseConnection.state == "disconnected") {
    databaseConnection.connect((err) => {
      if (err) {
        console.log(err)
        console.log('Error connecting to Db');
        return;
      } 
      console.log('Connection established');
    });
  

  module.exports = databaseConnection;
  