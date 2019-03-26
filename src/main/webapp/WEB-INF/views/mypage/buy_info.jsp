<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="">
    <form class="form-horizontal">
        <table class="">
            <tr>
            	<th><label for="inputName">수령인</label></th>
            	<td><input type="text" id="inputName" class="form-control" value="회원이름"></td>
            <tr>
            	<th><label for="address">주소</label></th>
            	<td><input type="text" class="form-control" id="address" placeholder="주소 검색"></td>
           	</tr>
            <tr>
            	<th>연락처</th>
           		<td>
           		<select>
           			<option>010</option>
           		</select>-
           			<input type="text" class="" size="5">-
           			<input type="text" class="" size="5">
           		</td>
         	</tr>
            <tr><td><button type="submit" class="btn btn-primary">수정</button></td></tr>
        </table>
    </form>
  </div>