<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="content-block">
  <div class="login-form">
    <form method="post" action="${contextPath}/member/loginPost">
        <table class="login-table">
            <tr><td><label for="inputEmail">이메일</label></td> </tr>
            <tr><td><input type="email" name="email_id" class="form-control" id="inputEmail" placeholder="이메일을 입력하세요" autofocus></td></tr>
            <tr><td><label for="inputPassword">비밀번호</label></td></tr>
            <tr><td><input type="password" name="member_pw" class="form-control" id="inputPassword" placeholder="Password"></td></tr>
            <tr></tr>
            <tr><td><button type="submit" class="btn btn-primary">로그인</button></td></tr>
        </table>
    </form>
  </div>
  </div>
</body>
</html>