function login(){

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    var testTexT = document.getElementById("testText").value;

    if(username == null) {
        
        console.log("Please enter your username");

    } else if(password == null) {

        console.log("Please enter your password");

    } else {

        var title = document.getElementById("test").innerText;

        title = "Username: " + username + "\nPassword: " + password;    

    }

}