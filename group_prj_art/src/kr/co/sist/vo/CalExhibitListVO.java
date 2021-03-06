package kr.co.sist.vo;

public class CalExhibitListVO extends Paging{
	private int rnum, ex_num, p_num;
	private String img, title, place_name, start_day, end_day, selectDate;
	
	public CalExhibitListVO() {
		super();
	}

	public CalExhibitListVO(int rnum, int ex_num, int p_num, String img, String title, String place_name,
			String start_day, String end_day, String selectDate) {
		super();
		this.rnum = rnum;
		this.ex_num = ex_num;
		this.p_num = p_num;
		this.img = img;
		this.title = title;
		this.place_name = place_name;
		this.start_day = start_day;
		this.end_day = end_day;
		this.selectDate = selectDate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getEx_num() {
		return ex_num;
	}

	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
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

	public String getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}

	@Override
	public String toString() {
		return "CalExhibitListVO [rnum=" + rnum + ", ex_num=" + ex_num + ", p_num=" + p_num + ", img=" + img
				+ ", title=" + title + ", place_name=" + place_name + ", start_day=" + start_day + ", end_day="
				+ end_day + ", selectDate=" + selectDate + "]";
	}

	
	
}
