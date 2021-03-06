<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../partials/header.jsp" %>

<style>
input[type="text"] {
	width: 100%;
}
</style>

<div class="content-block">
        <div class="shipping-form">
        <form action="${contextPath }/mypage/modifyShipping.do" method="post">
          <table>
            <tr>
              <th>받으시는분</th>
              <td><input type="text" name="recipient" class="form-control" value="${orderInfo.recipient }"></td>
            </tr>
            <tr>
              <th>주소</th>
              <td>
                <div class="form-inline">
                  <div class="form-group mb-2">
                    <input type="text" id="postcode" name="postcode" class="form-control" value="${orderInfo.postcode }">
                  </div>
                  <div class="form-group mx-sm-3 mb-2">
                    <input type="button" onclick="execDaumPostcode()" value="주소 찾기">
                  </div>
                </div>
                <input type="text" id="address" name="address" class="form-control" value="${orderInfo.address }">
                <input type="text" id="detailAddress" name="detail_address" class="form-control" value="${orderInfo.detail_address }">
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
                - <input type="tel" name="phone2" value="${orderInfo.phone2 }" size="2">
                - <input type="tel" name="phone3" value="${orderInfo.phone3 }" size="2">
              </td>
            </tr>
            <tr>
              <th>배송시요구사항</th>
              <td>
                <input type="text" name="memo" class="form-control" value="${orderInfo.memo }">
              </td>
            </tr>
          </table>
          <input type="hidden" name="order_no" value="${orderInfo.order_no }">
          <input type="submit" class="btn btn-info" value="수정하기">
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
        $("option:contains('${member.phone1 }')").prop('selected', 'selected');
      </script>
    </body>
  </html>