var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');

const Model = Sequelize.Model;


class Dozent extends Model {}

Dozent.init({
    id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    benutzername:{
        type: Sequelize.STRING,
        allowNull: false
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
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'dozent'
 

});

module.exports = Dozent;
