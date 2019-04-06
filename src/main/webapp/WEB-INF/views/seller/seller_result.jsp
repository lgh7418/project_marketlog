<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

	<div class="content-block">
		<div class="seller_result">
			<p>상품페이지가 만들어졌습니다 😄</p>
			<div>내 페이지 : <a href="/buyer/select/${address_no}" id="p" class="btn-light">http://localhost:8080/buyer/select/${address_no}</a>
				<button type="button" class="btn btn-link" onclick="copy('#p')"><i class="far fa-copy"></i> 복사</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
function copy(element) {
	  var $temp = $("<input>");
	  $("body").append($temp);
	  $temp.val($(element).text()).select();
	  document.execCommand("copy");
	  $temp.remove();
	}
</script>