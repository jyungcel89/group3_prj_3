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
<link rel='stylesheet' type='text/css' href='http://127.0.0.1:8080/group_prj_art/css/css_noticeView.css'/>
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
					<span id="sub_top_text" ><h3>| Q&A</h3></span>
				</div>
				<div id="my_body" >
					<div id="view_wrap">
						<div id="view_table_div">
							<table id="view_table">
								<tr>
									<td>작성자</td>
									<td><c:out value="${requestScope.readOne.id}"/></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><c:out value="${requestScope.readOne.title}"/></td>
								</tr>
								<tr>
									<td>작성일</td>
									<td><c:out value="${requestScope.readOne.w_date}"/></td>
								</tr>
							</table>
						</div>
						<div id="content_bg">
							<div id="text_area">
								<span id="content"><c:out value="${requestScope.readOne.content }"/></span>
							</div>
						</div>
						<a href="qna.do"><input id="btn_update" type="button" value="목록으로"/></a>
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