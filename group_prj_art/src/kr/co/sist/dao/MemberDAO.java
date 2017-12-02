package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.ArtPlaceInfo;
import kr.co.sist.domain.PlaceList;
import kr.co.sist.vo.MemberVO;


@Component
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public int addMember(MemberVO mv)throws SQLException{
		
		int flag=sst.insert("memberJoin",mv);
		
		return flag;
	}//listGu
	
}//class
