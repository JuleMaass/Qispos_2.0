var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');



const Model = Sequelize.Model;


class Students_has_modul extends Model {}


Students_has_modul.init({
    students_id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    moduls_id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    
    status: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'Students_has_modul'
 

});



module.exports = Students_has_modul;
