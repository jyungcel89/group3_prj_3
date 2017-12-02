<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/campsite_main.css">
<link rel='stylesheet' type='text/css' href='/group_prj_art/css/css_menu.css'/>
<script src="js/ol-debug.js"></script>
<script src="js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4c43e357d4424a80299091b2b0d9c3a3"></script>
<script src="http://openlayers.org/en/v3.16.0/build/ol.js"></script>
<script src="https://openlayers.org/en/v4.2.0/build/ol.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
		<form id="main_frm" >
		<div id="menu_inc" >
			<!------------------------ left_menu  ------------------------>					
				<c:import url="${request.contextPath}/menu.do"/>
			<!------------------------ left_menu  ------------------------>		
		</div>
			
			<div id="wrap_content"> 
			<div id="sub_top">
               <span id="sub_top_text" ><h3>| 지도보기</h3></span>
            </div>
			
			
			<div id="contents"></div>
			<div id="leftSub">
			<div id="basic">
			<label><strong>검색하기:</strong></label>
			&nbsp
			<select id="categMethod">
			<option value="basic">-검색조건선택-</option>
			<option value="gu">구 단위 검색</option>
			<option value="name">이름으로 검색</option>
			</select>
			</div><br><br>
			
			<select id="categ">
  			<option value="search">(구)선택</option>
  			<c:forEach var="gu" items="${requestScope.guList}">
  			<option value="place">${ gu }</option>
  			</c:forEach>
			</select>
			
			<input type="text" id="selectId" size="12">
			
			<input type="button" onclick="selectRegion()" value="검색" id="click"><br>
			<br>
			<div style="overflow:scroll; width:200px; height:400px; padding:10px; background-color:white;">
			<div id="tableArea">
			
			<table class="guList" border="1">
			</table>
			</div>
			</div>
			</div>
			
			<div id="mapArea">
				<div id="map"></div>
			</div>

	<div id="FeatureInfo"></div>
	<div id="FeatureInfoR"><div id="roadview" style="width:380px;height:400px;"></div>
	<div style="position: absolute; right: 50px;bottom:1px;"><input type="button"  onclick="FeatureInfoWndCloseR();" value="종료" style="WIDTH: 60pt; HEIGHT: 20pt"/>
	</div>
	
	</div>
	</div>
		<script src="/group_prj_art/js/saferoad.map.js"></script>
		<script src="/group_prj_art/js/safeload.ui.js"></script>
				
				<!-------------------------- 하단 푸터  -------------------------->
				<div id="footer">
					<img alt="풋터" src="common/images/main_img/footer.jpg" />
				</div>
				<!------------------------ content 추가  ------------------------>
	</form>
	<script>
$("#categ").hide();
$("#selectId").hide();
$("#click").hide();

$("#categMethod").change(function(){
	var caregMethod=document.getElementById("categMethod");

	if(caregMethod.selectedIndex==0){
		$("#tableArea").hide();		
	}else{
		$("#tableArea").show();		
	}
	if($("#categMethod option:selected").text()=="구 단위 검색"){
		$("#categ").show();
		$("#click").show();
		$("#selectId").hide();
	}else if($("#categMethod option:selected").text()=="이름으로 검색"){
		$("#selectId").show();
		$("#click").show();
		$("#categ").hide();
	}else{
		$("#categ").hide();
		$("#selectId").hide();
		$("#click").hide();
	}
});


function selectRegion()
{
	var data2=null;
	if($("#categMethod option:selected").text()=="이름으로 검색"){
		data2=$("#selectId").val();
	}else{
	 data2=$("#categ option:selected").text();
	}

	
 $.ajax({
	url:"ListRegion.do",
	cache:false,
	dataType:"json",
	data:"categ="+data2,
 }).done(function(data){
	 var count =data.length;
	 var strTemp="";
	 for(var i=0;i<count;i++){
		 strTemp+=data[i];
	     strTemp+=(i<(count-1)?',':'');
	 }
		console.log(strTemp);
	     setGIDList(strTemp);
 });	
 
 
 $.ajax({
	url:"List.do",
	cache:false,
	dataType:"json",
	data:"categ="+data2,
	
	error:function(xhr){
		$("#guList").html("<strong>"+"오류"+"ggg"+"</strong>")
	alert(data2)
	},
	success:function(json_arr){
		var out_data='';
		$.each(json_arr,function(idx,json){//idx,index,json은 json_arr에 현재 인덱스 방에 값을 저장한 객체
			out_data+="<tr class='alt'><td id='listRow1'><img src=http://localhost:8080/group_prj_art/place_img/"+json.img+"></td>"+
			"<td id='listRow2'>"+json.placename+"</td></tr>";
		});//each
		$(".guList").html(out_data);
	}
 })
 
}  

function button1_click(){
	$("#FeatureInfoR").show();
}

function FeatureInfoWndCloseR()
{
	$("#FeatureInfoR").hide();
}
</script>

</body>
</html>

