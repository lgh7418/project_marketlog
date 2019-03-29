<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<div class="content-block">
	<div class="page-wrapper buy">
		<article>
			<iframe src="${address }" frameborder="0"></iframe>
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
						<c:forEach var="goods" items="${goodsList }">
							<input type="button" class="dropdown-item" onclick="selectOption()" value="${goods.goods_name }">
						</c:forEach>
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>
				<!-- 전하실 말씀은 텍스트 버튼으로 만들어서 버튼 클릭하면 추가할 수 있도록 -->
				<!-- <input type="hidden" class="form-control form-control-sm" placeholder="요청 사항"> -->
				<table id="table">
				</table>
				<div class="buy-block" style="display: none">
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
	<script>
		// 수량 버튼 이벤트
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
		// 옵션 버튼 이벤트
		function selectOption() {
			var name = event.target.value;
			var table = document.getElementById("table");
			var amount = document.querySelector(".amount-box");
			var check = document.querySelector(".form-check");
			var row = table.insertRow(0);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			cell1.innerHTML = "<input type='text' value='"+name+"' disabled>";
			row = table.insertRow(1);
			cell1 = row.insertCell(0);
			cell2 = row.insertCell(1);
			cell1.innerHTML = amount.innerHTML;
			cell2.innerHTML = check.innerHTML;
		}
		$('.dropdown-menu').click(function(e) {
		    e.stopPropagation();
		});
	</script>
</body>
</html>