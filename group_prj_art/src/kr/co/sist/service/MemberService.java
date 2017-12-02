package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.MapDAO;
import kr.co.sist.dao.MemberDAO;
import kr.co.sist.domain.ArtPlaceInfo;
import kr.co.sist.domain.PlaceList;
import kr.co.sist.vo.MemberVO;

@Component
public class MemberService {
	@Autowired
	private MemberDAO m_dao;
	public int insertMember(MemberVO mv){
		int cnt=0;
		try{
			cnt=m_dao.addMember(mv);
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return cnt;
	}//searchGu
}
