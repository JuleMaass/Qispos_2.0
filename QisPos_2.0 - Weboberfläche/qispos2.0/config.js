// Application configuration.
'use strict';

var config = module.exports;

config.db = {

    user: 'root',
    password: 'password',
    database: 'mynewdb'
};
config.db.details = {
    host: 'localhost',
    port: '3306',
    dialect: 'mysql'

};

config.keys ={
    secret: 'ThisIsOurKey'
};
