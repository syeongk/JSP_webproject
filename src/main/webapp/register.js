var noId = false;
var noPw = false;
var noName = false;
var noPhone = false;
var noEmail = false;

var regExpId = /^[a-z][a-z0-9]{4,11}$/;
var regExpName = /^[가-힣]{2,7}$/;
var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
function registerOnEnter(event) {
    if (event.keyCode === 13) { 
    	checkMember();
    }
}

function checkMember(){
	
	var idError = document.getElementById("id-error");		
	var passwdError = document.getElementById("passwd-error");
	var nameError = document.getElementById("name-error");
	var phoneError = document.getElementById("phone-error");
	var emailError = document.getElementById("email-error");
	
	
	var form = document.getElementById("regi-member");

	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var phone = form.phone.value;
	var email = form.email.value;
	
	if (!regExpId.test(id)) {
		idError.style.height = "20px";
		noId = true;
	}
	else {
		idError.style.height = "0px";
		noId = false;
	}
	
	if (!regExpPasswd.test(passwd)) {
		passwdError.style.height = "20px";
		noPw = true;
	} 
	else {
		passwdError.style.height = "0px";
		noPw = false;
	}
	
	if (!regExpName.test(name)) {
		nameError.style.height = "20px";
		noName = true;
	} 
	else {
		nameError.style.height = "0px";
		noName = false;
	}
	
	if (!regExpPhone.test(phone)) {
		phoneError.style.height = "20px";
		noPhone = true;
	}
	else {
		phoneError.style.height = "0px";
		noPhone = false;
	}
	
	if (!regExpEmail.test(email)) {
		emailError.style.height = "20px";
		noEmail = true;
	} 
	else {
		emailError.style.height = "0px";
		noEmail = false;
	}
	
	if (noEmail)
		form.email.select();
	if (noPhone)
		form.phone.select();
	if (noName)
		form.name.select();
	if (noPw)
		form.passwd.select();
	if (noId)
		form.id.select();
	
	if (!noId && !noPw && !noName && !noPhone && !noEmail)	
		form.submit();
}

document.addEventListener("DOMContentLoaded", function () {
	
	var idError = document.getElementById("id-error");		
	var passwdError = document.getElementById("passwd-error");
	var nameError = document.getElementById("name-error");
	var phoneError = document.getElementById("phone-error");
	var emailError = document.getElementById("email-error");
	
    var registerButton = document.getElementById("registerButton");
    var regiBackground = document.getElementById("regi-background");
    var registerModal = document.getElementById("registerModal");
    var registerClose = document.getElementById("registerClose");

    registerButton.addEventListener("click", function () {
        regiBackground.style.display = "block";
        registerModal.style.display = "block";
        
        setTimeout(function() {
			regiBackground.style.opacity = "1";
			registerModal.style.opacity = "1";
		}, 10)
		document.getElementById("regi-input-id").focus();
    });

    registerClose.addEventListener("click", function () {
        regiBackground.style.opacity = "0";
		registerModal.style.opacity = "0";
		setTimeout(function() {
			regiBackground.style.display = "none";
        	registerModal.style.display = "none";
        	
        	idError.style.height = "0px";
	        passwdError.style.height = "0px";
	        nameError.style.height = "0px";
	        phoneError.style.height = "0px";
	        emailError.style.height = "0px";
		}, 500)
    });

    regiBackground.addEventListener("click", function () {
		regiBackground.style.opacity="0";
		registerModal.style.opacity="0"
		setTimeout(function() {
			regiBackground.style.display = "none";
        	registerModal.style.display = "none";
        	
	        idError.style.height = "0px";
   			passwdError.style.height = "0px";
	        nameError.style.height = "0px";
	        phoneError.style.height = "0px";
	        emailError.style.height = "0px";
		}, 500)
    });
});