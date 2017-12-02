package kr.co.sist.dao; 

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.ExhibitComment;
import kr.co.sist.domain.ExhibitInfo;
import kr.co.sist.domain.InsertUserComment;
import kr.co.sist.vo.CalExhibitListVO;
import kr.co.sist.vo.ExhibitListVO;
import kr.co.sist.vo.Paging;

@Component
public class ExhibitDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	/////////////////////// exhibit_list /////////////////////////////
	// 전시 리스트
	public List<ExhibitListVO> selectExhibitList(Paging paging)throws SQLException{
		
		List<ExhibitListVO> list=sst.selectList("selectExhibitList",paging);
		
		return list;
	}//selectExhibitList
	// 리스트 페이징 카운트
	public int getListCnt(Paging paging)throws SQLException{
		
		int cnt=sst.selectOne("selectExhibitListCnt",paging);
		
		return cnt;
	}//getListCnt
	
	///////////////////////// exhibit_info ///////////////////////////
	// 전시 상세정보
	public ExhibitInfo selectExhibit(int ex_num)throws SQLException{
		
		ExhibitInfo exInfo=sst.selectOne("selectOneExhibit",ex_num);
		
		return exInfo;
	}//selectExhibit
	// 전시 코멘트	
	public List<ExhibitComment> selectCmtList(ExhibitComment exhibitCmt)throws SQLException{
		
		List<ExhibitComment> list=sst.selectList("selectExhibitCmt",exhibitCmt);
		
		return list;
	}//selectCmtList
	//전시 코멘트 리스트 카운트	
	public int getCmtListCnt(int ex_num)throws SQLException{
		
		int cnt=sst.selectOne("selectCommentListCnt", ex_num);
		
		return cnt;
	}//getListCnt
	
	//전시 코멘트 등록
	public int insertUserComment(InsertUserComment insertUCmt)throws SQLException{
		
		int cnt=sst.insert("insertUserCmt", insertUCmt);
		
		System.out.println("DAO insertUserComment--------"+cnt);
		
		return cnt;
	}//insertUserComment
	
	//평점 조회
	public List<String> getExhibitScore( int ex_num )throws SQLException{

		List<String> list=sst.selectList("selectExhibitScore", ex_num);
		
		return list;
	}//getExhibitScore
	
	/////////////////////////calendar//////////////////////////
	//선택한 날짜 조건에 맞는 전시 리스트 조회
	public List<CalExhibitListVO> selectCalExhibitList( CalExhibitListVO cel_vo )throws SQLException{
		
		List<CalExhibitListVO> list=sst.selectList("selectCalendarExhibit", cel_vo);
		
		return list;
	}//selectCalExhibitList
	
	// 캘린더 팝업 리스트 페이징 카운트
	public int getCalListCnt( String selectDate )throws SQLException{
		
		int cnt=sst.selectOne("selectCalExhibitListCnt",selectDate);
		
		return cnt;
	}//getCalListCnt
	
}//class
