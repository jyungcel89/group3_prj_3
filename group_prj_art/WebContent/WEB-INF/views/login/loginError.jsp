	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍 문화관광재단</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_login.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type='text/javascript' src='http://localhost:8080/group_prj_art/js/js_menu.js' charset='UTF-8'></script>

<script type="text/javascript">


</script>
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
		
	<form id="main_frm" method="POST" action="logincheck.do">
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
				
				<div id="loginMenu">
					<h2>로그인에 실패 하셧습니다. 아이디와 비밀 번호를 올바르게 입력해주세요.</h2>				
					<a href="login.do">로그인</a>
				</div>
				
				<!------------------------ content 추가  ------------------------>
		</div>
				<div id="footer">
					<img alt="풋터" src="common/images/main_img/footer.jpg" />
				</div>
				<!-------------------------- 하단 푸터  -------------------------->
	</form>
	
</body>
</html>
