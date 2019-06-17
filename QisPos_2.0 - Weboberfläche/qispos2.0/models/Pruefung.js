var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');

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
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'pruefung'
 

});

module.exports = Pruefung;
