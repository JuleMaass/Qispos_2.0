var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');

const Model = Sequelize.Model;


class Modul extends Model {}

Modul.init({
    
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
    semester:{
        type: Sequelize.INTEGER,
    },
    position:{
        type: Sequelize.INTEGER,
        allowNull: false
    },
    credits: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    beschreibung: {
        type: Sequelize.STRING,
        allowNull: true
    }    
}, {
  sequelize,
  timestamps: false,
  modelName: 'modul'
 

});

module.exports = Modul;
