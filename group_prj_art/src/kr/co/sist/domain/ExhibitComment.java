package kr.co.sist.domain;

import kr.co.sist.vo.Paging;

public class ExhibitComment extends Paging{
	private int ex_num;
	private String id, score, comment_detail, w_date;
	
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getComment_detail() {
		return comment_detail;
	}
	public void setComment_detail(String comment_detail) {
		this.comment_detail = comment_detail;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	
}
