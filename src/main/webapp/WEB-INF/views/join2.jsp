<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>

<div class="content-block">
  <div class="join-form">
    <form>
        <table class="join-table">
            <tr><td><label for="inputName">이름</label></td></tr>
            <tr><td><input type="text" id="inputName" class="form-control" placeholder="이름을 입력하세요" autofocus></td></tr>
            <tr><td><label for="inputEmail">이메일</label></td> </tr>
            <tr><td><input type="email" class="form-control" id="inputEmail" placeholder="이메일을 입력하세요"></td></tr>
            <tr><td><label for="inputPassword">비밀번호</label></td></tr>
            <tr><td><input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력하세요"></td></tr>
            <tr><td><label for="inputPasswordCheck">비밀번호 확인</label></td></tr>
            <tr><td><input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호를 입력하세요"></td></tr>
            <tr></tr>
            <tr><td><button type="submit" class="btn btn-primary">회원가입</button></td></tr>
        </table>
    </form>
  </div>
  </div>
</body>
</html>