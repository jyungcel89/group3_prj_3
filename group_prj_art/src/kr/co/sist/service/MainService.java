package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.MainDAO;
import kr.co.sist.domain.MainEventList;
import kr.co.sist.domain.MainExInfoList;
import kr.co.sist.domain.MainNoticeList;


@Component
public class MainService {
	@Autowired
	private MainDAO m_dao;
	
	public List<MainNoticeList> searchNotice(){
		List<MainNoticeList> list=null;
		try{
			list=m_dao.selectNoticeList();
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return list;
	}//searchNitice
	
	public List<MainEventList> searchEvent(){
		List<MainEventList> list=null;
		try{
			list=m_dao.selectEventList();
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return list;
	}//searchEvent
	
	public List<MainExInfoList> searchExInfo(){
		List<MainExInfoList> list=null;
		try{
			list=m_dao.selectExList();
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return list;
	}//searchEvent
	
}
