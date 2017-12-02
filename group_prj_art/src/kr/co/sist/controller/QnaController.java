package kr.co.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.domain.QnaReadList;
import kr.co.sist.domain.QnaSelectList;
import kr.co.sist.service.QnaService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;


@Controller
public class QnaController {
	@Autowired
	private QnaService qs;
	//////////////////////Q&A///////////////////////////
	@RequestMapping(value="qna.do",method={GET,POST})
	public String qnaList(Model model){
		List<QnaSelectList> list=qs.searchQnaList();
		model.addAttribute("qna_list",list);
		
		return "qna/qna_list";
	}//mainPage

	@RequestMapping(value="qnaRead.do",method={GET,POST})
	public String qnaRead(Model model, int qna_num){
		QnaReadList qrl = qs.ReadQnaOne(qna_num);
		model.addAttribute("readOne",qrl);
		
		return "qna/qna_view";
	}//mainPage
	
}//class



