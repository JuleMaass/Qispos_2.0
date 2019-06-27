var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');





const Model = Sequelize.Model;


class Student extends Model {}


Student.init({
    benutzername:{
        type: Sequelize.STRING,
        allowNull: false
    },
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true 
    },
    email:{
        type: Sequelize.STRING,
    },
    PW:{
        type: Sequelize.STRING,
        allowNull: false
    },
    vorname: {
        type: Sequelize.STRING,
        allowNull: false
    },
    nachname: {
        type: Sequelize.STRING,
        allowNull: false
    },
    matrikelnummer: {
        type: Sequelize.STRING,
        allowNull: true,
        unique: true
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'student'
 

});



module.exports = Student;

