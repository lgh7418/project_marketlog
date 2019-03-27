<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#add-row").click(function() {
		$("#product_table > tbody:first").append('<tr><td><input type="text" class="form-control"></td>'
		+ '<td><input type="text" class="form-control"></td></tr>');
	});
	// 자바스크립트 goods_name
	
	// focus 새로 만든 row의 first td에
});

function renameForModelAttribute() {
    $("form").each( function (index) {
        $("input[name=goods_name]").attr("name", "goods["+index+"].goods_name");
        $("input[name=goods_price]").attr("name", "goods["+index+"].goods_price");
    };
}
</script>

<div class="content-block">
  <div class="page-wrapper sell">
        <!-- 셀러 페이지에서는 iframe 사이즈를 더 줄이자 -->
        <article>
          <iframe src="${address }" frameborder="0"></iframe>
        </article>
        <aside>
          <div class="product">
          <form action="${contextPath }/seller/seller_result" method="post">
          <p>상품명과 가격을 입력하세요</p>
          <table class="table table-bordered" id="product_table">
              <thead>
                 <tr>
                  <th>상품명</th>
                  <th>가격</th>
                </tr>  	
            </thead>
            <tbody>
                <tr>
                  <td><input type="text" class="form-control" name="goods_name"></td>
                  <td><input type="text" class="form-control" name="goods_price"></td>
                </tr>
             </tbody>
          </table>
          <button id="add-row" type="button"><i class="fas fa-plus"></i></button>
          </div>
          <div class="charge">
          <p>배송비를 입력하세요</p>
          <div class="input-group mb-3">
            <input type="text" class="form-control rounded-0" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <span class="input-group-text" id="basic-addon2">원</span>
            </div>
          </div>
          <button type="button" class="btn btn-primary" onclick="renameForModelAttribute">다음</button>
          </div>
          </form>
        </aside>
      </div>
    </div>
  </body>
</html>