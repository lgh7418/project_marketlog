<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<div class="content-block">
	<div class="page-wrapper buy">
		<article>
			<iframe src="${address }" frameborder="0"></iframe>
		</article>
		<aside>
			<div class="buy-input">
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						옵션 선택
					</a>
					
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<c:forEach var="goods" items="${goodsList }">
							<button type="button" class="dropdown-item item-click">
								<span class="name">${goods.goods_name }</span>
								<span class="price">${goods.goods_price }</span>
							</button>
						</c:forEach>
					</div>
				</div>
				<div class="buy-form">
					<form id="buy_form" action="${contextPath }/buyer/buyer_shipping" method="post">
					<table id="table">
					</table>
					<input type="hidden" name="total_price" id="total">
					</form>
				</div>
				<div id="buy-block" style="display: none">
				<div class="buy-block" >
					<div class="amount-box">
						<input type="text" name="amount" class="amount" value="1">
						<div class="amount-btn-box">
							<button type="button" class="btn-up" onclick="up()"><i class="fas fa-angle-up"></i></button>
							<button type="button" class="btn-down" onclick="down()"><i class="fas fa-angle-down"></i></button>
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
				<div class="bottom-block">
					<table>
						<tr>
							<td>배송비</td>
							<td>${goodsList[0].shipping } 원</td>
						</tr>
						<tr>
							<td>합계</td>
							<td id="sum">원</td>
						</tr>
					</table>
					<button type="button" class="btn btn-primary" onclick="formSubmit()">주문하기</button>
				</div>
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
  		total();
	}
	function down() {
  		var input = event.currentTarget.parentElement.parentElement.firstElementChild;
  		var amount = parseInt(input.value);
		if(amount>1) {
			input.value = amount - 1;
			total();
		}
	}
	// 옵션 버튼 이벤트
	$(".item-click").on('click', optionClick);
	
	function optionClick() {
		var name = $(this).children('.name').text();
		var price = $(this).children('.price').text();
		var block = document.querySelector("#buy-block");
		$(this).attr('id', name);
		$("#table").append('<tr><td><div class="delete"><button type="button" onclick="deleteRow(this)"><i class="fas fa-times"></i></button></div>'
		+ '<div class="selected-goods">'
		+ '<input type="text" name="goods_name" class="gname" value="'+name+'" readonly>'
		+ '<input type="text" name="goods_price" class="gprice" value="'+price+'" readonly> 원'
		+ '</div></td></tr>'
		+ '<tr><td>'+block.innerHTML+'</td></tr>'
		+ '<tr style="display:none"><td><input type="text" class="memo"></td></tr><td><hr></td></tr>');
		total();
		$(this).off();
		$(this).on('click', function() {
			alert('이미 선택한 옵션입니다.');
		});
	}

	// 체크박스 체크 이벤트
	$("#table").delegate('.form-check-input','click', function(){
		var $tr = $(this).parents("tr").next();
		if($(this).is(':checked')){
			$tr.css("display", "block");
			$tr.find('input').attr("name", "memo");
		}else{
			// 최종 display:none이면 값을 null로 설정
			$tr.css("display", "none");
			$tr.find('input').removeAttr("name");
		}
	});
	
	// submit 
	function formSubmit() {
		var gname = document.getElementsByClassName("gname");
	    var gprice = document.getElementsByClassName("gprice");
	    var amount = document.getElementsByClassName("amount");
	    var memo = document.getElementsByClassName("memo");
	    if(gname[0].value=="") {
	    	alert('상품을 선택하세요.');
	    	return;
	    }
 	    rename(gname);
	    rename(gprice);
	    rename(amount);
	    rename(memo);
	    document.getElementById("buy_form").submit();
	}
	
	// 이름을 리스트 형식으로 재설정
	  function rename(elements) {
	  for (var i=0; i<elements.length; i++) {
		    if(elements[i].name != null) {
		    elements[i].name = "list["+ i+"]."+elements[i].name;		    	
		    }
		}
	}
	
	// 합계
	function total() {
		var sum = document.getElementById("sum");
		var gprice = document.getElementsByClassName("gprice");
		var amount = document.getElementsByClassName("amount");
		var sumVal = 0;
		for(var i=0; i<gprice.length; i++) {
			sumVal += parseInt(gprice[i].value) * parseInt(amount[i].value);
		}
		if(sumVal != 0) {
			sumVal += ${goodsList[0].shipping};
		}else {
			sumVal = "";
		}
		sum.innerHTML = sumVal + " 원";
		$('#total').val(sumVal);
	}
	// 선택한 상품 제거
	function deleteRow(obj){
		var idVal = $(obj).parent().next().children('.gname').val();
		var id = document.getElementById(idVal);
		$(id).off();
		$(id).on('click', optionClick);
		var tr = $(obj).parents("tr");
		var tr1 = tr.next();
		var tr2 = tr1.next();
		var tr3 = tr2.next();
		tr.remove();
		tr1.remove();
		tr2.remove();
		tr3.remove();
		total();
  	}
</script>
</body>
</html>