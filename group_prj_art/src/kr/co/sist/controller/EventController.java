package kr.co.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.domain.EventReadList;
import kr.co.sist.domain.EventSelectList;
import kr.co.sist.service.EventService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;
import java.util.List;


@Controller
public class EventController {

	@Autowired
	private EventService evts;
	
	@RequestMapping(value="event.do",method={GET,POST})
	public String eventList(Model model, EventSelectList esl)throws SQLException{
		
		int totalCount=evts.countAllList();
		esl.setTotalCount(totalCount);
		model.addAttribute("pageVO", esl);
		List<EventSelectList> list = evts.searchEventList(esl);
		model.addAttribute("event_list",list);
		
		return "event/event";
	}//eventList
	
	@RequestMapping(value="eventRead.do",method={GET,POST})
	public String eventRead(Model model, int event_num){
		EventReadList erl = evts.EventView(event_num);
		model.addAttribute("event_read_list",erl);
		
		return "event/event_view";
	}//eventRead	
	
}//class



