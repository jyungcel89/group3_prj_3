<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=df08baa0d065709b793bb3c92235e84a"></script>
<link rel="stylesheet" href="/group_prj_art/css/campsite_main.css">

<script type="text/javascript">
	var lat=${artPlace.latitude}
	var lon=${artPlace.longitude}
	var roadview=null;
	var roadviewContainer=null;
function navi(){
	$("#FeatureInfoR").show();

}
	roadviewContainer= document.getElementById('roadview'); //로드뷰를 표시할 div
	roadview = new daum.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new daum.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
	var position = new daum.maps.LatLng(lon,lat);
	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	});
	var rMarker = new daum.maps.Marker({
    position: new daum.maps.LatLng(lon,lat),
    map: roadview //map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올라갑니다.
    
	});
	var rLabel = new daum.maps.InfoWindow({
    position: new daum.maps.LatLng(lon,lat),
	content:'<div style="padding:5px;width:100px;height:100px"><a href=${artPlace.site}>${artPlace.place_name}</a></div>'
	});
	rLabel.open(roadview, rMarker)


// 로드뷰에 올릴 장소명 인포윈도우를 생성합니다.

// 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정 합니다.
//var projection = roadview.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
</script>
<h3>${artPlace.place_name}</h3>
<div class="btnClose" onclick="FeatureInfoWndClose();"></div>
<hr>
<table>
<tr>
<th>주소</th>
<td>${artPlace.addr}</td>
</tr>
<tr>
<th>사이트</th>
<td ><a href="${artPlace.site}" target="_blank">${artPlace.site}</a>
</td>
</tr>
<tr>
<th>휴관</th>
<td>${artPlace.hollyday}</td>
</tr>
</table>

<div style="position: absolute; left: 20px;bottom:10px;">
<a onmouseup="navi()" style="WIDTH: 60pt; HEIGHT: 20pt">로드뷰보기</a>

</div>
<div style="position:absolute; left:110px; bottom:10px"><a href="http://map.daum.net/link/to/${artPlace.place_name},${artPlace.longitude},${artPlace.latitude}" target="_blank"  onClick="window.open(this.href, '', 'width=1000, height=800'); return false;">길찾기</a>
</div>

