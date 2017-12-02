package kr.co.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.sist.service.LoginService;
import kr.co.sist.service.MemberService;
import kr.co.sist.vo.LoginParamVO;
import kr.co.sist.vo.MemberVO;
import kr.co.sist.vo.SearchIdParamVO;
import kr.co.sist.vo.SearchPassParamVO;

@Controller
public class LoginController {
	@Autowired
	private LoginService ls;
	@Autowired
	private MemberService mbs;

	
	@RequestMapping(value="login.do",method={GET,POST})
	public String login(){
		
		return "login/login";
	}
	@RequestMapping(value="logincheck.do",method={GET,POST})
	public String logincheck(HttpServletRequest request,LoginParamVO lpv,String id,String pass){
		
		String pageResult=null;
		HttpSession session=request.getSession();
		
		String result=null;
		System.out.println("============================="+lpv.toString());
		
		result=ls.confirmInfo(lpv);
		if(result!=null&&!id.equals("")&&!pass.equals("")){
			session.setAttribute("id",result);
			pageResult="main/main";
		}else{
			pageResult="login/loginError";
		}
		return pageResult;
	}
	
	
	@RequestMapping(value="logout.do",method={GET,POST})
	public String loginOut(HttpServletRequest request,String id){
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		return "main/main";
	}
	@RequestMapping(value="find_id.do",method={GET,POST})
	public String searchIDPage(){
		return "login/searchID";
	}
	@RequestMapping(value="find_pw.do",method={GET,POST})
	public String searchPassPage(){
		return "login/searchPass";
	}
	@RequestMapping(value="search_pass.do",method={GET,POST})
	public String searchPass(Model model,SearchPassParamVO sppv){
		String resultPass=null;
		resultPass=ls.searchPass(sppv);
		String page=null;
		
		if(resultPass!=null){
			model.addAttribute("outputPass",resultPass);
			page="login/confirm_pass";
		}else{
			page="login/searchPassError";
		}
		
		return page;
	}
	
	@RequestMapping(value="search_id.do",method={GET,POST})
	public String searchID(Model model,SearchIdParamVO sipv){
		String resultID=null;
		resultID=ls.searchID(sipv);
		String page=null;
		if(resultID!=null){
			page="login/confirm_id";
			model.addAttribute("outputID",resultID);
		}else{
			page="login/searchIDError";
		}
		
		
		return page;
	}
	@RequestMapping(value="signin.do",method={GET,POST})
	public String signIn(){
		return "member/join";
	}
	@RequestMapping(value="addMember.do",method={GET,POST})
	public String addMember(Model model,MemberVO mv){
		
		int cnt=mbs.insertMember(mv);
		String msg="회원가입에 성공하였습니다.";
		
		if(cnt>0){
		model.addAttribute("added",msg);
		}else{
			System.out.println("오류");
		}
		
		return "main/main";
	}



	
}
