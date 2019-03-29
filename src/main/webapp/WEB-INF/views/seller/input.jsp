<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

  <div class="content-block">
    <div class="seller">
      <p>판매하실 물건이 있는 페이지의 주소를 입력하세요.</p>
      <p>예) https://blog.naver.com/s486s012&nbsp;&nbsp;</p>
      <form action="${contextPath}/seller/seller_form" method="post">
      	<div class="input-group">
        	<input type="text" name="goods_address" class="form-control" placeholder="주소 입력" aria-label="Recipient's username" aria-describedby="button-addon">
	        <div class="input-group-append">
	          <button type="submit" class="btn btn-primary b-next" id="button-addon"><i class="fas fa-arrow-right"></i></button>
	        </div>
	    </div>
      </form>
    </div>
  </div>
</body>
</html>