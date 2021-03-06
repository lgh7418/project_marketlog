<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="shipping-form info">
 <p class="font-navy"><b>내 정보</b></p>
    <form action="${contextPath }/mypage/memberInfo" method="post">
    <table>
 	    <tr>
        <th>이메일</th>
        <td><input type="text" class="form-control"  value="${member.email_id }" readonly></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" class="form-control" value="${member.member_name }" readonly></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>
          <div class="form-inline">
            <div class="form-group mb-2">
              <input type="text" id="postcode" name="postcode" class="form-control" value="${member.postcode }">
            </div>
            <div class="form-group mx-sm-3 mb-2">
              <input type="button" onclick="execDaumPostcode()" value="주소 찾기">
            </div>
          </div>
          <input type="text" id="address" name="address" class="form-control" value="${member.address }">
          <input type="text" id="detailAddress" name="detail_address" class="form-control"  value="${member.detail_address }">
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
          - <input type="tel" name="phone2" id="phone2" value="${member.phone2 }" maxlength="4"> -
          <input type="tel" name="phone3" id="phone3" value="${member.phone3 }" maxlength="4">
        </td>
      </tr>
    </table>
    <input type="submit" class="btn btn-info" value="수정하기">
  </form>
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
  
  if('${member.address}' != null) {
  	$("option:contains('${member.phone1 }')").prop('selected', 'selected');
  }else {
	  $('#postcode').val("");
	  $('#address').val("");
	  $('#detailAddress').val("");
	  $('#phone2').val("");
	  $('#phone3').val("");
  }
  </script>