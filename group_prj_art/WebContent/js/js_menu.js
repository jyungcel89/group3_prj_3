/**
 * 메뉴 보드랍게 / 마우스 롤오버
 */
 $(document).ready(function(){
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        }).hover(function(){
            $(this).next("ul").stop(true,false).slideDown();
        },function(){
            $(this).next("ul").stop(true,false).slideUp();
        });
        
        $(".sub_li").hover(function(){
        	$(".hide").stop();
        },function(){
            $(".hide").slideUp();
        });
        
    });
    /*  메뉴 마우스 오버  */
        function image_on(obj) {
            obj.src = obj.src.replace('menu', 's_menu');
        }
         function image_off(obj) {
              obj.src = obj.src.replace('s_menu', 'menu');
         }
    /*  메뉴 마우스 오버  */

         
         