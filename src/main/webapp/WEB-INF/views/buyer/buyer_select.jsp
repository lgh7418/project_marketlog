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
							<button type="button" class="dropdown-item">
								<span class="name">${goods.goods_name }</span>
								<span class="price">${goods.goods_price }</span>
							</button>
						</c:forEach>
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>
				<!-- 전하실 말씀은 텍스트 버튼으로 만들어서 버튼 클릭하면 추가할 수 있도록 -->
				<!-- <input type="hidden" class="form-control form-control-sm" placeholder="요청 사항"> -->
				<table id="table">
				</table>
				<div id="buy-block" style="display: none">
				<div class="buy-block" >
					<div class="amount-box">
						<input type="text" class="amount" value="1">
						<div class="amount-btn-box">
							<button class="btn-up" onclick="up()"><i class="fas fa-angle-up"></i></button>
							<button class="btn-down" onclick="down()"><i class="fas fa-angle-down"></i></button>
						</div>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="check">
						<label class="form-check-label" for="check">
							전달 사항
						</label>
					</div>
				</div>
				</div>
				<a class="btn btn-primary" href="/buyer/buyer_shipping" role="button">주문하기</a>
			</div>
		</aside>
	</div>
</div>
<script>
	// 수량 버튼 이벤트
  	 function up() {
  		var input = event.currentTarget.parentElement.parentElement.firstElementChild;
  		var amount = parseInt(input.value);
  		input.value = amount + 1;
	}
	function down() {
  		var input = event.currentTarget.parentElement.parentElement.firstElementChild;
  		var amount = parseInt(input.value);
		if(amount>1) {
			input.value = amount - 1;
		}
	}
	// 옵션 버튼 이벤트
	$(".dropdown-item").click(function() {
		var name = $(this).children('.name').text();
		var price = $(this).children('.price').text();
		var block = document.querySelector("#buy-block");
		$("#table").append('<tr><td><input type="text" name="goods_name" class="gname" value="'+name+'" disabled>'
		+ '<input type="text" name="goods_price" class="gprice" value="'+price+'" disabled></td></tr>'
		+ '<tr><td>'+block.innerHTML+'</td></tr>'
		+ '<tr style="display:none"><td>추가</td><tr>');
	});

	// 작동 안함
	$('.dropdown-menu').click(function(e) {
	    e.stopPropagation();
	});
	// 체크박스 체크 이벤트
	$("#table").delegate('.form-check-input','click', function(){
		if($(this).is(':checked')){
			$(this).parents("tr").next().css("display", "block");
		}else{
			// 최종 display:none이면 값을 null로 설정
			$(this).parents("tr").next().css("display", "none");
		}
	});
	
	// 이름을 리스트 형식으로 재설정
	  function rename(elements) {
	  for (var i=0; i<elements.length; i++) {
		    elements[i].name = "list["+ i+"]."+elements[i].name;
		}
  }
</script>
</body>
</html>