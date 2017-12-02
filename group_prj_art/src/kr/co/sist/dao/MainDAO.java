package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.MainEventList;
import kr.co.sist.domain.MainExInfoList;
import kr.co.sist.domain.MainNoticeList;


@Component
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MainNoticeList> selectNoticeList()throws SQLException{
		List<MainNoticeList> list=sst.selectList("mainSelectNotice");
		
		return list;
	}//selectAllExhibit
	
	public List<MainEventList> selectEventList()throws SQLException{
		List<MainEventList> list=sst.selectList("mainSelectEvent");
		
		return list;
	}//selectEventList

	public List<MainExInfoList> selectExList()throws SQLException{
		List<MainExInfoList> list=sst.selectList("mainSelectExInfo");
		
		return list;
	}//selectEventList
	
}//class
