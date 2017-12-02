package kr.co.sist.vo;

public class LoginParamVO {
	private String id,pass;

	public String getId() {
		return id;
	}

	public String getPass() {
		return pass;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "LoginParamVO [id=" + id + ", pass=" + pass + "]";
	}
	
	
}
