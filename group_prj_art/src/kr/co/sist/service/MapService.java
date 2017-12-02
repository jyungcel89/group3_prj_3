package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.MapDAO;
import kr.co.sist.domain.ArtPlaceInfo;
import kr.co.sist.domain.PlaceList;

@Component
public class MapService {
	@Autowired
	private MapDAO m_dao;
	
	public List<String> searchGu(){
		List<String> list=null;
		try{
			list=m_dao.listGu();
		}catch(SQLException e){
			e.printStackTrace();
		}//end catch
		return list;
	}//searchGu
	
	public ArtPlaceInfo showPlaceInfo(int num){
		ArtPlaceInfo api=null;
		try {
			api=m_dao.placeInfo(num);
			System.out.println("================================"+num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return api;
	}//showPlaceInfo
	public List<PlaceList> showPlaceGu(String categ){
		List<PlaceList> pl=null;
		try {
			pl=m_dao.listPlaceGu(categ);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pl;
	}//showPlaceGu
	public List<PlaceList> showPlaceName(String categ){
		List<PlaceList> pl=null;
		try {
			pl=m_dao.listPlaceName(categ);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pl;
	}//showPlaceName
	public List<String> selectedRegion(String categ){
		List<String> list=null;
		try {
			list=m_dao.selectRegionGu(categ);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//showPlaceName
	public List<String> selectedRegionName(String categ){
		List<String> list=null;
		try {
			list=m_dao.selectRegionName(categ);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//showPlaceName
	
}
