var noId = false;
var noPw = false;	

function loginAttempt(){
	var form = document.getElementById("login-member");
	var loginIdError = document.getElementById("login-id-error");
	var loginPasswdError = document.getElementById("login-passwd-error");
	

	if (form.id.value == ""){
		noId = true;
		loginIdError.style.height = "20px";
	}
	else {
		noId = false;
		loginIdError.style.height = "0px";
	}
	if (form.passwd.value == ""){
		noPw = true;
		loginPasswdError.style.height = "20px";
	}
	else {
		noPw = false;
		loginPasswdError.style.height = "0px";
	}	
	
	if (noPw) form.passwd.select();
	if (noId) form.id.select();

	if (!noId && !noPw) 
		form.submit();
}

function loginOnEnter(event) {
    if (event.keyCode === 13) {  
    	loginAttempt();
    }
}

function modifyOnEnter(event) {
    if (event.keyCode === 13) { 
    	modifyAttempt();
    }
}    
   
document.addEventListener("DOMContentLoaded", function () {
    var loginButton = document.getElementById("loginButton");
    var loginBackground = document.getElementById("login-background");
    var loginModal = document.getElementById("loginModal");
    var loginClose = document.getElementById("login-close");
	var loginIdError = document.getElementById("login-id-error");
	var loginPasswdError = document.getElementById("login-passwd-error");
    
    loginButton.addEventListener("click", function () {
        loginBackground.style.display = "block";
        loginModal.style.display = "block";
        setTimeout(function() {
			loginBackground.style.opacity = "1";
			loginModal.style.opacity = "1";
		}, 10)
		document.getElementById("login-input-id").focus();
    });

    loginClose.addEventListener("click", function () {
        loginBackground.style.opacity = "0";
		loginModal.style.opacity = "0";
        
        setTimeout(function() {
			loginIdError.style.height = "0px";
			loginPasswdError.style.height = "0px";
			
			loginBackground.style.display = "none";
        	loginModal.style.display = "none";
		}, 500)
    });
    
    loginBackground.addEventListener("click", function () {
        loginBackground.style.opacity = "0";
		loginModal.style.opacity = "0";
        
        setTimeout(function() {
			loginIdError.style.height = "0px";
			loginPasswdError.style.height = "0px";
			
			loginBackground.style.display = "none";
        	loginModal.style.display = "none";
		}, 500)
    });
});