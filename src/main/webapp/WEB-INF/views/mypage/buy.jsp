<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>

    	.buy-goods td:nth-child(4) {
		    width: 68px;
		    text-align: center;
		}
		.buy-goods th:nth-child(2) {
		    width: 40%;
		}
    </style>
    <p class="font-navy"><b>주문 내역</b></p>
   	<c:if test="${empty orderInfoList}">
	주문 내역이 없습니다.
	</c:if>
    <c:forEach var="item" items="${orderInfoList }">
    <p><fmt:formatDate value="${item.order_time }" pattern="yyyy.MM.dd"/></p>
    <table class="table table-sm buy-goods">
      <thead>
        <tr class="th">
          <th></th>
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
          <td class="sm"><input type="checkbox">
          <td>${goods.goods_name }</td>
          <td>${goods.goods_price }</td>
          <td>${goods.amount }</td>
          <td>${goods.memo }</td>
          <td>
          <c:choose>
         	 <c:when test="${item.order_status == 0 }">
          	주문완료
	      	</c:when>
     		 <c:when test="${item.order_status == 1 }">
	      	발송완료
	      	</c:when>
	      </c:choose>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
   <form action="${contextPath }/mypage/modifyShipping" method="post">
   <table class="table table-sm shipping-table">
      <thead>
        <tr class="th">
          <th colspan="2">배송 정보</th>
        </tr>
      </thead>
      <tbody>
        <tr>
		  <th>수령인</th>
          <td><input type="text" name="recipient" value="${item.recipient }" readonly></td>
        </tr>
        <tr>
		  <th>연락처</th>
          <td><input type="tel" name="phone1" value="0${item.phone1 }" size="1" readonly>-
          	<input type="tel" name="phone2" value="${item.phone2 }" size="2" readonly>-
          	<input type="tel" name="phone3" value="${item.phone3 }" size="2" readonly></td>
        </tr>
        <tr>
		  <th>배송지</th>
          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
          	<input type="text" name="address" value="${item.address }" readonly>
          	<input type="text" name="detail_address" value="${item.detail_address }" readonly>
          </td>
        </tr>
        <tr>
		  <th>요구사항</th>
          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
        </tr>
      </tbody>
    </table>

	    <input type="hidden" name="order_no" value="${item.order_no }">
	    <input type="submit" value="배송정보 수정">
    </form>
    </c:forEach>
