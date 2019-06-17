var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');

const Model = Sequelize.Model;


class Studiengang extends Model {}

Studiengang.init({
    
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true 
    },
    bezeichnung:{
        type: Sequelize.STRING,
        allowNull: false
    },
    beschreibung:{
        type: Sequelize.STRING,
        allowNull: true
    },
    abschluss: {
        type: Sequelize.STRING,
        allowNull: false
    },
    creditsmin: {
        type: Sequelize.INTEGER,
        allowNull: false
    }    
}, {
  sequelize,
  timestamps: false,
  modelName: 'studiengang'
 

});

module.exports = Studiengang;
