<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <p class="font-navy"><b>새로 들어온 주문</b></p>
<div class="accordion" id="accordion">
<c:choose>
	<c:when test="${empty sellerOrderInfoList}">
	새로 들어온 주문이 없습니다.
	</c:when>
	<c:otherwise>
		<input type="checkbox" id="collapse">펼쳐보기
	</c:otherwise>
</c:choose>
<c:forEach var="item" items="${sellerOrderInfoList }">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${item.order_no }" aria-expanded="false" aria-controls="collapse${item.order_no }">
          ${item.recipient}님의 주문서
        </button>
      </h2>
      <fmt:formatDate value="${item.order_time }" pattern="MM월 dd일 HH:mm"/>
      <a href="${contextPath }/mypage/sell/${item.order_no}/1" class="finished">완료</a>
    </div>

    <div id="collapse${item.order_no }" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      	<table class="table table-sm">
	      <thead>
	        <tr class="th">
	          <th>상품명</th>
	          <th>상품 가격</th>
	          <th>수량</th>
	          <th>전달 사항</th>
	          <th>주문 상태</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="goods" items="${item.list}">
	        <tr>
	          <td>${goods.goods_name }</td>
	          <td>${goods.goods_price }</td>
	          <td>${goods.amount }</td>
	          <td>${goods.memo }</td>
	          <td>주문 완료</td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
      	<table class="table table-sm">
	      <thead>
	        <tr class="th">
	          <th></th>
	          <th>배송 정보</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
			  <th>수령인</th>
	          <td><input type="text" name="recipient" value="${item.recipient }" readonly></td>
	        </tr>
	        <tr>
			  <th>연락처</th>
	          <td><input type="text" name="phone1" value="0${item.phone1 }" size="1" readonly>-
	          	<input type="text" name="phone2" value="${item.phone2 }" size="2" readonly>-
	          	<input type="text" name="phone3" value="${item.phone3 }" size="2" readonly></td>
	        </tr>
	        <tr>
			  <th>배송지</th>
	          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
	          	<input type="text" name="address" value="${item.address } ${item.detail_address }" readonly>
	          </td>
	        </tr>
	        <tr>
			  <th>요구사항</th>
	          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
	        </tr>
	      </tbody>
    	</table>
      </div>
    </div>
  </div>
</c:forEach>
<p class="font-navy"><b>완료된 주문</b></p>
<c:if test="${empty finishedOrderList}">
	완료된 주문이 없습니다.
</c:if>
<c:forEach var="item" items="${finishedOrderList }">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${item.order_no }" aria-expanded="false" aria-controls="collapse${item.order_no }">
          ${item.recipient}님의 주문서
        </button>
      </h2>
      <fmt:formatDate value="${item.order_time }" pattern="MM월 dd일 HH:mm"/>
      <a href="${contextPath }/mypage/sell/${item.order_no}/0" class="finished">완료취소</a>
    </div>

    <div id="collapse${item.order_no }" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      	<table class="table table-sm">
	      <thead>
	        <tr class="th">
	          <th>상품명</th>
	          <th>상품 가격</th>
	          <th>수량</th>
	          <th>전달 사항</th>
	          <th>주문 상태</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="goods" items="${item.list}">
	        <tr>
	          <td>${goods.goods_name }</td>
	          <td>${goods.goods_price }</td>
	          <td>${goods.amount }</td>
	          <td>${goods.memo }</td>
	          <td>주문 완료</td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
      	<table class="table table-sm">
	      <thead>
	        <tr class="th">
	          <th></th>
	          <th>배송 정보</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
			  <th>수령인</th>
	          <td><input type="text" name="recipient" value="${item.recipient }" readonly></td>
	        </tr>
	        <tr>
			  <th>연락처</th>
	          <td><input type="text" name="phone1" value="0${item.phone1 }" size="1" readonly>-
	          	<input type="text" name="phone2" value="${item.phone2 }" size="2" readonly>-
	          	<input type="text" name="phone3" value="${item.phone3 }" size="2" readonly></td>
	        </tr>
	        <tr>
			  <th>배송지</th>
	          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
	          	<input type="text" name="address" value="${item.address } ${item.detail_address }" readonly>
	          </td>
	        </tr>
	        <tr>
			  <th>요구사항</th>
	          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
	        </tr>
	      </tbody>
    	</table>
      </div>
    </div>
  </div>
</c:forEach>
</div>
<script>
$("#collapse").click(function() {
	var collapse = $('.collapse');
	if($(this).is(':checked')){
		collapse.addClass('show');
	}else{
		collapse.removeClass('show');
	}
})
</script>