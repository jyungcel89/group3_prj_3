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
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_notice.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='/group_prj_art/js/js_menu.js' charset='UTF-8'></script>
<script type="text/javascript">
//페이지 이동
function fn_movePage(val){
  $("input[name=pageNo]").val(val);
  $("form[name=searchFrm]").attr("method", "post");
  $("form[name=searchFrm]").attr("action","").submit();
}//fn_movePage
</script>

</head>

<body>
		
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
				<div id="sub_top">
					<span id="sub_top_text" ><h3>| 공지사항</h3></span>
				</div>
				
				<div id="notice_body">
					
					<table id="body_tab">
						<thead>
							<tr class="tab_tr">
								<th class="list_th" id="td_num">번호</th>
								<th class="list_th" id="td_title">제목</th>
								<th class="list_th" id="w_date">등록일</th>
							</tr>
						</thead>
						<tbody>
							 <c:if test="${ empty requestScope.notice_list  }">
								<tr class="tab_tr">
									<td class="notice_td" colspan="3"> 작성된 공지가 없습니다 .</td>
								</tr>
							</c:if>
							
							<c:forEach var="notice_list" items="${requestScope.notice_list}">
									<tr class="tab_tr">
										<td class="notice_td"><a href="noticeRead.do?noticeNum=${notice_list.notice_num}"><c:out value='${notice_list.notice_num}'/></a></td>								
										<td class="notice_td"><a href="noticeRead.do?noticeNum=${notice_list.notice_num}">
											<c:set var="setTitle" value="${ notice_list.title}"/>
											<c:out value='${notice_list.title}'/></a></td>								
										<td class="notice_td"><a href="noticeRead.do?noticeNum=${notice_list.notice_num}"><c:out value='${notice_list.w_date}'/></a></td>								
									</tr>
							</c:forEach>
							
						
						</tbody>
					</table>
				<!-- --------------------------- 페이징 시작 ------------------------------ -->
				<form name="searchFrm" action="notice.do" method="post">
				
			    <input type="hidden" name="pageNo" value="${ pageVO.pageNo }"/>
			    <input type="hidden" name="startRowNo" value="${ pageVO.startRowNo }"/>
			    <input type="hidden" name="endRowNo" value="${ pageVO.endRowNo }"/>
			    <input type="hidden" name="pageSize" value="${ pageVO.pageSize }"/>
			    
			    <div id="paging">
				    
				    <c:if test="${ pageVO.pageNo != 0}">
				    
				       <c:if test="${ pageVO.pageNo > pageVO.pageBlock }">
				           <a href="#"onclick="fn_movePage(${ pageVO.firstPageNo })">
					           <span>[ 첫 페이지 ]</span>
				           </a>
				       </c:if>
				       
				       <c:if test="${ pageVO.pageNo != 1 }">
				           <a href="#"onclick="fn_movePage(${ pageVO.prevPageNo })">[이전]</a>
				       </c:if>
				       
				       <span>
				            <c:forEach var="i" begin="${ pageVO.startPageNo }" end="${ pageVO.endPageNo }" step="1">
				                <c:choose>
				                    <c:when test="${ i eq pageVO.pageNo }">
				                        <a href="#" onclick="fn_movePage(${ i })">
				                        	<span id="selected_page">[ ${ i } ]</span>
				                        </a>
				                    </c:when>
				                    <c:otherwise>
				                        <a href="#" onclick="fn_movePage(${ i })">[${ i }]</a>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				       </span>
				       
				       <c:if test="${ pageVO.pageNo != pageVO.finalPageNo }">
				            <a href="#" onclick="fn_movePage(${ pageVO.nextPageNo })">[다음]</a>
				       </c:if>
				       
				       <c:if test="${ pageVO.endPageNo < pageVO.finalPageNo }">
				           <a href="#" onclick="fn_movePage(${ pageVO.finalPageNo })">[마지막 페이지]</a>
				       </c:if>
				       
				    </c:if>
				    
			    </div><!-- page -->
				</form>
				<!-- --------------------------- 페이징 끝 ------------------------------ -->
				</div>
				
				
				<!-------------------------- 하단 푸터  -------------------------->
				<div id="footer" style="padding-top: 10px">
					<img alt="풋터" src="common/images/main_img/footer.jpg" />
				</div>
				<!------------------------ content 추가  ------------------------>
		</div>
</body>
</html>