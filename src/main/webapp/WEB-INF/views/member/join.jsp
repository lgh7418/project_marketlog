<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>

<div class="content-block">
  <div class="join-form">
    <form method="post" action="${contextPath}/member/join.do">
        <table class="join-table">
            <tr><td><label for="inputName">이름</label></td></tr>
            <tr><td><input type="text" name="member_name" id="inputName" class="form-control" placeholder="full name" autofocus></td></tr>
            <tr><td><label for="inputEmail">이메일</label></td> </tr>
            <tr><td><input type="email" name="email_id" class="form-control" id="inputEmail" placeholder="email address"></td></tr>
            <tr><td><label for="inputPassword">비밀번호</label></td></tr>
            <tr><td><input type="password" name="member_pw" class="form-control" id="inputPassword" placeholder="password"></td></tr>
            <tr><td><label for="inputPasswordCheck">비밀번호 확인</label></td></tr>
            <tr><td><input type="password" name="member_pwck" class="form-control" id="inputPasswordCheck" placeholder="confirm password"></td></tr>
            <tr></tr>
            <tr><td><button type="button" class="btn btn-primary" onclick="validate()">회원가입</button></td></tr>
        </table>
    </form>
  </div>
  </div>
</body>
<script>
function validate() {
	var id = document.getElementById("inputEmail");
	var pw = document.getElementById("inputPassword");
	var pwck = document.getElementById("inputPasswordCheck");

     if(pw.value != pwck.value) {
    	 alert("비밀번호가 다릅니다.");
     }else {
    	 $('#join-form').submit();
     }
}
</script>
</html>