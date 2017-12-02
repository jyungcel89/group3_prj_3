package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.EventDAO;
import kr.co.sist.domain.EventReadList;
import kr.co.sist.domain.EventSelectList;


@Component
public class EventService {
	@Autowired
	private EventDAO evt_dao;
	
	public List<EventSelectList> searchEventList(EventSelectList esl){
		List<EventSelectList> list = null;
		
		try{
			list =evt_dao.selectEventList(esl);
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return list;
	}//searchEventList
	
	public int countAllList()throws SQLException{
		int cnt=evt_dao.getListCnt();
		return cnt;
	}//countAllCnt

	public EventReadList EventView(int event_num){
		EventReadList erl = null;
		
		try{
			erl =evt_dao.EventView(event_num);
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return erl;
	}//searchQnaList

}//class
