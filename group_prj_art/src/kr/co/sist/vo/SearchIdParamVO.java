package kr.co.sist.vo;

public class SearchIdParamVO {
	private String name,phone,birth;

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setName(String name) {
		this.name =name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "SearchIdParamVO [name=" + name + ", phone=" + phone + ", birth=" + birth + "]";
	}
	
	
	
}
