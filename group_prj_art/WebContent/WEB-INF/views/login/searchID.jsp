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

<script type='text/javascript' src='/group_prj_art2/js/js_menu.js' charset='UTF-8'></script>
<script type="text/javascript">
$(function(){
	$("#findPass").css('background-color','white').css('width','150px').css('height','30px');
	$("#findID").css('background-color','#86af49').css('width','150px').css('height','30px');
});
</script>
</head>
<body>
		
	<form id="main_frm2" method="POST" action="search_id.do">
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
		<div id="wrap_content"> 
			<!------------------------ content 추가  ------------------------>
			<div id="sub_top">
		       	<span id="sub_top_text" ><h3>| 아이디 찾기  </h3></span>
		    </div>
		    <div id="searchId_content">
				<div id="searchSort">
					<input type="button" value="아이디찾기" id="findID" onclick="moveSearchID()" >
					<input type="button" value="비밀번호찾기" id="findPass" onclick="moveSearchPass()">
				</div>
				<div id="searchMenu">
					<div id="nm">
							이름:
							<input type="text"  size="26" id="name" name="name">
					</div>
					<div id="pn">		
							전화번호:
							<input type="text"  size="3" id="phone1" name="phone1" > -
							<input type="text"  size="4" id="phone2" name="phone2" > -
							<input type="text"  size="4" id="phone3" name="phone3">
							<input type="hidden"  id="phone" name="phone">
						<br>
					</div>
					<div id="bir">
					  생일:
					  <input type="text"  size="4" id="year" name="year"> 년
					  <input type="text"  size="2" id="month" name="month"> 월
					  <input type="text"  size="2" id="day" name="day"> 일
					  <input type="hidden"  id="birth" name="birth">
					</div>
					<br><br>
					<input type="button" onclick="search()" value="찾기" id="searchID" ><br>
				</div>
		    </div>
			<!------------------------ content 추가  ------------------------>
			<div id="footer" style="padding-top: 10px">
				<img alt="풋터" src="common/images/main_img/footer.jpg" />
			</div>
			<!-------------------------- 하단 푸터  -------------------------->
		</div>
	</form>
		<script type="text/javascript">
		function moveSearchID(){
			location.href="find_id.do"
		}
		function moveSearchPass(){
			location.href="find_pw.do"
		}
	function search(){
		var flag=false;
		if(!$("#name").val()){
			alert("이름을 입력해주세요!");
			return;
		}
		else if(!$("#phone1").val()&&!$("#phone2").val()&&!$("#phone3").val()){
			alert("전화번호를 올바르게 입력해주세요")
			return;
		}
		else if(!$("#year").val()&&!$("#month").val()&&!$("#day").val()){
			alert("생일을 올바르게 입력해주세요!")
			return;
		}
		var flag=true;	
	var phone=$("#phone1").val()+'-'+$("#phone2").val()+'-'+$("#phone3").val()
	var birth=$("#year").val()+'.'+$("#month").val()+'.'+$("#day").val()
	
	$("#phone").val( phone );
	$("#birth").val( birth );
	if(flag){
	$("#main_frm2").submit();
	}else{
		return;
	}
}
</script>
</body>
</html>
