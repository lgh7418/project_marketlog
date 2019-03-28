<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#add-row").click(function() {
		$("#product_table > tbody:first").append('<tr><td><input type="text" class="form-control gname" name="goods_name"></td>'
		+ '<td><input type="text" class="form-control gprice" name="goods_price"></td></tr>');
	});
});
</script>

<div class="content-block">
  <div class="page-wrapper sell">
        <!-- 셀러 페이지에서는 iframe 사이즈를 더 줄이자 -->
        <article>
          <iframe src="${address }" frameborder="0"></iframe>
        </article>
        <aside>
          <form id="goods_form" action="${contextPath }/seller/seller_result" method="post">
          <div class="product">
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
                  <td><input type="text" class="form-control gname" name="goods_name"></td>
                  <td><input type="text" class="form-control gprice" name="goods_price"></td>
                </tr>
             </tbody>
          </table>
          <button id="add-row" type="button"><i class="fas fa-plus"></i></button>
          </div>
          <div class="charge">
          <p>배송비를 입력하세요</p>
          <div class="input-group mb-3">
            <input type="text" name="shipping" class="form-control rounded-0" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <span class="input-group-text" id="basic-addon2">원</span>
            </div>
          </div>
          <input type="hidden" name="goods_address" value="${address }">
          <button type="button" class="btn btn-primary" onclick="checkName()">다음</button>
          </div>
          </form>
        </aside>
      </div>
    </div>
  </body>
  <script>
  function checkName() {
	    var gname = document.getElementsByClassName("gname");
	    var gprice = document.getElementsByClassName("gprice");
	    if(gname[0].value=="") {
	    	alert('상품명을 입력하세요.');
	    	return;
	    }
	    if(gname.length>=1) {
		    for(var i=0; i<gname.length-1; i++) {
		        for(var j=i+1; j<gname.length; j++) {
		            if(name[i].value==gname[j].value) {
		            	alert('상품명은 모두 달라야 합니다.');
		            	return;
		            }
		        }
		    }
	    }
	    rename(gname);
	    rename(gprice);
        document.getElementById("goods_form").submit();
	}
  function rename(elements) {
	  for (var i=0; i<elements.length; i++) {
		    elements[i].name = "list["+ i+"]."+elements[i].name;
		}
  }
  </script>
</html>