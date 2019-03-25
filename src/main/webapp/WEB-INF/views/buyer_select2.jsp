<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>

<!-- 판매자가 없는 경우 -->
<div class="container">
	<div class="row">
		<div class="col-12 col-md-8">
			<iframe src="https://m.blog.naver.com/s486s012/221464384000" class="blog-box" id="blog-box" frameborder="0"></iframe>
		</div>
		<div class="col-6 col-md-4">
			<!-- 상품명, 수량, 전하실 말씀(요구사항), 장바구니에 담기 -->
			<input type="text" class="form-control input-sm" placeholder="상품명"
				required> <span class="char"> 개</span><input type="number"
				class="form-control input-sm amount" min="0" value="1">
			<!-- 전하실 말씀은 텍스트 버튼으로 만들어서 버튼 클릭하면 추가할 수 있도록 -->
			<textarea class="form-control input-sm" rows="3" placeholder="전하실 말씀"></textarea>
		</div>
	</div>
</div>
<!-- toggle 메뉴로 장바구니 담긴 물품 보기 -->
</body>
</html>