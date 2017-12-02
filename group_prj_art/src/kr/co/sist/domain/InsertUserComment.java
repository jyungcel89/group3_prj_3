package kr.co.sist.domain;

public class InsertUserComment {
	private String  comment_detail, score, id;
	private int p_num, ex_num;
	
	public String getComment_detail() {
		return comment_detail;
	}
	public void setComment_detail(String comment_detail) {
		this.comment_detail = comment_detail;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getId() {
		return id.trim();
	}
	public void setId(String id) {
		this.id = id.trim();
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	@Override
	public String toString() {
		return "InsertUserComment [comment_detail=" + comment_detail + ", score=" + score + ", id=" + id + ", p_num="
				+ p_num + ", ex_num=" + ex_num + "]";
	}
	
}
