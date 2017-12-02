package kr.co.sist.domain;

public class ExhibitInfo {

	private int p_num, ex_num;
	private String  img, title, place_name, start_day, end_day , fee_adult, fee_youth, fee_child;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public String getFee_adult() {
		return fee_adult;
	}
	public void setFee_adult(String fee_adult) {
		this.fee_adult = fee_adult;
	}
	public String getFee_youth() {
		return fee_youth;
	}
	public void setFee_youth(String fee_youth) {
		this.fee_youth = fee_youth;
	}
	public String getFee_child() {
		return fee_child;
	}
	public void setFee_child(String fee_child) {
		this.fee_child = fee_child;
	}
	@Override
	public String toString() {
		return "ExhibitInfo [p_num=" + p_num + ", ex_num=" + ex_num + ", img=" + img + ", title=" + title
				+ ", place_name=" + place_name + ", start_day=" + start_day + ", end_day=" + end_day + ", fee_adult="
				+ fee_adult + ", fee_youth=" + fee_youth + ", fee_child=" + fee_child + "]";
	}
	
	
}
