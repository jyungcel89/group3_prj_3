package kr.co.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.sist.domain.ExhibitComment;
import kr.co.sist.domain.ExhibitInfo;
import kr.co.sist.domain.InsertUserComment;
import kr.co.sist.service.ExhibitService;
import kr.co.sist.vo.CalExhibitListVO;
import kr.co.sist.vo.ExhibitListVO;
import kr.co.sist.vo.Paging;
//2017-12-02 git update
@Controller
@SessionAttributes("id")
public class ExhibitController {
	@Autowired
	private ExhibitService es;
	//////////////////////////exhibit////////////////////////////
	// 리스트 보기
	@RequestMapping(value="exhibit_list.do",method={GET,POST})
	public String exListPage( Model model, Paging paging )throws SQLException{
		
		int totalCount=es.countAllList(paging);
		paging.setTotalCount(totalCount);
		model.addAttribute("pageVO", paging);

		List<ExhibitListVO> list=es.searchExhibit( paging );
		
		model.addAttribute("exhibit_list", list);
		
		return "exhibit/exhibit_list";
	}//exListPage
	
	////////////////////////// exInfoPage ////////////////////////////////////
	//전시상세정보
	@RequestMapping(value="exhibit_info.do",method={GET,POST})
	public String exInfoPage(Model model, ExhibitComment exhibitCmt, int ex_num, InsertUserComment insertUCmt, HttpSession session ) throws SQLException{
		session.getAttribute("id");
		
		int totalCount=es.countAllCmtList(ex_num);
		exhibitCmt.setTotalCount(totalCount);
		model.addAttribute("pageVO", exhibitCmt);
		
		ExhibitInfo exInfo=es.searchOneExhibit(ex_num);
		List<ExhibitComment> exCmt=es.searchExhibitCmt(exhibitCmt);
		
		int scoreAvg=es.calculateScore(ex_num);

		model.addAttribute("exhibitOne", exInfo );
		model.addAttribute("comment_list", exCmt);
		model.addAttribute("exhibit_score",scoreAvg);
		
		return "exhibit/exhibit_info";
	}//exInfoPage
	
	//전시회 댓글 작성
	@RequestMapping(value="insert_cmt.do",method={GET,POST})
	public String insertCmt(Model model, InsertUserComment insertUCmt ) throws SQLException{
		
		boolean flag=es.insertCmt(insertUCmt);
		model.addAttribute("insertCmtFlag",flag);
		
		return "forward:exhibit_info.do";
	}//insertCmt
	/////////////////////////////////////////////////////////////////////
	
	//달력보기
	@RequestMapping(value="exhibit_calendar.do",method={GET,POST})
	public String exCalendarPage(Model model){
		
		String path="exhibit/exhibit_calendar";
		
		return path;
	}//exCalendarPage

	//달력 팝업 화면
	@RequestMapping(value="popup_calendar.do",method={GET,POST})
	public String exCalPopup(Model model, CalExhibitListVO cel_vo, String selectDate ) throws SQLException{
		int totalCount=es.countAllCalList(selectDate);
		cel_vo.setSelectDate(selectDate);
		cel_vo.setTotalCount(totalCount);
		model.addAttribute("pageVO", cel_vo);
		List<CalExhibitListVO> list=es.searchCalExhibitList( cel_vo );
		
		model.addAttribute("popup_list",list);
		return "exhibit/popup_calendar";
	}//exCalPopup
	
}//class
