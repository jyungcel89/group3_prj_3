/**
 * exhibit_info.jsp 에 대한 javascript source
 */
function showPage(){
	var obj=document.searchFrm;
	obj.submit();
}//showPage

//페이지 이동
function fn_movePage(val){
	
  $("input[name=pageNo]").val(val);
  $("form[name=searchFrm]").attr("method", "post");
  $("form[name=searchFrm]").attr("action","").submit();
	
  alert(" pageNo : "+$("input[name=pageNo]").val());
  alert(" startRowNo :  "+$("input[name=startRowNo]").val());
  alert(" endRowNo :  "+$("input[name=endRowNo]").val());
}//fn_movePage

function insertCmt(){
	var obj=document.insertCmtFrm;
	if( $("input[name=comment_detail]").val() == "" || $("input[name=comment_detail]").val() == null ){
		return;
	} 
	obj.submit();
}

function block(){
	alert("로그인을 해야 평가하실 수 있습니다.");
}