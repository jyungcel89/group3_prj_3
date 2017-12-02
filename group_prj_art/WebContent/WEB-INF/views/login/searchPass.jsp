	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍 문화관광재단</title>
<!----------------------------------- CSS 링크 ------------------------------------------>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_menu.css'/>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_main.css'/>
<link rel='stylesheet' type='text/css' href='http://localhost:8080/group_prj_art/css/css_login.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type='text/javascript' src='http://211.63.89.149:8080/group_prj_art2/js/js_menu.js' charset='UTF-8'></script>
<script type="text/javascript">
$(function(){
	$("#findPass").css('background-color','#86af49').css('width','150px').css('height','30px');
	$("#findID").css('background-color','white').css('width','150px').css('height','30px');
	
});

</script>
</head>
<body>
		
	<form id="main_frm2" method="POST" action="search_pass.do">
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
				<!------------------------ content 추가  ------------------------>
			<div id="titleLogin">
			<h3><label id="textTitle" >|&nbsp&nbsp회원정보 찾기</label></h3><br><br><br>
			<hr id="underLogin">
			</div>
				<div id="searchSort">
						<input type="button" value="아이디찾기" id="findID" onclick="moveSearchID()" >
						<input type="button" value="비밀번호찾기" id="findPass">
				</div>
				<div id="searchMenu">
				
				
		
						<div id="iDIV">
								아이디:
								<input type="text"  size="26" id="ID" name="id"><br>
						</div>
						<div id="bDIV">
						  생일:
						  <input type="text"  size="4" id="year" name="year"> 년
						  <input type="text"  size="2" id="month" name="month"> 월
						  <input type="text"  size="2" id="day" name="day"> 일
						  <input type="hidden"  id="birth" name="birth">
						</div>
						<div id="eDIV">
								이메일:
								<input type="text"  size="10" id="email1" name="email1"> @
								<select id="email2" name="email2">
									<option>--</option>								
									<option>daum.net</option>								
									<option>naver.com</option>								
									<option>nate.com</option>								
									<option>gmail.com</option>
									<option>hanmail.net</option>							
								</select>
								<input type="hidden" id="email" name="email">
								<br>
						</div>
					<br><br>
					<input type="button" onclick="searchPW()" value="찾기" id="searchID" ><br>
				</div>
				
				<!------------------------ content 추가  ------------------------>
		</div>
				<div id="footer">
					<img alt="풋터" src="common/images/main_img/footer.jpg" />
				</div>
				<!-------------------------- 하단 푸터  -------------------------->
	</form>
		<script type="text/javascript">
		function moveSearchID(){
			location.href="find_id.do"
		}
	function searchPW(){
		if(!$("#ID").val()){
			alert("아이디를 입력해주세요!");
			return;
		}
		if(!$("#email1").val()||$("#email2").val()=='--'){
			alert("이메일을 올바르게 입력해주세요")
			return;
		}
		
		if(!$("#year").val()||!$("#month").val()||!$("#day").val()){
	
			alert("생일을 올바르게 입력해주세요!")
			return;
		}
	var birth=$("#year").val()+'.'+$("#month").val()+'.'+$("#day").val()
	var email=$("#email1").val()+'@'+$("#email2 option:selected").val()
	
	$("#birth").val( birth );
	$("#email").val(email);
	$("#main_frm2").submit();
	
}
	
</script>
</body>
</html>
