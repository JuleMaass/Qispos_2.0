var Sequelize = require('sequelize');
var bcrypt = require('bcrypt');
var db = require('../services/database');

var userSchema ={
    benutzername:{
        type: Sequelize.STRING,
        allowNull: false
    },
    id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    email:{
        type: Sequelize.STRING,
    },
    PW:{
        type: Sequelize.STRING,
        allowNull: false
    }
}
//Modeloptions
var userOptions ={
    instanceMethods:{
        comparePasswords: comparePasswords
    },
    hooks:{
        beforeValidate: hashPassword
    }
};

//Define the User model
var userModel =  db.define('student', userSchema, userOptions);

//Compares two passwords
function comparePasswords(PW, callback)
{
    bcrypt.compare(PW, this.PW, function(error, isMatch) {
        if(error) {
            return callback(error);
        }

        return callback(null, isMatch);
    });
}
// Hashes the password for a user object.
function hashPassword(student) {
    if(student.changed('PW')) {
        return bcrypt.hash(student.PW, 10).then(function(PW) {
            student.PW = PW;
        });
    }
}
// module.exports = userModel;

// const user = mysql.model('user', userSchema);

