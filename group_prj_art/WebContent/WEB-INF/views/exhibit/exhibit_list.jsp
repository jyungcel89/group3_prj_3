<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_exhibit.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script type='text/javascript' src='/group_prj_art/js/js_exhibit_list.js'charset='UTF-8'></script>
<!-- CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- JQuery -->
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="menu_inc" >
		<!------------------------ left_menu  ------------------------>					
			<c:import url="${request.contextPath}/menu.do"/>
		<!------------------------ left_menu  ------------------------>		
	</div>
	<div id="wrap_content">
		<div id="sub_top">
               <span id="sub_top_text" ><h3>| 전시 일정 리스트  </h3></span>
        </div>
		<div id="main_content">
		
		<div id="exhibit_content">
		
			<div id="exhibit_btn">
				<a href="exhibit_calendar.do">
					<input type="button" value="달력 보기" id="btn_cal"/>      
				</a>
				<a href="exhibit_list.do">
					<input type="button" value="리스트 보기" id="btn_list" style="background-color: #528704; color: #fff;"/>
				</a>
			</div><!-- exhibit_btn -->
			
			
			<form name="searchFrm" action="exhibit_list.do" method="post">
			<div id="exhibitListFrm">
			
		    <input type="hidden" name="pageNo" value="${ pageVO.pageNo }"/>
		    <input type="hidden" name="searchCondition" value="${ pageVO.searchCondition }"/>
		    <input type="hidden" name="searchValue" value="${ pageVO.searchValue }"/>
		    
		    <input type="hidden" name="startRowNo" value="${ pageVO.startRowNo }"/>
		    <input type="hidden" name="endRowNo" value="${ pageVO.endRowNo }"/>
		    <input type="hidden" name="pageSize" value="${ pageVO.pageSize }"/>
			
				<table id="exList_tab">
					<c:if test="${ empty requestScope.exhibit_list }">
						<tr>
							<td colspan="2" align="center">전시정보가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach var="exhibit" items="${ requestScope.exhibit_list }">
						<tr class="exList_tr">
							<td style="width: 138px; height: 123px;" valign="middle" align="center">
								<img src="http://localhost:8080/group_prj_art/common/images/exhibit_img/s_${ exhibit.img }"/>
							</td>
							<td style="padding-left: 25px;" >
								<ul>
									<li class="exList_li">
										<a href="exhibit_info.do?ex_num=${ exhibit.ex_num }&p_num=${ exhibit.p_num }" id="exList_title">
											<c:out value="${ exhibit.title }"/>
										</a>
									</li>
									<li class="exList_li">
										<c:out value="${ exhibit.start_day }"/> ~ 
										<c:out value="${ exhibit.end_day }"/>
									</li>
									<li class="exList_li">
										<a href="#" onclick="sendExhibit(${ exhibit.ex_num }')">
											<c:out value="${ exhibit.place_name }"/>
										</a>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
						<td colspan="2"><hr/></td>
						</tr>
					</c:forEach>
				</table>
			<!-- </form> -->
			</div><!-- exhibitListFrm -->
			
			<!-- --------------------------- 페이징 시작 ------------------------------ -->
		    <div id="paging">
			    <table border="1">
			    <tr>
			    <c:if test="${pageVO.pageNo != 0}">
			    
  			       <c:if test="${ pageVO.pageNo > pageVO.pageBlock }">
			           <td>
			           <a href="#"onclick="fn_movePage(${ pageVO.firstPageNo })">First</a>
			           </td>
			       </c:if>
			       
			       <c:if test="${ pageVO.pageNo != 1 }">
			       	   <td>
			           <a href="#"onclick="fn_movePage(${ pageVO.prevPageNo })">Pre</a>
			       	   </td>
			       </c:if>
			       
		            <c:forEach var="i" begin="${ pageVO.startPageNo }" end="${ pageVO.endPageNo }" step="1">
		                <c:choose>
		                    <c:when test="${ i eq pageVO.pageNo }">
		                    	<td>
		                        <a href="#" onclick="fn_movePage(${ i })">
		                        	<span id="selected_page">${ i }</span>
		                        </a>
		                    	</td>
		                    </c:when>
		                    <c:otherwise>
		                    	<td>
		                        <a href="#" onclick="fn_movePage(${ i })">${ i }</a>
		                    	</td>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
			       
			       <c:if test="${ pageVO.pageNo != pageVO.finalPageNo }">
			       		<td>
		            	<a href="#" onclick="fn_movePage(${ pageVO.nextPageNo })">Next</a>
			       		</td>	
			       </c:if>
			       
			       <c:if test="${ pageVO.endPageNo < pageVO.finalPageNo }">
			       		<td>
			            <a href="#" onclick="fn_movePage(${ pageVO.finalPageNo })">Last</a>
			       		</td>	
			       </c:if>
			       
			    </c:if>
			    
			    </tr> 
			    </table>
		    <div id="search">
		        <select id="search_title" name="search_title">
		            <option value="">--------</option>
		            <option value="title">전시회명</option>
		            <option value="place">전시장명</option>
		        </select>
		        <input type="text" id="search_word" name="search_word"/>
		        <input type="submit" id="search_btn" value="검색" onclick="fn_search();"/>
		    </div><!-- search -->
		    
		    </div><!-- page -->
			<!-- --------------------------- 페이징 끝 ------------------------------ -->
			</form>

		</div><!-- exhibit_content -->
		<!-------------------------- 하단 푸터  -------------------------->
		<div id="footer" style="padding-top: 10px">
			<img alt="풋터" src="common/images/main_img/footer.jpg" />
		</div>
		<!------------------------ content 추가  ------------------------>
		</div><!-- main_content -->
	</div><!-- wrap_content -->
</body>
</html>