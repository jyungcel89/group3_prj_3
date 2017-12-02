<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시일정 캘린더로 보기</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_exhibit.css'/>
<!-- 달력 -->
<link rel="stylesheet" href="/group_prj_art/css/css_ex_calendar.css" />
<!----------------------------------- JS 링크 ------------------------------------------>
<!-- 달력 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/group_prj_art/js/exhibit_calendar.js"></script>
</head>
<body>
	<div id="menu_inc" >
		<!------------------------ left_menu  ------------------------>					
			<c:import url="${request.contextPath}/menu.do"/>
		<!------------------------ left_menu  ------------------------>		
	</div>
	<div id="wrap_content">
		<div id="sub_top">
        	<span id="sub_top_text" ><h3>| 전시 일정 캘린더  </h3></span>
        </div>
		<div id="main_content">
		
		
		<div id="exhibit_content">
			<div id="exhibit_btn">
				<a href="exhibit_calendar.do">
					<input type="button" value="달력 보기" id="btn_cal" class="exhibit_btn" style="background-color: #528704; color: #fff;"/>      
				</a>
				<a href="exhibit_list.do">
					<input type="button" value="리스트 보기" id="btn_list" class="exhibit_btn"/>
				</a>
			</div><!-- exhibit_btn -->
			
			<div id="exhibitCalFrm">
				<div id="ex_cal_content">
					<!-- 달력!! -->
					<form name="calFrm" method="post" action="popup_calendar.do">
					<input type="hidden" id="selectDate" name="selectDate"/>
					<div class="jquery-ex-calendar"></div>
					</form>
					<!-- 달력!! -->
				</div>
			</div>
			
		</div>
		
		<!-------------------------- 하단 푸터  -------------------------->
		<div id="footer" style="padding-top: 10px">
			<img alt="풋터" src="common/images/main_img/footer.jpg" />
		</div>
		<!------------------------ content 추가  ------------------------>
		
		</div><!-- main_content -->
	</div><!-- wrap_content -->
</body>
</html>