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
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_qnaList.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='/group_prj_art/js/js_menu.js' charset='UTF-8'></script>

</head>

<body>
		
	<form id="qna_frm" >
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
				
				<div id="qna_body">
					
					<input type="button" value="글쓰기" id="write_btn"/>
					
					<table id="body_tab">
						<thead>
							<tr>
								<th class="list_th" id="td_num">번호</th>
								<th class="list_th" id="td_writer">작성자</th>
								<th class="list_th" id="td_title">제목</th>
								<th class="list_th" id="w_date">작성일</th>
							</tr>
						</thead>
						<tbody>
						
							<c:if test="${ empty requestScope.qna_list  }">
								<tr>
									<td class="qna_td" colspan="4"> 작성된 질문이 없습니다 .</td>
								</tr>
							</c:if>
							<c:if test="${requestScope.private_flag}=='n'">
								<tr>
									<td class="qna_td" colspan="4"><a href="qnaRead.do"> 비밀글 입니다.</a></td>
								</tr>
							</c:if>
							
					<c:forEach var="qnaList" items="${requestScope.qna_list}">
                        <c:choose>
                            <c:when test="${qnaList.private_flag eq 'y'}">
                               <tr>
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.qna_num}'/></a></td>                        
                                 <td class="qna_td"></td>                        
                                 <td class="qna_td" align="center"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"> 비밀글 입니다.</a></td>
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.w_date}'/></a></td>                        
                              </tr>
                            </c:when>
                            <c:otherwise>
                               <tr>
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.qna_num}'/></a></td>                        
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.id}'/></a></td>                        
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.title}'/></a></td>                        
                                 <td class="qna_td"><a href="qnaRead.do?qna_num=${qnaList.qna_num}"><c:out value='${qnaList.w_date}'/></a></td>                        
                              </tr>
                            </c:otherwise>
                        </c:choose>
                           
                     </c:forEach>
							
						
						</tbody>
					</table>
					
					<div id="pageing">
					
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