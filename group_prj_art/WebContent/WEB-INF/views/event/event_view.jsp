<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍 문화관광재단</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_eventView.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='/group_prj_art/js/js_menu.js' charset='UTF-8'></script>

</head>

<body>
		
	<form id="myinfo_frm" >
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
				<div id="sub_top">
					<span id="sub_top_text" ><h3>| 이벤트</h3></span>
				</div>
				<div id="my_body" >
					<div id="view_wrap">
						<div id="view_table_div">
							<table id="view_table">
								<tr>
									<td style="font-weight: bold; font-size: 18px;">제목</td>
									<td><c:out value="${event_read_list.title}"/></td>
								</tr>
								<tr>
									<td style="font-weight: bold; font-size: 18px;">이벤트 기간</td>
									<td><c:out value="${event_read_list.event_start}"/> - <c:out value="${event_read_list.event_end}"/></td>
								</tr>
							</table>
						</div>
						<div id="content_bg">
							<div id="text_area">
								<span id="content"><c:out value="${event_read_list.content}"/></span>
							</div>
						</div>
						<a href="event.do"><input id="btn_update" type="button" value="목록으로"/></a>
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