<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@include file="../partials/header.jsp" %>
<style>
.logo-top {
	font-family: 'Handlee', cursive;
    font-size: 150px;
    font-weight: bold;
    text-shadow: 2px 2px 2px rgba(0,0,0,.5);
}
.logo-top span {
    color: #e78200;
}
.logo-bottom {
    font-family: 'Noto Sans KR', sans-serif;
    letter-spacing: 15px;
    font-size: 24px;
    font-weight: 100;
}
</style>
    <div class="home">
        <div class="container">
        	<div class="logo">
            <h1 class="logo-top"><span>M</span>arket<span>L</span>og</h1>
            <h4 class="logo-bottom">편리한 SNS마켓 주문 관리</h4>
            </div>
		<c:choose>
			<c:when test="${empty member_no}">
		        <div class="select-btn">
		            <a href="${contextPath}/member/join" class="btn btn-primary btn-lg" role="button">회원가입</a>
		            <a href="${contextPath}/member/login" class="btn btn-primary btn-lg" role="button">로그인</a>
		        </div>
	        </c:when>
			<c:otherwise>
				<div class="select-btn">
		            <a href="${contextPath}/seller/input" class="btn btn-primary btn-lg" role="button">판매하기</a>
		            <a href="${contextPath}/buyer/input" class="btn btn-primary btn-lg" role="button">구매하기</a>
		        </div>
	        </c:otherwise>
        </c:choose>
        </div>
    </div>
</body>
</html>