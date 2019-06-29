var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');
var Modul = require('../models/Modul');
var Dozent = require('../models/Dozent');
const Model = Sequelize.Model;


class Pruefung extends Model {}

Pruefung.init({
    
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true 
    },
    semester:{
        type: Sequelize.INTEGER,
    },
    bezeichnung:{
        type: Sequelize.STRING,
        allowNull: false
    },

    pruefungsart:{
        type: Sequelize.STRING,
        allowNull: false
    },
    versuch: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    anmeldedatum: {
        type: Sequelize.DATE,
        allowNull: true
    },
    pruefungsdatum: {
        type: Sequelize.DATE,
        allowNull: true
    },
    nummer: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    moduls_id: {
        type: Sequelize.INTEGER,
        references: {
          model: Modul, 
          key: 'id'
        }
    },
    dozents_id: {
        type: Sequelize.INTEGER,
        references: {
          model: Dozent,
          key: 'id'
        }
    }

}, {
  sequelize,
  timestamps: false,
  modelName: 'pruefung'
 

});


module.exports = Pruefung;
