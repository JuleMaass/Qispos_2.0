var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');





const Model = Sequelize.Model;


class Student extends Model {}


Student.init({
    benutzername:{
        type: Sequelize.STRING,
        allowNull: false
    },
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true 
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
    },
    matrikelnummer: {
        type: Sequelize.STRING,
        allowNull: true,
        unique: true
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'student'
 

});



module.exports = Student;



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