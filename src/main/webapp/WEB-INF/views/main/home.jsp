<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@include file="../partials/header.jsp" %>
    <div class="home">
        <div class="container">
            <h1 class="logo">편리한 주문, MarketLog</h1>
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