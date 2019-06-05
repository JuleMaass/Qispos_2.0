'use strict';

var config = require('./../config'),
    Sequelize = require('sequelize');

    module.exports = new Sequelize(
    config.db.details
    );

    