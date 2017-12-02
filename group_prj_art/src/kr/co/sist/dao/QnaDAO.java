package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.QnaReadList;
import kr.co.sist.domain.QnaSelectList;

@Component
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<QnaSelectList> selectQnaList()throws SQLException{
		List<QnaSelectList> list = sst.selectList("qnaSelect");
		
		return list;
	}//selectQnaList

	public QnaReadList selectReadOne(int qna_num)throws SQLException{
		QnaReadList qrl= sst.selectOne("qnaRead",qna_num);
		
		return qrl;
	}//selectReadOne
	
	
}
