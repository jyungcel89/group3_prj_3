package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.domain.MainEventList;
import kr.co.sist.domain.MainExInfoList;
import kr.co.sist.domain.MainNoticeList;
import kr.co.sist.service.MainService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
@Controller
public class MainController {
	@Autowired
	private MainService ms;
	//////////////////////main///////////////////////////
	@RequestMapping(value="main.do",method={GET,POST})
	public String mainPage(Model model, HttpSession session){

		
		System.out.println("main-----session----"+session.getAttribute("id"));
		List<MainNoticeList> list=ms.searchNotice();
		model.addAttribute("notice_list",list);

		List<MainEventList> evt_list=ms.searchEvent();
		model.addAttribute("event_list",evt_list);

		List<MainExInfoList> ex_list=ms.searchExInfo();
		model.addAttribute("ex_list",ex_list);
		
		
		return "main/main";
	}//mainPage
	
	
	@RequestMapping(value="menu.do",method={GET,POST})
	public String includeMenu(HttpSession session){
		session.getAttribute("id");
		System.out.println("menu-----session----"+session.getAttribute("id"));
		
		System.out.println("MainController---includeMenu");
		return "inc/left_menu";
	}//includeMenu
	
}//class
