
function FeatureInfoLoad(feature){
	$.ajax({
		url:'Info.do',
		cache:false,
		data:"p_num="+feature.get('p_num')
	}).done(function(data)
	{
		$("#FeatureInfo").html(data);
		
		$("#FeatureInfo").show();
		 
	});	
}


function FeatureInfoWndClose()
{
	$("#FeatureInfo").hide();
	$("#FeatureInfo h3").text("-");
	$("#FeatureInfo td").text("-");
	
}

function gnbMenuSelect(gnbid) {
    $(".leftContents.contents1").hide();
    $(".leftContents.contents2").hide();
    $(".leftContents.contents3").hide();
    $(".leftContents.contents4").hide();
    $(".leftContents.contents5").hide();
    $("li.icon1").removeClass("selected");
    $("li.icon2").removeClass("selected");
    $("li.icon3").removeClass("selected");
    $("li.icon4").removeClass("selected");
    $("li.icon5").removeClass("selected");
    switch (gnbid) {
        case 1:
            $(".leftContents.contents1").show();
            $("li.icon1").addClass("selected");
            break;
        case 2:
            $(".leftContents.contents2").show();
            $("li.icon2").addClass("selected");
            break;
        case 3:
            $(".leftContents.contents3").show();
            $("li.icon3").addClass("selected");
            break;
        case 4:
            $(".leftContents.contents4").show();
            $("li.icon4").addClass("selected");
            break;
        case 5:
            $(".leftContents.contents5").show();
            $("li.icon5").addClass("selected");
            break;
        default:
            $(".leftContents.contents1").show();
            $("li.icon1").addClass("selected");
            break;
    }
}

