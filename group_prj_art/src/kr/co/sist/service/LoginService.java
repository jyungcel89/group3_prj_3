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
		 
		// �� ȯ�� ������ "���� ����"�� ����� �� �޽����� �����
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		try {
		    // �߽���, ������, ������, ����, ���� ���� ���� �����Ѵ�
		    msg.setFrom(new InternetAddress("ghdtmdghks2@naver.com", "ȫ��ȭ���"));
		    System.out.println(l_dao.searchPass(sppv));
		    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(l_dao.searchPass(sppv), "������"));
		    msg.setSubject("������ �̷������մϴ�");
		    msg.setContent("������ ��¼����¼���մϴ�", "text/plain; charset=utf-8");
		 
		    // ������ �߽��Ѵ�
		    Transport.send(msg);
		} catch (Exception e) {
		   e.printStackTrace();
		}
		*/
/*		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("localhost");
		mailSender.setPort(8080);
		// ���� ������ �ۼ��Ѵ�
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("aaa@bbb.co.kr");
		try {
			msg.setTo(l_dao.searchPass(sppv));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msg.setSubject("������ �̷������մϴ�");
		msg.setText("������ ��¼����¼���մϴ�");
		 
		try {
		    mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		    // ������ ó��
		}*/
		return outputPass;
	}//searchPass
	
	
	
	public void emailSend(){
	
	}
	
}
