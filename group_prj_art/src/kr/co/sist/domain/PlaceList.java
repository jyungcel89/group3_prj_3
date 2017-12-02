package kr.co.sist.domain;

public class PlaceList {
	public String img,placename;

	public String getImg() {
		return img;
	}

	public String getPlacename() {
		return placename;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setPlacename(String placename) {
		this.placename = placename;
	}

	@Override
	public String toString() {
		return "PlaceListVO [img=" + img + ", placename=" + placename + "]";
	}
	
	
}
