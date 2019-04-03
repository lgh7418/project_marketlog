<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MarketLog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>
  <header class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    	<a class="navbar-brand" href="${contextPath}/main/home" ><img src="${contextPath }/resources/images/logo.png" alt="logo" width="230px"></a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
			<span class="navbar-toggler-icon"></span>
		</button>	
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${empty member_no}">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/member/login">로그인</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/mypage/mypage">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/buyer/input">구매하기</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/seller/input">판매하기</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">QnA</a>
				</li>
			</ul>
		</div>	
  </header>
