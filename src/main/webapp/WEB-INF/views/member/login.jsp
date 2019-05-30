<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="content-block">
  <div class="login-form">
    <form id="login-form" method="post" action="${contextPath}/member/loginPost">
        <table class="login-table">
            <tr><td><label for="inputEmail">이메일</label></td> </tr>
            <tr><td><input type="email" name="email_id" class="form-control" id="inputEmail" placeholder="email address" autofocus></td></tr>
            <tr><td><label for="inputPassword">비밀번호</label></td></tr>
            <tr><td><input type="password" name="member_pw" class="form-control" id="inputPassword" placeholder="password"></td></tr>
            <tr></tr>
            <tr><td><button type="submit" class="btn btn-primary">로그인</button></td></tr>
        </table>
    </form>
  </div>
  </div>
</body>
<script>
function validate() {
	var id = document.getElementById("inputEmail");
	var pw = document.getElementById("inputPassword");
	if(id.value == "") {
		alert("이메일을 입력하세요.");
	}else if(pw.value == "") {
		alert("비밀번호를 입력하세요.");
	}elses {
		$('#login-form').submit();
	}
}
</script>
</html>