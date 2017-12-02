<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type='text/javascript' src='http://127.0.0.1:8080/group_prj_art/js/js_menu.js'charset='UTF-8'></script>
<div id="logo" >
		<a href="main.do"><img alt="로고" src="http://localhost:8080/group_prj_art/common/images/main_img/main_logo.jpg"></a>
		</div>
		<div id="logoin" > 
			<c:if test="${ !empty id }">
				<br/>
				${ id }님 환영합니다.
				<a href="logout.do">로그아웃</a>
			</c:if>
			<c:if test="${ empty id }">
			<a href="login.do"><input id="btn_login" type="button"></a>
			<a href="signin.do"><input id="btn_signin" type="button"></a><br/>
			<span id="span_find">
			<a href="find_id.do"><strong>아이디 찾기</strong></a>
			 / 
			 <a href="find_pw.do"><strong>비밀번호 찾기</strong></a>
			 </span>
			</c:if>
		</div>
			
		<div id="menu" >
			<!------------------------------ 메뉴 -------------------------------->
			<ul>
		        <li class="menu">
		            <a href="exhibit_list.do"><img src="http://localhost:8080/group_prj_art/common/images/main_img/menu1.jpg" alt="상위메뉴이미지1" onMouseOver="image_on(this)" onMouseOut="image_off(this)"/></a>
		        </li>
		 
		        <li class="menu">
		            <a href="Map.do"><img src="http://localhost:8080/group_prj_art/common/images/main_img/menu2.jpg" alt="상위메뉴이미지2" onMouseOver="image_on(this)" onMouseOut="image_off(this)"/></a>
		        </li>
		        <li class="menu">
		            <a ><img src="http://localhost:8080/group_prj_art/common/images/main_img/menu3.jpg" alt="상위메뉴이미지3" onMouseOver="image_on(this)" onMouseOut="image_off(this)"/></a>
		            <ul class="hide">
		                <li class="sub_li"><a href="notice.do">공지사항</a></li>
		                <li class="sub_li"><a href="event.do">이벤트</a></li>
		            </ul>
		        </li>
		        <li class="menu">
		            <a href="qna.do"><img src="http://localhost:8080/group_prj_art/common/images/main_img/menu4.jpg" alt="상위메뉴이미지4" onMouseOver="image_on(this)" onMouseOut="image_off(this)"/></a>
		        </li>
		        
		        
		        <c:if test="${!empty id}">
		        <li class="menu">
		            <a><img src="http://localhost:8080/group_prj_art/common/images/main_img/menu5.jpg" alt="상위메뉴이미지5" onMouseOver="image_on(this)" onMouseOut="image_off(this)"/></a>
		            <ul class="hide">
		                <li class="sub_li"><a href="myinfo.do">내 정보 보기</a></li>
		                <li class="sub_li"><a href="mycupon.do">내 쿠폰 정보</a></li>
		                <li class="sub_li"><a href="mydoc.do">내가 작성한 글</a></li>
		            </ul>
		        </li>
		        </c:if>
		        
		        
		    </ul>
			<!------------------------------ 메뉴 -------------------------------->
		    
		</div>