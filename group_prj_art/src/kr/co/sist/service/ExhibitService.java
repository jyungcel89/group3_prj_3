package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.ExhibitDAO;
import kr.co.sist.domain.ExhibitComment;
import kr.co.sist.domain.ExhibitInfo;
import kr.co.sist.domain.InsertUserComment;
import kr.co.sist.vo.CalExhibitListVO;
import kr.co.sist.vo.ExhibitListVO;
import kr.co.sist.vo.Paging;

@Component
public class ExhibitService {
	@Autowired
	private ExhibitDAO e_dao;
	/////////////////////// exhibit_list /////////////////////////////
	public List<ExhibitListVO> searchExhibit( Paging paging ){
		List<ExhibitListVO> list=null;
		try{
			list=e_dao.selectExhibitList(paging);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return list;
	}//searchExhibit
	
	public int countAllList(Paging paging){
		int cnt=0;
		try{
			cnt=e_dao.getListCnt(paging);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return cnt;
	}
	///////////////////////// exhibit_info ///////////////////////////
	// 전시 상세정보
	public ExhibitInfo searchOneExhibit(int ex_num){
		ExhibitInfo exInfo=null;
		try{
			exInfo=e_dao.selectExhibit(ex_num);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return exInfo;
	}//searchExhibit
	// 전시 코멘트	
	public List<ExhibitComment> searchExhibitCmt(ExhibitComment exhibitCmt){
		List<ExhibitComment> list=null;
		try {
			list=e_dao.selectCmtList(exhibitCmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//searchExhibitCmt
	//전시 코멘트 리스트 카운트	
	public int countAllCmtList(int ex_num){
		int cnt=0;
		try{
			cnt=e_dao.getCmtListCnt(ex_num);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return cnt;
	}//countAllCmtList
	// 전시 댓글 등록
	public boolean insertCmt(InsertUserComment insertUCmt)throws SQLException{
		boolean flag=false;
		int cnt=0;
		
		cnt=e_dao.insertUserComment(insertUCmt);
		
		if( cnt == 1 ){
			flag=true;
		}//end if
		
		return flag;
	}//insertCmt
	
	////////////////////////////////////////////////////////////
	// 평점 계산
	public int calculateScore(int ex_num)throws SQLException{
		List<String> list=e_dao.getExhibitScore(ex_num);
		String[] scoreArr=list.toArray(new String[list.size()]);
		int scoreAvg=0;
		for( int i=0; i<list.size(); i++ ){
			scoreAvg+=Integer.parseInt(scoreArr[i]);
		}//end for
		if( scoreArr.length != 0 ){
			scoreAvg=scoreAvg/scoreArr.length;
		}else{
			scoreAvg=0;
		}//end if
		return scoreAvg;
	}//calculateScore
	
	/////////////////////////calendar////////////////////////
	//선택한 날짜 조건에 맞는 전시 리스트 조회
	public List<CalExhibitListVO> searchCalExhibitList( CalExhibitListVO cel_vo )throws SQLException{
		
		List<CalExhibitListVO> list=e_dao.selectCalExhibitList( cel_vo );
		
		return list;
	}//searchCalExhibitList
	
	public int countAllCalList( String selectDate ){
		int cnt=0;
		try{
			cnt=e_dao.getCalListCnt( selectDate );
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return cnt;
	}//countAllCalList
}
