<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="">
	<p class="font-navy"><b>판매 중인 페이지</b></p>
   	<c:if test="${empty addressList}">
	 판매 중인 페이지가 없습니다.
	</c:if>
	<ul>
	  <c:forEach var="item" items="${addressList }">
	  <li>
		<a href="${item.goods_address }" target="blank">${item.goods_address }</a>
		<input type="hidden" name="address" value="${item.goods_address }">&nbsp;&nbsp;
		<a href="/mypage/modifySellInfo/${item.address_no }"><i class="fas fa-edit"></i></a>
	  </li>
	  </c:forEach>
	</ul>
</div>