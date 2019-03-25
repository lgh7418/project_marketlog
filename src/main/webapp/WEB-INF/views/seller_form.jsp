<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>

<div class="content-block">
  <div class="page-wrapper sell">
        <!-- 셀러 페이지에서는 iframe 사이즈를 더 줄이자 -->
        <article>
          <iframe src="https://m.blog.naver.com/s486s012/221464384000" frameborder="0"></iframe>
        </article>
        <aside>
          <div class="product">
          <p>상품명과 가격을 입력하세요</p>
          <table class="table table-bordered">
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
          </div>
          <div class="charge">
          <p>배송비를 입력하세요</p>
          <div class="input-group mb-3">
            <input type="text" class="form-control rounded-0" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <span class="input-group-text" id="basic-addon2">원</span>
            </div>
          </div>
          
          </div>
        </aside>
      </div>
    </div>
  </body>
</html>