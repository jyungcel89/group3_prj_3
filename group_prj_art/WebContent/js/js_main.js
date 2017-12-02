 /*  게시판 메뉴   */
    $(document).ready(function() {
            //[1] 기본값 설정
            $("#border_notice").show();
            $("#border_event").hide();
           
            $(".event").click(function() {
                //3000 : 3초, 'slow', 'normal', 'fast'
                $("#border_event").show();
                $("#border_notice").hide();
                
            });
            $(".notice").click(function() {
            	//3000 : 3초, 'slow', 'normal', 'fast'
            	$("#border_event").hide();
            	$("#border_notice").show();
            });
        });



 	function borderStyle_event(obj){
		if(obj.id=="off"){
			document.getElementById("on").id="off";
			obj.id="on";
		}
 	}
 	function borderStyle_notice(obj){
 		if(obj.id=="off"){
 			document.getElementById("on").id="off";
 			obj.id="on";
 		}
 	}

         
         