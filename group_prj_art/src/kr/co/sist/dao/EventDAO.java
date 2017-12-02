package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.EventReadList;
import kr.co.sist.domain.EventSelectList;

@Component
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sst;
	// 이벤트 리스트
	public List<EventSelectList> selectEventList(EventSelectList esl)throws SQLException{
		List<EventSelectList> list = sst.selectList("evnetSelect",esl);
		
		return list;
	}//selectEventList
	// 리스트 카운트
	public int getListCnt()throws SQLException{
		int cnt=sst.selectOne("selectEventCnt");
		return cnt;
	}//getListCnt
	public EventReadList EventView(int event_num)throws SQLException{
		EventReadList erl = sst.selectOne("eventRead",event_num);
		
		return erl;
	}//selectNoticeList

	
	
}
