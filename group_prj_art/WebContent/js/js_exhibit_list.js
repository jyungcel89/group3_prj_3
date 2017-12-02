/**
 * exhibit_list.jsp 에 대한 javascript source
 */
//페이지 이동
function fn_movePage(val){
    $("input[name=pageNo]").val(val);
    $("form[name=searchFrm]").attr("method", "post");
    $("form[name=searchFrm]").attr("action","").submit();
	
}//fn_movePage
//검색 버튼
function fn_search(  ){

	if( $("#search_title").val() == "" ){
    	alert("검색 카테고리를 선택해주세요.");
        return;
    }else if( $("#search_word").val() == "" ){
    	alert("검색어를 입력해주세요.");
    	return;
    }//end if
    
	var searchCondition = $("#search_title").val();
    var searchValue = $("#search_word").val();
    
    $("input[name=searchCondition]").val(searchCondition);
    $("input[name=searchValue]").val(searchValue);
    
    $("form[name=searchFrm]").attr("method", "post");
    $("form[name=searchFrm]").attr("action","").submit();
    
}//fn_search