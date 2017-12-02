package kr.co.sist.domain;

import kr.co.sist.vo.Paging;

public class NoticeSelectList extends Paging{
	private int notice_num;
	private String title, w_date;
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	
	
	
}
