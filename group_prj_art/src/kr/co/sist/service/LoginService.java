package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Properties;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;


import kr.co.sist.dao.loginDAO;
import kr.co.sist.vo.LoginParamVO;
import kr.co.sist.vo.SearchIdParamVO;
import kr.co.sist.vo.SearchPassParamVO;

@Component
public class LoginService {
	@Autowired
	private loginDAO l_dao;
	
	public String confirmInfo(LoginParamVO lpv){
		String inputInfo=null;
		try{
			inputInfo=l_dao.loginSuccess(lpv);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		System.out.println("ExhibitService / searchExhibit()---end");
		return inputInfo;
	}//confirmInfo
	
	public String searchID(SearchIdParamVO sipv){
		String outputID=null;
		try{
			outputID=l_dao.searchID(sipv);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return outputID;
	}//searchID
	public String searchPass(SearchPassParamVO sppv){
		String outputPass=null;
		try{
			outputPass=l_dao.searchPass(sppv);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		
		/*
		Properties props = System.getProperties();
		props.setProperty("host", "25");
		 
		// 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		try {
		    // 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
		    msg.setFrom(new InternetAddress("ghdtmdghks2@naver.com", "홍문화재단"));
		    System.out.println(l_dao.searchPass(sppv));
		    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(l_dao.searchPass(sppv), "ㅎㅎㅎ"));
		    msg.setSubject("제목이 이러저러합니다");
		    msg.setContent("본문이 어쩌구저쩌구합니다", "text/plain; charset=utf-8");
		 
		    // 메일을 발신한다
		    Transport.send(msg);
		} catch (Exception e) {
		   e.printStackTrace();
		}
		*/
/*		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("localhost");
		mailSender.setPort(8080);
		// 메일 내용을 작성한다
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("aaa@bbb.co.kr");
		try {
			msg.setTo(l_dao.searchPass(sppv));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msg.setSubject("제목이 이러저러합니다");
		msg.setText("본문이 어쩌구저쩌구합니다");
		 
		try {
		    mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		    // 적절히 처리
		}*/
		return outputPass;
	}//searchPass
	
	
	
	public void emailSend(){
	
	}
	
}
