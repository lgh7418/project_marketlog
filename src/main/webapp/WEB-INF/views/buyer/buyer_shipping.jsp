<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../partials/header.jsp" %>

<div class="content-block">
        <div class="shipping-form">
        <form action="${contextPath }/buyer/buyer_result" method="post">
          <table>
            <tr>
              <th>받으시는분</th>
              <td><input type="text" name="recipient" value="${member.member_name }" class="form-control" placeholder="성함"></td>
            </tr>
            <tr>
              <th>주소</th>
              <td>
                <div class="form-inline">
                  <div class="form-group mb-2">
                    <input type="text" value="${member.postcode }" id="postcode" name="postcode" class="form-control" placeholder="우편번호">
                  </div>
                  <div class="form-group mx-sm-3 mb-2">
                    <input type="button" onclick="execDaumPostcode()" value="주소 찾기">
                  </div>
                </div>
                <input type="text" value="${member.address }" id="address" name="address" class="form-control" placeholder="주소">
                <input type="text" value="${member.detail_address }" id="detailAddress" name="detail_address" class="form-control" placeholder="상세주소">
              </td>
            </tr>
            <tr>
              <th>휴대전화</th>
              <td>
                <select name="phone1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>
                - <input type="tel" id="phone2" name="phone2" value="${member.phone2 }" maxlength="4"> -
                <input type="tel" id="phone3" name="phone3" value="${member.phone3 }" maxlength="4">
              </td>
            </tr>
            <tr>
              <th>배송시요구사항</th>
              <td>
                <input type="text" name="memo" class="form-control">
              </td>
            </tr>
          </table>
          <input type="hidden" name="total_price" value="${total_price }">
          <input type="checkbox" Id="shippingCk" value="1" name="addInfo" checked>
           기본 배송지로 설정
          <input type="submit" class="btn btn-primary" value="주문하기">
        </form>
        </div>
     </div>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script>
        function execDaumPostcode() {
          new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ""; // 주소 변수
              var extraAddr = ""; // 참고항목 변수
  
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === "R") {
                // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
              } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
              }
  
              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                  extraAddr +=
                    extraAddr !== ""
                      ? ", " + data.buildingName
                      : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                  extraAddr = " (" + extraAddr + ")";
                }
              }
  
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById("postcode").value = data.zonecode;
              document.getElementById("address").value = addr + extraAddr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("detailAddress").focus();
            }
          }).open();
        }
        $("#shippingCk").click(function() {
        	if($("#shippingCk").is(":checked")){
        		$("#shippingCk").attr("name", "addInfo");
        	}else {
        		$("#shippingCk").removeAttr("name");
        	}
        });
        
        if(${member.address} != null) {
          	$("option:contains('${member.phone1 }')").prop('selected', 'selected');
          }else {
        	  $('#postcode').val("");
        	  $('#address').val("");
        	  $('#detailAddress').val("");
        	  $('#phone2').val("");
        	  $('#phone3').val("");
          }
        });
      </script>
    </body>
  </html>
  