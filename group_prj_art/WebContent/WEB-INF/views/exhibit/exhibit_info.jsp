
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
<script type='text/javascript' src='/group_prj_art/js/js_menu.js'charset='UTF-8'></script>
<script type='text/javascript' src='/group_prj_art/js/js_exhibit_info.js'charset='UTF-8'></script>
<!-- CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<div id="menu_inc" >
		<!------------------------ left_menu  ------------------------>					
			<c:import url="${request.contextPath}/menu.do"/>
		<!------------------------ left_menu  ------------------------>		
	</div>
	<div id="wrap_content">
		<div id="sub_top">
            <span id="sub_top_text" ><h3>| 전시 세부정보 조회  </h3></span>
        </div>
		<div id="main_content">

		<div id="exhibit_content">
			<div id="exhibitInfoFrm">

				<aside>
					<div id="ex_img">
						<img src="http://127.0.0.1:8080/group_prj_art/common/images/exhibit_img/m_${ requestScope.exhibitOne.img }"/>
					</div>
					<!-- ex_inner1 시작 -->
					<div id="ex_inner1">
						<div id="ex_inner_score">
							<div id="ex_score_title">리뷰 / 평점</div>
							<div id="ex_score_avg">
								<c:choose>
									<c:when test="${ requestScope.exhibit_score == 1 }">
										<span>★☆☆☆☆</span>
									</c:when>
									<c:when test="${ requestScope.exhibit_score == 2 }">
										<span>★★☆☆☆</span>
									</c:when>
									<c:when test="${ requestScope.exhibit_score == 3 }">
										<span>★★★☆☆</span>
									</c:when>
									<c:when test="${ requestScope.exhibit_score == 4 }">
										<span>★★★★☆</span>
									</c:when>
									<c:when test="${ requestScope.exhibit_score == 5 }">
										<span>★★★★★</span>
									</c:when>
									<c:when test="${ requestScope.exhibit_score == 0 }">
										<span>평점을 매겨주세요.</span>
									</c:when>
								</c:choose>
							</div>
						</div>
						<div id="ex_inner_info_detail">
							<table id="exInfo_tab">
							
								<tr>
									<td class="exInfo_tab_cate">기간</td>  
									<td class="exInfo_tab_info">
										<c:out value="${ exhibitOne.start_day }"/> ~ 
										<c:out value="${ exhibitOne.end_day }"/>
									</td>
								<tr>
									<td class="exInfo_tab_cate">장소</td>  
									<td class="exInfo_tab_info">
										<c:out value="${ exhibitOne.place_name }"></c:out>
									</td>
								</tr>
								<tr>
									<td rowspan="3" class="exInfo_tab_cate">요금</td>  
									<td class="exInfo_tab_info">
										<span>성인  <c:out value="${ exhibitOne.fee_adult }"/></span>
									</td>
								<tr>
									<td class="exInfo_tab_info">
										<span>청소년  <c:out value="${ exhibitOne.fee_youth }"/></span>
									</td>
								</tr>
								<tr>
									<td class="exInfo_tab_info">
										<span>어린이  <c:out value="${ exhibitOne.fee_child }"/></span>
									</td>
								</tr>
							</table>
							<hr/>
						</div>
						<div id="ex_inner_map_btn">
							<a href="Info.do?p_num=${ requestScope.p_num }">
								<input type="image" id="map_btn" src="http://127.0.0.1:8080/group_prj_art/common/images/exhibit_img/map_btn.jpg" />
							</a>
						</div>
						
					</div>
				</aside>
				<!-- ex_inner2 
					아이디(세션에서 가져오기) | 평점 별(라디오) | 댓글작성(인풋-텍스트) | 댓글등록(버튼)
				 -->
			 	<form name="insertCmtFrm" action="insert_cmt.do" method="post">
 				<input type="hidden" name="ex_num" value="${ exhibitOne.ex_num }"/>
				<input type="hidden" name="id" value="${ sessionScope.id }"/>
				<input type="hidden" name="p_num" value="${ exhibitOne.p_num }"/>

				<div id="ex_inner2">
					<aside>
						<div id="ex_inner2_id">
							<span id="ex_id">
								<c:choose>
									<c:when test="${ null ne sessionScope.id }">
										<c:out value="${ sessionScope.id }"/>
									</c:when>
									<c:otherwise>
										<c:out value="로그인해주세요."/>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<div id="ex_inner2_score">
							<table id="ex_score">
								<tr id="ex_score_tr_star">
									<td>★</td>
									<td>★</td>
									<td>★</td>
									<td>★</td>
									<td>★</td>
								</tr>
								<tr id="ex_score_tr_radio">
									<td><input type="radio" checked="checked" name="score" value="1"/></td>
									<td><input type="radio" name="score" value="2"/></td>
									<td><input type="radio" name="score" value="3"/></td>
									<td><input type="radio" name="score" value="4"/></td>
									<td><input type="radio" name="score" value="5"/></td>
								</tr>
							</table>
						</div>
						<div id="ex_inner2_cmt">
							<c:choose>
								<c:when test="${ null ne sessionScope.id }">
									<input id="tf_cmt" type="text" name="comment_detail" placeholder="  해당 전시에 대한 코멘트를 입력해주세요."/>
								</c:when>
								<c:otherwise>
									<input id="tf_cmt" type="text" name="comment_detail" placeholder="  로그인을 해야 코멘트 작성을 할 수 있습니다." disabled="disabled"/>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="ex_inner2_btn">
							<c:choose>
								<c:when test="${ null ne sessionScope.id }">
									<input type="submit" value="등록" id="submit_comment" onclick="insertCmt()"/>
								</c:when>
								<c:otherwise>
									<input type="button" value="등록" id="submit_comment" onclick="block()"/>
								</c:otherwise>
							</c:choose>
						</div>
					</aside>
				</div>
				</form>
				
				<!--------------------- ex_inner3 	아이디 | 별점 | 내용 | 작성날짜 ------------------------------>
				<div id="ex_inner3">
					<div id="ex_inner3_show_comment">
						<table id="cmt_tab">
							<tr>
								<th class="list_th" id="list_th_id">아이디</th>
								<th class="list_th" id="score">별점</th>
								<th class="list_th" id="list_th_comment">내용</th>
								<th class="list_th" id="list_th_date">등록일</th>
							</tr>
							
							<c:if test="${ empty requestScope.comment_list }">
								<tr>
									<td colspan="4"> 작성된 댓글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="exhibitCmt" items="${ requestScope.comment_list }">
								<tr>
									<td id="list_cmt_id"><c:out value="${ exhibitCmt.id }"/></td>
									<td id="list_cmt_score">
										<c:choose>
											<c:when test="${ exhibitCmt.score == '1' }">
												<span>★☆☆☆☆</span>
											</c:when>
											<c:when test="${ exhibitCmt.score == '2' }">
												<span>★★☆☆☆</span>
											</c:when>
											<c:when test="${ exhibitCmt.score == '3' }">
												<span>★★★☆☆</span>
											</c:when>
											<c:when test="${ exhibitCmt.score == '4' }">
												<span>★★★★☆</span>
											</c:when>
											<c:when test="${ exhibitCmt.score == '5' }">
												<span>★★★★★</span>
											</c:when>
										</c:choose>
									</td>
									<td id="list_cmt_comment"><c:out value="${ exhibitCmt.comment_detail }"/></td>
									<td id="list_cmt_date"><c:out value="${ exhibitCmt.w_date }"></c:out></td>
								</tr>
							</c:forEach> 
							
						</table>
						
					</div>
				</div><!----------------------- ex_inner3 -------------------->
				
			</div><!------------------ exhibitInfoFrm ------------------>
			
			
			<!-- --------------------------- 페이징 시작 ------------------------------ -->
			<form name="searchFrm" action="exhibit_info.do" method="post">
			
		    <input type="hidden" name="pageNo" value="${ pageVO.pageNo }"/>
		    <input type="hidden" name="startRowNo" value="${ pageVO.startRowNo }"/>
		    <input type="hidden" name="endRowNo" value="${ pageVO.endRowNo }"/>
		    <input type="hidden" name="pageSize" value="${ pageVO.pageSize }"/>
			
		    <div id="paging_cmt">
			    
			    <c:if test="${pageVO.pageNo != 0}">
			    
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