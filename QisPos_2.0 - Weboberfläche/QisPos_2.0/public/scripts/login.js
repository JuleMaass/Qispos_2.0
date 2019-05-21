function login(){

    var username = document.getElementById("usernameblah").value;
    var password = document.getElementById("passwordblah").value;

    if(username == null) {
        
        console.log("Please enter your username");

    } else if(password == null) {

        console.log("Please enter your password");

    } else {

        var title = document.getElementById("test").innerText;

        title = "Username: " + username + "\nPassword: " + password;    

    }

}