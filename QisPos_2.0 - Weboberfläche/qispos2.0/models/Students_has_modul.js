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
        allowNull: true
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'Students_has_modul'
 

});



module.exports = Students_has_modul;



// // Find all users
// User.findAll().then(users => {
//     console.log("All users:", JSON.stringify(users, null, 4));
//   });
  
//   // Create a new user
//   User.create({ firstName: "Jane", lastName: "Doe" }).then(jane => {
//     console.log("Jane's auto-generated ID:", jane.id);
//   });
  
//   // Delete everyone named "Jane"
//   User.destroy({
//     where: {
//       firstName: "Jane"
//     }
//   }).then(() => {
//     console.log("Done");
//   });
  
//   // Change everyone without a last name to "Doe"
//   User.update({ lastName: "Doe" }, {
//     where: {
//       lastName: null
//     }
//   }).then(() => {
//     console.log("Done");
//   });


 // User.create({
    //     benutzername: benutzername,
    //     id: id,
    //     email: email,
    //     PW: PW,
    //     vorname: vorname,
    //     nachname: nachname
    // }).then(() => {
    // });