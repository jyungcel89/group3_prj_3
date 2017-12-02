package kr.co.sist.vo;

public class SearchPassParamVO {

	private String id,birth,email;

	public String getId() {
		return id;
	}

	public String getBirth() {
		return birth;
	}

	public String getEmail() {
		return email;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "SearchPassParamVO [id=" + id + ", birth=" + birth + ", email=" + email + "]";
	}
	
	
	
}
