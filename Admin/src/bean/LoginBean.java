package bean;

public class LoginBean {
	private String password;
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		System.out.println("id : "+id);
		this.id = id;
	}
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		System.out.println("password : "+password);
		this.password = password;
	}

}