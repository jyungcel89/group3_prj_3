package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;


@Controller
public class MypageController {
	//////////////////////mypage///////////////////////////
	@RequestMapping(value="myinfo.do",method={GET,POST})
	public String mypage(){
		
		return "mypage/myinfo";
	}//mainPage
	
}//class
