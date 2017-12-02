<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍 문화관광재단</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='http://127.0.0.1:8080/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='http://127.0.0.1:8080/group_prj_art/css/css_myinfo.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='http://127.0.0.1:8080/group_prj_art/js/js_menu.js'' charset='UTF-8'></script>



</head>

<body>
			<!--
			로고 => main.do
			로그인 => login.do
			회원가입 => signin.do
			전시일정검색 => exhibit.do
			전시관 검색 => map.do
			공지사항 => notice.do
			이벤트 => event.do
			QNA ==>qna.do
			내정보보기 => myinfo.do
			내쿠폰정보 => mycupon.do
			내가쓴글 => mydoc.do
			메인이미지 클릭/ 달력클릭 ==>
	  -->
		
	<form id="myinfo_frm" >
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
				<div id="sub_top">
					<span id="sub_top_text" ><h3>| 마이페이지</h3></span>
				</div>
				<div id="my_body" >
					<div class="myinfo" id="div1">
						<span id="sub_body_name">내 정보</span>
						<a href="#"><input type="button" value="수정" id="update_btn"/></a>     
						<img src="http://127.0.0.1:8080/group_prj_art/common/images/myPage_img/profile/defult.jpg" id="profile_img"/>
						<span id="sub_info_name"><font style="color: #6bb103;">오로로로로로</font>님</span>	
							
					</div>
					<div class="myinfo" id="div2">
						<span id="sub_body_coupon">쿠폰</span>
							<input type="button" value="쿠폰보기" id="event_btn">
						<span id="sub_event_cnt">사용 가능 쿠폰 <font style="color: #6bb103; font-size: 20pt;">25</font>  장</span>	
					
					</div>
					<div class="myinfo" id="div3">
						<span id="sub_body_wlist">작성글</span>
						<a href="#"><input type="button" value="더 보기" id="more_btn"></a>
						<div id="wlist">
							<table id="wist_table">
								<tr>
									<td align="left" >아이디는 ??</td><td align="right">1987.54.1</td>
								</tr>
								<tr>
									<td align="left">얼시구나  ??</td><td align="right">1987.54.1</td>
								</tr>
								<tr>
									<td align="left">조옷쿠나아!!~~~ ??</td><td align="right">1987.54.1</td>
								</tr>
								<tr>
									<td align="left">놀아보자구나~~!!~~~ ??</td><td align="right">1987.54.1</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-------------------------- 하단 푸터  -------------------------->
				<div id="footer" >
					<img alt="풋터" src="common/images/main_img/footer.jpg" />
				</div>
				<!------------------------ content 추가  ------------------------>
		</div>
	</form>
</body>
</html>