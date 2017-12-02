package kr.co.sist.domain;

public class ArtPlaceInfo {
	private int num;
	private double latitude,longitude;
	private String place_name,addr,hollyday,site,img,gu,week_time,weekend_time;

	public int getNum() {
		return num;
	}
	public String getPlace_name() {
		return place_name;
	}

	public String getAddr() {
		return addr;
	}

	public String getHollyday() {
		return hollyday;
	}


	public double getLatitude() {
		return latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getSite() {
		return site;
	}

	public String getImg() {
		return img;
	}

	public String getGu() {
		return gu;
	}

	public String getWeek_time() {
		return week_time;
	}

	public String getWeekend_time() {
		return weekend_time;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setHollyday(String hollyday) {
		this.hollyday = hollyday;
	}


	public void setSite(String site) {
		this.site = site;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public void setWeek_time(String week_time) {
		this.week_time = week_time;
	}

	public void setWeekend_time(String weekend_time) {
		this.weekend_time = weekend_time;
	}

	
}