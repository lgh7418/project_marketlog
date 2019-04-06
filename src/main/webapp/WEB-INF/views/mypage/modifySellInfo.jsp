<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#add-row").click(function() {
		$("#product_table > tbody:first").append('<tr><td><button type="button" class="delete-row text-warning" onclick="deleteRow(this)"><i class="fas fa-minus-circle"></i></button></td>'
		+ '<td><input type="text" class="form-control gname" name="goods_name"></td>'
		+ '<td><input type="text" class="form-control gprice" name="goods_price"></td></tr>');
		var gname = $('#add-row').parents('tfoot').prev().find('tr:last-child').find('.gname');
		$(gname).focus();
	});
});
</script>

<div class="content-block">
  <div class="page-wrapper sell">
        <article>
          <iframe src="${address.goods_address }" frameborder="0"></iframe>
        </article>
        <aside>
          <form id="goods_form" action="${contextPath }/mypage/modifySellInfo.do" method="post">
          <div class="product">
          <p>상품명과 가격을 입력하세요</p>
          <table class="table table-bordered" id="product_table">
              <thead>
                <tr>
                  <th></th>
                  <th>상품명</th>
                  <th>가격</th>
                </tr>  	
            </thead>
            <tbody>
            	<c:forEach var="item" items="${goodsList}">
                <tr>
                  <td><button type="button" class="delete-row text-warning" onclick="deleteRow(this)"><i class="fas fa-minus-circle"></i></button></td>
                  <td><input type="text" class="form-control gname" name="goods_name" value="${item.goods_name}"></td>
                  <td><input type="text" class="form-control gprice" name="goods_price" value="${item.goods_price}"></td>
                </tr>
                </c:forEach>
             </tbody>
              <tfoot>
        	    <tr>
                  <td><button type="button" id="add-row" class="delete-row text-primary"><i class="fas fa-plus-circle"></i></button></td>
                  <td colspan="2"></td>
                </tr>
             </tfoot>
          </table>
          </div>
          <div class="charge">
             <div class="charge-box1">
	          <p>배송비를 입력하세요</p>
	          <div class="input-group mb-3">
	            <input type="text" value="${address.shipping }" name="shipping" id="shipping" class="form-control rounded-0" aria-label="Recipient's username" aria-describedby="basic-addon2">
	            <div class="input-group-append">
	              <span class="input-group-text" id="basic-addon2">원</span>
	            </div>
         	 </div>
         	</div>
         	<div class="charge-box2">
	          <input type="hidden" name="address_no" value="${address.address_no }">
	          <button type="button" class="btn btn-info" onclick="checkName()">수정하기</button>
	       </div>
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
		            if(gname[i].value==gname[j].value) {
		            	alert('상품명은 모두 달라야 합니다.');
		            	return;
		            }
		        }
		    }
	    }
	    if(checkShipping()) {
	    	return;
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
  function checkShipping() {
	  var shipping = document.getElementById("shipping");
	  if(shipping.value=="") {
		  alert('배송비를 입력하세요.');
		  return true;
	  }
	  return false;
  }
	function deleteRow(obj){
		var tr = $(obj).parents("tr");
		console.log(tr);
		tr.remove();
  	}
  </script>
</html>