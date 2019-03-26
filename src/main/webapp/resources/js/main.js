function validate() {
	var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
	
	var email_id = document.getElementByID("email_id");
	var member_pw = document.getElementByID("member_pw");
	var member_pwck = document.getElementByID("member_pwck");
	
	 if(!check(re,pw,"패스워드는 6~16자의 영문 대소문자, 특수문자, 숫자 포함")) {
         return false;
     }
	 
	 
}
	   