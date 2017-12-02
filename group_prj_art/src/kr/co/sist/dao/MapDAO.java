package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.ArtPlaceInfo;
import kr.co.sist.domain.PlaceList;


@Component
public class MapDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<String> listGu()throws SQLException{
		List<String> list=sst.selectList("selectGu");
		return list;
	}//listGu
	public ArtPlaceInfo placeInfo(int num)throws SQLException{
		ArtPlaceInfo api=sst.selectOne("selectPlaceInfo",num);
		return api;
	}
	public List<PlaceList> listPlaceGu(String categ)throws SQLException{
		List<PlaceList> pl=null;
		System.out.println(categ);
		pl=sst.selectList("selectPlaceGu",categ);
		return pl;
	}
	public List<PlaceList> listPlaceName(String categ)throws SQLException{
		List<PlaceList> pl=null;
		pl=sst.selectList("selectPlaceName",categ);
		return pl;
	}
	public List<String> selectRegionGu(String categ)throws SQLException{
		List<String> list=null;
		list=sst.selectList("selectRegionGu",categ);
		return list;
	}
	public List<String> selectRegionName(String categ)throws SQLException{
		List<String> list=null;
		list=sst.selectList("selectRegionName",categ);
		return list;
	}
	
	
	
	
	
}//class
