package kr.co.sist.domain;

public class QnaSelectList {
	private int qna_num;
	private String id, title, w_date, private_flag;
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPrivate_flag() {
		return private_flag;
	}
	public void setPrivate_flag(String private_flag) {
		this.private_flag = private_flag;
	}
	
	
}
