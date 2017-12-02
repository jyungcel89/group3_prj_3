package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.co.sist.domain.ArtPlaceInfo;
import kr.co.sist.domain.PlaceList;
import kr.co.sist.service.MapService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
@Controller
public class MapController {
	@Autowired
	private MapService ms;	
	
	//Map 영역
	@RequestMapping(value="Map.do",method={GET,POST})
	public String showMap(Model model){
		
		List<String> gu=ms.searchGu();
		System.out.println( "--------gu size  is=---------"+gu.size());
		model.addAttribute("guList",gu);
			
		return "map/index";
	}
	//@RequestParam(defaultValue="0") 
	@RequestMapping(value="Info.do",method={GET,POST})
	public String showPlaceInfo(Model model, int p_num){
		
		ArtPlaceInfo placeInfo=ms.showPlaceInfo(p_num);
		System.out.println(placeInfo.toString()+"====================");
		System.out.println(p_num+"====================");
		
		model.addAttribute("artPlace",placeInfo);
		return "map/informationWindow";
	}
	
	
	@RequestMapping(value="List.do",method={GET,POST})
	public String showPlaceList(Model model,String categ){
		System.out.println(categ);
		
		
		List<PlaceList> result=null;
		if(categ.endsWith("구")){
			result=ms.showPlaceGu(categ);
		}else{
			result=ms.showPlaceName(categ);
		}
		
		JSONArray ja = new JSONArray();
		JSONObject json=null;
		PlaceList plv=null;
		for(int i=0; i<result.size();i++){
			json=new JSONObject();
			plv=result.get(i);
			json.put("placename",plv.getPlacename());
			json.put("img",plv.getImg());
			
			ja.add(json);
		}
		model.addAttribute("selectList",ja);
		
		return "map/json2";
	}
	@RequestMapping(value="ListRegion.do",method={GET,POST})
	public String selectedRegion(Model model,String categ){
		System.out.println(categ);
		String strResult=null;
		List<String> result=null;
		
		if(categ.endsWith("구")){
			result=ms.selectedRegion(categ);
		}else{
			result=ms.selectedRegionName(categ);
		}
			Gson gson = new Gson();
			
			strResult = gson.toJson(result);  			  
		model.addAttribute("output",strResult);
		
		return "map/json";
	}

}//class
