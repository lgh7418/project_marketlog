<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="partials/header.jsp" %>
<div class="content-block">
	<div class="mypage-nav container-fluid">
		<div class="row">
			<div class="nav-menu col-3">
				<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="pill" aria-controls="v-pills-home" aria-selected="true">구매 현황</a>
					<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="pill" aria-controls="v-pills-profile" aria-selected="false">내 정보 수정</a>
					<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="pill" aria-controls="v-pills-messages" aria-selected="false">판매 현황</a>
					<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="pill" aria-controls="v-pills-settings" aria-selected="false">판매 정보 수정</a>
				</div>
			</div>
			<div class="col-9">
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						<%@include file="partials/buy1.jsp" %>
					</div>
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<%@include file="partials/buy_info.jsp" %>
					</div>
					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
						<%@include file="partials/sell1.jsp" %>
					</div>
					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
				</div>
			</div>
		</div>
	</div>
 </div>
</body>
</html>
  