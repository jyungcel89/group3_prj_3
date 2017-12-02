package kr.co.sist.dao;

import java.sql.SQLException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.vo.LoginParamVO;
import kr.co.sist.vo.SearchIdParamVO;
import kr.co.sist.vo.SearchPassParamVO;


@Component
public class loginDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public String loginSuccess(LoginParamVO lpv)throws SQLException{
		
		String inputInfo=sst.selectOne("loginSuccess",lpv);
		return inputInfo;
	}//loginSuccess
	public String searchID(SearchIdParamVO sipv)throws SQLException{
		
		String outputID=sst.selectOne("searchID",sipv);
		return outputID;
	}//searchID
	public String searchPass(SearchPassParamVO sppv)throws SQLException{
		
		String outputPass=null;
		outputPass=sst.selectOne("searchPass",sppv);
		
		return outputPass;
	}//searchPass
	
}//class
