var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');
var Student = require('../models/Student');
const Model = Sequelize.Model;


class Termin extends Model {}

Termin.init({
    id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    termin_bezeichnung:{
        type: Sequelize.STRING,
        allowNull: false
    },
    datum:{
        type: Sequelize.DATE,
    },
    erledigt:{
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    students_id: {
        type: Sequelize.INTEGER,
        references: {
          model: Student, 
          key: 'id'
        }
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'termin'
 

});

module.exports = Termin;
