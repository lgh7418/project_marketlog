<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>
  <div class="content-block">
    <div class="seller">
      <p>판매하실 물건이 있는 페이지의 주소를 입력하세요.</p>
      <p>예) https://blog.naver.com/s486s012&nbsp;&nbsp;</p>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="주소 입력" aria-label="Recipient's username" aria-describedby="button-addon">
        <div class="input-group-append">
          <a href="seller_form.jsp" class="btn btn-primary b-next" role="button" id="button-addon"><i class="fas fa-arrow-right"></i></a>
        </div>
	    </div>
    </div>
  </div>
</body>
</html>