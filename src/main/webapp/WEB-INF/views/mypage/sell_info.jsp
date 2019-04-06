<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<p class="font-navy"><b>판매 중인 페이지</b></p>
   	<c:if test="${empty addressList}">
	 판매 중인 페이지가 없습니다.
	</c:if>
	<ul>
	  <c:forEach var="item" items="${addressList }">
	  <li>
		<a href="${item.goods_address }" target="blank">${item.goods_address }</a>
	  </li>
	  <li>
		<img src="${contextPath}/resources/images/down-right.png" style="width:16px">
		<div>
			<a href="${contextPath }/buyer/select/${item.address_no}" id="p">http://localhost:8090/buyer/select/${item.address_no}</a>
			<input type="hidden" name="address" value="${item.goods_address }">
			&nbsp;&nbsp;<a class="btn btn-info btn-sm" href="/mypage/modifySellInfo/${item.address_no }">수정</a>
		</div>
	  </li>
	  </c:forEach>
	</ul>
</div>