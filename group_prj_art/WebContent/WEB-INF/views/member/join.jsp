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
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_join.css'/>
<!----------------------------------- JS 링크 ------------------------------------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type='text/javascript' src='http://127.0.0.1:8080/group_prj_art/js/js_menu.js' charset='UTF-8'></script>

<script type="text/javascript">
$(function(){
	$("#maleLb").click(function(){
		var man='남자'
		$("#maleLb").css('border','1px solid #86af49');
		$("#maleLb").css('color','#86af49');
		$("#femaleLb").css('border','1px solid #e9e9e9');
		$("#femaleLb").css('color','#c0c0c0');
		$("input[name=gender]").val(man);
	});
	$("#femaleLb").click(function(){
		var woman='여자'
		$("#femaleLb").css('border','1px solid #86af49');
		$("#femaleLb").css('color','#86af49');
		$("#maleLb").css('border','1px solid #e9e9e9');
		$("#maleLb").css('color','#c0c0c0');
		$("input[name=gender]").val(woman);
	});
	})
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
       	<span id="sub_top_text" ><h3>| 전시 일정 캘린더  </h3></span>
    </div>
    <div id="join_content">
	<form id="main_frm" method="POST" action="addMember.do">
	
		<input type="hidden" name="gender" id="gender">
		<input type="hidden" name="birth" id="birth">
		<input type="hidden" name="email" id="email">
		<input type="hidden" name="phone" id="phone">
		
		<div id="joinContainer">
		
		<div id="joinFrm">
		<div id="topDiv">
			<input type="text" id="mID" class="topDivInput" name="id" placeholder=" 아이디" />
			<input type="password" id="mPass" class="topDivInput" name="pass" placeholder=" 비밀번호"/>
			<input type="password" id="mPassConfirm" class="topDivInput" placeholder=" 비밀번호 확인"/>
		</div>
		
		<div id="middleDiv">
		
			<div class="innerMidDiv">
				<input type="text" id="mName" name="name" placeholder=" 이름">
			</div>
			<div class="innerMidDiv">
<!-- 				<input type="button" value="남자" id="m" class="gender_btn">&nbsp&nbsp<input type="button" value="여자" id="w" class="gender_btn"> -->
				<span id="gender">
					<span class="gender_btn">
						<label id="maleLb" for="m">남자
						<input type="radio" name="gender" class="radio" value="남자" id="m"/>
						</label>
					</span>
					<span class="gender_btn">
						<label id="femaleLb" for="w">여자
						<input type="radio" name="gender" class="radio" value="여자" id="w"/>
						</label>
					</span>
				</span>
			</div>
			<div class="innerMidDiv">
				<span id="birthLb">생일</span>
				<div class="birthDiv"><input type="text" id="year" name="year" size="4" placeholder=" 년(YYYY)"/></div>
				<div class="birthDiv"><input type="text" id="month" name="month" size="2" placeholder=" 월(MM)"></div>
				<div class="birthDiv"><input type="text" id="day" name="day" size="2" placeholder=" 일(DD)"></div>
			</div>
			<div class="innerMidDiv">
				<span id="emailLb">이메일</span>
				<div id="emailAddr">
					<input type="text" id="email1" size="10" placeholder="이메일">
				</div>
				<span id="emailGol">@</span>
				<div id="emailDomain">
					<select id="email2">
						<option>도메인 선택</option>
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>daum.net</option>
						<option>nate.com</option>
						<option>gmail.com</option>
					</select>
				</div>
			</div>
		</div>
		
		<div id="bottomDiv">
			<div class="innerBtmDiv">
			<span id="phoneLb">전화번호</span>
			<div id="codeDiv">
				<select id="code_num">
					<option>+82</option>
				</select>
			</div>
			<div id="phoneDiv">
				<input type="text" id="phone" size="11" placeholder="  example : 01012345678">
			</div>
			</div>
			<div class="innerBtmDiv">
				<span id="addrLb">검색</span>
				<div id="addr1Div">
					<input type="text" id="addr1"name="addr" placeholder=" 주소를 검색해주세요.">
				</div>
				<div id="searchAddrBtn">
					<input type="button" id="addrBtn" value="주소검색"/>
				</div>
			</div>
			<div class="innerBtmDiv">
				<span id="addrDetailLb">상세주소</span>
				<div id="addr2Div">
					<input type="text" id="addr2" name="addr2" placeholder=" 상세주소를 직접 작성해주세요.">
				</div>
			</div>
		</div>
		<input type="button" onclick="join()" value="가입하기" id="joinBtn" >
		</div>
		
		</div>
		
	</form>
	</div>
				
	<!------------------------ content 추가  ------------------------>
	<div id="footer" style="padding-top: 10px">
		<img alt="풋터" src="common/images/main_img/footer.jpg" />
	</div>
	</div>
	<!-------------------------- 하단 푸터  -------------------------->
	
	
<script type="text/javascript">
	
function join(){

	if(!$("#mID").val()){
		alert("아이디를 입력해주세요!");
		return;
	}
	if(!$("#mPass").val()){
		alert("비밀번호를 다시 확인해 주세요!!")
		return;
	}
	if(!$("#mPassConfirm").val()){
		alert("비밀번호를 다시 확인해주세요!")
		return;
	}
	if(!$("#mName").val()){
		alert("이름을 입력해주세요!")
		return;
	}
	if(!$("#gender").val()){
		alert("성별을 선택해주세요!")
		return;
	}
	if(!$("#year").val() || !$("#month").val() || !$("#day").val()){
		alert("생일을 올바르게 입력해주세요")
		return;
	}
	if(!$("#email1").val()||!$("#email2").val()){
		alert("이메일 형식을 올바르게 입력해주세요")
		return;
	}
	if(!$("#phone").val()){
		alert("전화번호를 올바르게 입력해주세요!")
		return;
	}
	if(!$("#addr1").val()||!$("#month").val()||!$("#day").val()){
		alert("생일을 올바르게 입력해주세요")
		return;
	}
	
	var email=$("#email1").val()+'@'+$("#email2 option:selected").val();
	var phone=$("#code_num").val()+$("#phone").val();
	var birth=$("#year").val()+'.'+$("#month").val()+'.'+$("#day").val();


	$("#phone").val( phone )
	$("#birth").val( birth )
	$("#email").val(email)
	
	alert($("#phone").val( phone ))
	alert($("#birth").val( birth ))
	alert($("#email").val(email))
	
	$("#main_frm").submit();
	alert("환영합니다!")
}

</script>
</body>
</html>
