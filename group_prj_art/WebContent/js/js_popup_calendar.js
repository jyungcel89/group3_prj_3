/**
 * popup_calendar.jsp 에 대한 javascript source
 */
function fn_movePage(val){
	
$("input[name=pageNo]").val(val);
$("form[name=searchFrm]").attr("method", "post");
$("form[name=searchFrm]").attr("action","").submit();
	
}//fn_movePage