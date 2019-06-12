var Sequelize = require('sequelize');
var sequelize = require('../services/sequelize');





const Model = Sequelize.Model;


class Student_belegt_modul extends Model {}


Student_belegt_modul.init({
    student_id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    modul_id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    klausur_id:{
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false
    },
    note:{
        type: Sequelize.STRING,
        allowNull: true
    },
    versuch: {
        type: Sequelize.STRING,
        allowNull: false
    },
    credits: {
        type: Sequelize.STRING,
        allowNull: true
    }
}, {
  sequelize,
  timestamps: false,
  modelName: 'student_belegt_modul'
 

});



module.exports = Student_belegt_modul;



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