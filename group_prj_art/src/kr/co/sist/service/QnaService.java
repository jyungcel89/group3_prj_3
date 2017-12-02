package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.QnaDAO;
import kr.co.sist.domain.QnaReadList;
import kr.co.sist.domain.QnaSelectList;

@Component
public class QnaService {
	@Autowired
	private QnaDAO q_dao;
	
	public List<QnaSelectList> searchQnaList(){
		List<QnaSelectList> list = null;
		
		try{
			list =q_dao.selectQnaList();
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return list;
	}//searchQnaList

	public QnaReadList ReadQnaOne(int qna_num){
		QnaReadList qrl = null;
		
		try{
			qrl =q_dao.selectReadOne(qna_num);
		}catch(SQLException se){
			se.printStackTrace();
		}
		
		return qrl;
	}//searchQnaList
	
	
}//class
