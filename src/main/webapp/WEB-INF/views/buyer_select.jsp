<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>

<div class="content-block">
	<div class="page-wrapper buy">
		<article>
				<iframe src="https://m.blog.naver.com/s486s012/221464384000" frameborder="0"></iframe>
		</article>
		<aside>
			<div class="buy-input">
			<!-- 상품명, 수량, 전하실 말씀(요구사항), 장바구니에 담기 -->
			<!-- <input type="text" class="form-control form-control-sm rounded-0" placeholder="상품명"
				required>  -->
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						옵션 선택
					</a>
					
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a>
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>
				<!-- 전하실 말씀은 텍스트 버튼으로 만들어서 버튼 클릭하면 추가할 수 있도록 -->
				<!-- <input type="hidden" class="form-control form-control-sm" placeholder="요청 사항"> -->
				<div class="buy-block">
					<div class="amount-box">
						<input type="text" id="amount" value="1">
						<div class="amount-btn-box">
							<button id="up" onclick="up()"><i class="fas fa-angle-up"></i></button>
							<button id="down" onclick="down()"><i class="fas fa-angle-down"></i></button>
						</div>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
						<label class="form-check-label" for="defaultCheck1">
							전달 사항
						</label>
					</div>
				</div>
				<a class="btn btn-primary" href="#" role="button">주문하기</a>
			</div>
		</aside>
	</div>
</div>
	<!-- toggle 메뉴로 장바구니 담긴 물품 보기 -->
	<script>
		function up() {
			var amount_input = document.getElementById("amount");
			var amount = parseInt(amount_input.value);
			amount_input.value = amount + 1;
		}
		function down() {
			var amount_input = document.getElementById("amount");
			var amount = parseInt(amount_input.value);
			if(amount>1) {
				amount_input.value = amount - 1;
			}
		}
	</script>
</body>
</html>