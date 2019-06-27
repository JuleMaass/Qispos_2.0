var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');



const Model = Sequelize.Model;


class Students_has_pruefung extends Model {}


Students_has_pruefung.init({
    students_id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    pruefungs_id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    
    status: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },

    note: {
        type: Sequelize.FLOAT,
        allowNull: true
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'Students_has_pruefung'
 

});



module.exports = Students_has_pruefung;
