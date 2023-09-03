package ToAo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UserDTO implements Serializable{
	private String id;
	private String pw;
	private String name;
	private String email;
	private String age;
	private String fileimage;
	private String realimage;
	
	public UserDTO() {
		
	}
	public UserDTO(String id, String pw, String name, String email, String age, String fileimage, String realimage) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.age = age;
		this.fileimage = fileimage;
		this.realimage = realimage;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFileimage() {
		return fileimage;
	}
	public void setFileimage(String fileimage) {
		this.fileimage = fileimage;
	}
	public String getRealimage() {
		return realimage;
	}
	public void setRealimage(String realimage) {
		this.realimage = realimage;
	}
	
	
}
