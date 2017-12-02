<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_popup_calendar.css'/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='/group_prj_art/js/js_popup_calendar.js'charset='UTF-8'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 80;
	var hei = win.document.body.offsetHeight + 60; //30 과 40은 넉넉하게 하려는 임의의 값임
	win.resizeTo(wid,hei);
}
</script>
</head>
<body onload='resizeWindow(this)'>
	<div id="wrap_popup_content">
    
	<div id="list_tab">
	<table class="table table-hover text-center">
		<tr>
			<td class="tab_head" style="width: 50px;">번호</td>
			<td class="tab_head" style="width: 400px;">전시명</td>
			<td class="tab_head" style="width: 200px;">전시관명</td>
			<td class="tab_head">전시 시작일</td>
			<td class="tab_head">전시 종료일</td>
		</tr>
		<c:if test="${ empty requestScope.popup_list }">
			<tr>
				<td colspan="5" align="center">
					전시정보가 없습니다.
				</td>
			</tr>
		</c:if> 
		<c:forEach var="popupExhibitList"  items="${ requestScope.popup_list }">
			<tr>
				<td><c:out value="${ popupExhibitList.rnum }"/></td>
				<td><c:out value="${ popupExhibitList.title }"/></td>
				<td><c:out value="${ popupExhibitList.place_name }"/></td>
				<td><c:out value="${ popupExhibitList.start_day }"/></td>
				<td><c:out value="${ popupExhibitList.end_day }"/></td>
			</tr>
		</c:forEach>
	</table>
	</div>

	<!-- --------------------------- 페이징 시작 ------------------------------ -->
	<form name="searchFrm" action="popup_calendar.do" method="post">
	
    <input type="hidden" name="pageNo" value="${ pageVO.pageNo }"/>
    <input type="hidden" name="startRowNo" value="${ pageVO.startRowNo }"/>
    <input type="hidden" name="endRowNo" value="${ pageVO.endRowNo }"/>
    <input type="hidden" name="pageSize" value="${ pageVO.pageSize }"/>	
    <input type="hidden" name="selectDate" value="${ pageVO.selectDate }"/>
    
	<div class="text-center" id="paging_list_tab">
	<ul class="pagination">
	   <c:if test="${pageVO.pageNo != 0}">
	    
	       <c:if test="${ pageVO.pageNo > pageVO.pageBlock }">
	      	<li><a href="#"onclick="fn_movePage(${ pageVO.firstPageNo })">First</a></li>
	       </c:if>
	       
	       <c:if test="${ pageVO.pageNo != 1 }">
	       	<li><a href="#"onclick="fn_movePage(${ pageVO.prevPageNo })">Pre</a></li>
	       </c:if>
	       
	       <c:forEach var="i" begin="${ pageVO.startPageNo }" end="${ pageVO.endPageNo }" step="1">
	           <c:choose>
	               <c:when test="${ i eq pageVO.pageNo }">
	  				<li class="active"><a href="#" onclick="fn_movePage(${ i })">${ i }</a></li>
	               </c:when>
	               <c:otherwise>
	 				<li><a href="#" onclick="fn_movePage(${ i })">${ i }</a></li>
	               </c:otherwise>
	           </c:choose>
	       </c:forEach>
	       
	       <c:if test="${ pageVO.pageNo != pageVO.finalPageNo }">
	       	<li><a href="#" onclick="fn_movePage(${ pageVO.nextPageNo })">Next</a></li>
	       </c:if>
	       
	       <c:if test="${ pageVO.endPageNo < pageVO.finalPageNo }">
	       	<li><a href="#" onclick="fn_movePage(${ pageVO.finalPageNo })">Last</a></li>
	       </c:if>
	       
	   </c:if>
	</ul>
	</div>
	<!-- --------------------------- 페이징 끝 ------------------------------ -->
	</form>
	</div>
</body>
</html>