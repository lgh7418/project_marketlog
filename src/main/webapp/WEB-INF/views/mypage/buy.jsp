<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <p class="font-navy"><b>주문 내역</b></p>
   	<c:if test="${empty orderInfoList}">
	주문 내역이 없습니다.
	</c:if>
    <c:forEach var="item" items="${orderInfoList }">
    <p><fmt:formatDate value="${item.order_time }" pattern="yyyy.MM.dd"/></p>
    <form id="delete-form" action="${contextPath }/mypage/deleteOrder" method="post">
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
          <td><input type="text" class="gname w-100" name="goods_name" value="${goods.goods_name }" disabled></td>
          <td>${goods.goods_price }</td>
          <td>${goods.amount }</td>
          <td>${goods.memo }
          	<c:if test="${empty goods.memo }">
          		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
         	</c:if>
          </td>         
          <td>
          <c:choose>
         	 <c:when test="${item.order_status == 0 }">
         	 <input type="hidden" class="status" value="0">
          	주문완료
	      	</c:when>
     		 <c:when test="${item.order_status == 1 }">
     		 <input type="hidden" class="status" value="1">
	      	발송완료
	      	</c:when>
	      </c:choose>
          </td>
        </tr>
        </c:forEach>
      </tbody>
      <tfoot>
      	<tr>
      		<td></td>
      		<td><b>합계 (상품 가격 + 배송비)</b></td>
      		<td>${item.total_price }</td>
      		<td colspan="3"></td>
    	</tr>
      </tfoot>
    </table>
    </form>
   <form class="flex" action="${contextPath }/mypage/modifyShipping" method="post">
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
          <td>
          	<input type="text" value="0${item.phone1 }-${item.phone2 }-${item.phone3 }" readonly>
          	<input type="hidden" name="phone1" value="0${item.phone1 }" size="1" readonly>
          	<input type="hidden" name="phone2" value="${item.phone2 }" size="2" readonly>
          	<input type="hidden" name="phone3" value="${item.phone3 }" size="2" readonly></td>
        </tr>
        <tr>
		  <th>배송지</th>
          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
          	<input type="text" value="${item.address } ${item.detail_address }" readonly>
          	<input type="hidden" name="address" value="${item.address }">
          	<input type="hidden" name="detail_address" value="${item.detail_address }">
          </td>
        </tr>
        <tr>
		  <th>요구사항</th>
          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
        </tr>
      </tbody>
    </table>

	    <input type="hidden" name="order_no" value="${item.order_no }">
	    <div>
	    	<button type="button" onclick="deleteGoods(this)" class="btn btn-danger">선택 상품 취소</button>
	    	<button type="button" onclick="deleteGoods(this)" class="btn btn-danger">주문 전체 취소</button>
	    	<input type="submit" class="btn btn-info" value="배송 정보 수정">
	    </div>
	    <hr>
    </form>
    </c:forEach>
<script>
function deleteGoods(obj) {
	var area = $(obj).parents("form").prev();
	var gname = $(area).find(".gname");
	var ck = $(area).find('input[type="checkbox"]');
	var status = $(area).find(".status").val();
	var j=0;
	for(var i=0; i<ck.length; i++){
		if($(ck[i]).is(':checked')){
			$(gname[i]).removeAttr("disabled");
			gname[i].name = "list["+ j+"]."+gname[i].name;
			j++;
		}
		if(gname[0]==null) {
			return;
		}else if(status == "1") {
			alert('발송이 완료된 상품은 취소할 수 없습니다.');
			return;
		}else {
			$('#delete-form').submit();
		}		
	}
	
}
</script>