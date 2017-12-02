<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍 문화관광재단</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_main.css'/>

<!-----------------------------------이미지 슬라이드 CSS 링크 --------------------------------->
<link rel="stylesheet" href="/group_prj_art/css/css_calendar.css" />
<!-----------------------------------JS 링크 -------------------------------------------->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='/group_prj_art/js/js_main.js' charset='UTF-8'></script>
<!-- 이미지 슬라이드 -->
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/group_prj_art/js/main_calendar.js"></script>


</head>

<body>
		
	<form id="main_frm" >
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
					<!-------------------- 이미지 스크롤링 -------------------->
				<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=2000>
					<div class="cycle-pager"></div>
					    <img src="/group_prj_art/common/images/main_img/main_img.jpg">
					    <img src="http://cfs.tistory.com/custom/blog/183/1835674/skin/images/7.jpg">
					    <img src="http://cfs.tistory.com/custom/blog/183/1835674/skin/images/8.jpg">
					</div>
					<!-------------------- 이미지 스크롤링 -------------------->
			
				<div id="main_content">
					<!-------------------- 검색 바  -------------------->
					<div  id="main_search" >
						<input type="text" id="textBox_search" />
						<input type="button" id="btn_search" value="검 색"/>					
					</div>
					<!-------------------- 검색 바  -------------------->
					
					
					
					<div id="main_border" >
						<div id="on" class="notice" onclick="borderStyle_notice(this)">
							공지사항
						</div>
						<div id="off" class="event" onclick="borderStyle_event(this)">
							이벤트
						</div>
						<div id="border_list">

							<!-- <input type="hidden" name="event_num"/> -->
								<!-- 공지사항 리스트 !! -->
								<ul id="border_notice" >
									<c:if test="${ empty requestScope.notice_list }">
										<li>새로운 공지가 없습니다.</li>
									</c:if>
									<c:forEach var="notice" items="${ requestScope.notice_list }">
												<c:set var="setTitle" value="${ event.title }"/>
										<li>
											<a href="#"> 
												<c:set var="setTitle" value="${ notice.title }"/>
												<c:out value="${ fn:substring(setTitle,0,22) }"/> 
											</a>
										</li>										
											<input type="hidden" name="notice_num" value="${notice.notice_num}"/>
									</c:forEach>
								</ul>
								<!-- 공지사항 리스트 !! -->
								
								<!-- 이벤트 리스트 !! -->
								<ul id="border_event" >
									 <c:if test="${ empty requestScope.event_list }">
										<li>현재 진행중인 이벤트가  없습니다.</li>
									</c:if>
									<c:forEach var="event" items="${ requestScope.event_list }">
										<li>
											<a href="#"> 
												<c:set var="setTitle" value="${ event.title }"/>
												<c:out value="${ fn:substring(setTitle,0,22) } ..."/> 
											</a>
										</li>										
											<input type="hidden" name="event_num" value="${event.event_num}"/>
									</c:forEach>
								</ul>
								<!-- 이벤트 리스트 !! -->
						</div>
						
					</div>
					
					
					<div id="main_calender">
						<!-- 달력!! -->
							<div class="jquery-calendar"></div>
						<!-- 달력!! -->
							<div id="cal_list">
								<ul id="cal_list_ul">
									 <c:if test="${ empty requestScope.ex_list }">
										<li>현재 진행중인 전시가  없습니다.</li>
									</c:if>
									<c:forEach var="exinfo" items="${ requestScope.ex_list }">
										<li>
											<a href="#"> <c:out value="${ exinfo.title }"/> </a><br/>
												 <c:out value="${ exinfo.start_day }"/> ~ 
												 <c:out value="${ exinfo.end_day }"/><br/> 
												 <c:out value="${ exinfo.place_name }"/><br/><br/>
										</li>										
											<input type="hidden" name="ex_num" value="${exinfo.ex_num}"/>
									</c:forEach>
								</ul>
							
							</div>
						
					</div>
				</div>
				<!-------------------------- 하단 푸터  -------------------------->
				<div id="footer" >
					<img alt="풋터" src="/group_prj_art/common/images/main_img/footer.jpg" />
				</div>
				<!------------------------ content 추가  ------------------------>
		</div>
	</form>
</body>
</html>