var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');





const Model = Sequelize.Model;


class Dozent extends Model {}


Dozent.init({
    benutzername:{
        type: Sequelize.STRING,
        allowNull: false
    },
    id:{
        type: Sequelize.STRING,
        primaryKey: true,
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
  modelName: 'student'
 

});



module.exports = Dozent;



// // Find all users
// Dozent.findAll().then(users => {
//     console.log("All users:", JSON.stringify(users, null, 4));
//   });
  
//   // Create a new user
//   Dozent.create({ firstName: "Jane", lastName: "Doe" }).then(jane => {
//     console.log("Jane's auto-generated ID:", jane.id);
//   });
  
//   // Delete everyone named "Jane"
//   Dozent.destroy({
//     where: {
//       firstName: "Jane"
//     }
//   }).then(() => {
//     console.log("Done");
//   });
  
//   // Change everyone without a last name to "Doe"
//   Dozent.update({ lastName: "Doe" }, {
//     where: {
//       lastName: null
//     }
//   }).then(() => {
//     console.log("Done");
//   });


 // Dozent.create({
    //     benutzername: benutzername,
    //     id: id,
    //     email: email,
    //     PW: PW,
    //     vorname: vorname,
    //     nachname: nachname
    // }).then(() => {
    // });