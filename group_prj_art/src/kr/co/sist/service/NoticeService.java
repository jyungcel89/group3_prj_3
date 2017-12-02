package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.NoticeDAO;
import kr.co.sist.domain.NoticeReadList;
import kr.co.sist.domain.NoticeSelectList;
import kr.co.sist.vo.Paging;

@Component
public class NoticeService {
	@Autowired
	private NoticeDAO n_dao;
	
	public List<NoticeSelectList> searchNoticeList(NoticeSelectList nsl){
		List<NoticeSelectList> list = null;
		
		try{
			list =n_dao.selectNoticeList(nsl);
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return list;
	}//searchQnaList
	
	public int countAllList()throws SQLException{
		int cnt=n_dao.getListCnt();
		return cnt;
	}//countAllCnt

	public NoticeReadList NoticeView(int noticeNum){
		NoticeReadList nrl = null;
		
		try{
			nrl =n_dao.NoticeView(noticeNum);
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return nrl;
	}//searchQnaList

}//class
