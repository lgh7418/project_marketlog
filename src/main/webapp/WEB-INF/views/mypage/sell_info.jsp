<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="">
	<p class="font-navy"><b>판매 중인 페이지</b></p>
	<ul>
	  <c:forEach var="item" items="${addressList }">
	  <li>
		<a href="${item.goods_address }" target="blank">${item.goods_address }</a>
		<input type="hidden" name="address" value="${item.goods_address }">
		<a href="/mypage/modifySellInfo/${item.address_no }">수정하기</a>
	  </li>
	  </c:forEach>
	</ul>
</div>