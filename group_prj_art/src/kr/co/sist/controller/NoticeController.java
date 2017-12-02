package kr.co.sist.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.domain.NoticeReadList;
import kr.co.sist.domain.NoticeSelectList;
import kr.co.sist.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService ns;
	
	@RequestMapping(value="notice.do",method={GET,POST})
	public String noticeList(Model model, NoticeSelectList nsl)throws SQLException{
		
		System.out.println("----------"+nsl.toString());
		int totalCount=ns.countAllList();
		nsl.setTotalCount(totalCount);
		model.addAttribute("pageVO",nsl);
		List<NoticeSelectList> list=ns.searchNoticeList(nsl);
		model.addAttribute("notice_list",list);
		
		return "notice/notice";
	}//noticeList
		
	@RequestMapping(value="noticeRead.do",method={GET,POST})
	public String noticeRead(Model model, int noticeNum){
		NoticeReadList nrl = ns.NoticeView(noticeNum);
		model.addAttribute("readOne",nrl);
		
		return "notice/notice_view";
	}//mainPage	
	
}
