var noName = false;
var noPhone = false;
var noEmail = false;

var regExpName = /^[가-힣]{2,7}$/;
var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

function modifyOnEnter(event) {
    if (event.keyCode === 13) { 
    	modifyAttempt();
    }
}   

function modifyAttempt(){
	
	var form = document.getElementById("mypage-modify-form");

	var name = form.name.value;
	var phone = form.phone.value;
	var email = form.email.value;
	
	var nameError = document.getElementById("name-error");	
	var phoneError = document.getElementById("phone-error");
	var emailError = document.getElementById("email-error");
	
	if (!regExpName.test(name)){
		nameError.style.height = "25px"
		noName = true;
	}
	else {
		nameError.style.height = "0px"
		noName = false;
	}

	if (!regExpPhone.test(phone)){
		phoneError.style.height = "25px"
		noPhone = true;
	}
	else {
		phoneError.style.height = "0px"
		noPhone = false;
	}
	
	if (!regExpEmail.test(email)){
		emailError.style.height = "25px"
		noEmail = true;
	}
	else {
		emailError.style.height = "0px"
		noEmail = false;
	}
	
	if (noEmail)
		document.getElementById("my-email-input").focus();
	if (noPhone)
		document.getElementById("my-phone-input").focus();
	if (noName)
		document.getElementById("my-name-input").focus();
	
	if (!noName && !noPhone && !noEmail)
		form.submit();
}