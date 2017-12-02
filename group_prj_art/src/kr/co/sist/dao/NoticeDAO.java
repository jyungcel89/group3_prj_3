package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.NoticeReadList;
import kr.co.sist.domain.NoticeSelectList;
import kr.co.sist.vo.Paging;

@Component
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sst;
	// �������� ����Ʈ
	public List<NoticeSelectList> selectNoticeList(NoticeSelectList nsl)throws SQLException{
		List<NoticeSelectList> list = sst.selectList("noticeSelect", nsl);
		
		return list;
	}//selectNoticeList
	// ����Ʈ ī��Ʈ
	public int getListCnt()throws SQLException{
		int cnt=sst.selectOne("selectNoticeCnt");
		return cnt;
	}//getListCnt
	// �������� �ڼ���
	public NoticeReadList NoticeView(int noticeNum)throws SQLException{
		NoticeReadList nrl = sst.selectOne("noticeRead",noticeNum);
		
		return nrl;
	}//selectNoticeList

	
	
}
