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
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_login.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type='text/javascript' src='/group_prj_art/js/js_menu.js' charset='UTF-8'></script>

<script type="text/javascript">

</script>
</head>

<body>
		
	<form id="main_frm" method="POST" action="logincheck.do">
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
		
			<!------------------------ content 추가  ------------------------>
			<div id="sub_top">
		       	<span id="sub_top_text" ><h3>| 전시 일정 캘린더  </h3></span>
		    </div>
			<div id="login_content">
				<div id="loginMenu">
					<input type="text"  size="12" id="id" name="id"><br>
					<input type="password" size="12" id="pass" name="pass"><br>
					<input type="button" onclick="Login()" value="로그인" id="login"/>
					<input type="button" onclick="join()" value="회원가입" id="join" ><br>
				</div>
			</div>
			<!------------------------ content 추가  ------------------------>
			<div id="footer" style="padding-top: 10px">
				<img alt="풋터" src="common/images/main_img/footer.jpg" />
			</div>
		
		</div>
				<!-------------------------- 하단 푸터  -------------------------->
	</form>
	
<script type="text/javascript">
function join(){
	location.href="signin.do"
}
function Login(){
	if(!$("#id").val()){
		alert("아이디를 입력해주세요!");
		$("id").focus();
		return;
	}
	if(!$("#pass").val()){
		alert("비밀번호를 입력해주세요!")
		$("pass").focus();
		return;
	}
	$("#main_frm").submit();
}
</script>
</body>
</html>
