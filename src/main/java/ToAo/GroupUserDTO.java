package ToAo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class GroupUserDTO implements Serializable{
	private String group_id;
	private String group_name;
	private String group_memberid;
	private String group_membername;
	private String group_auth;
	
	public GroupUserDTO() {
		
	}
	
	public GroupUserDTO(String group_id, String group_name, String group_memberid, String group_membername, String group_auth) {
		super();
		this.group_id = group_id;
		this.group_name = group_name;
		this.group_memberid = group_memberid;
		this.group_membername = group_membername;
		this.group_auth = group_auth;
	}
	
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getGroup_memberid() {
		return group_memberid;
	}
	public void setGroup_memberid(String group_memberid) {
		this.group_memberid = group_memberid;
	}
	public String getGroup_membername() {
		return group_membername;
	}
	public void setGroup_membername(String group_membername) {
		this.group_membername = group_membername;
	}
	public String getGroup_auth() {
		return group_auth;
	}
	public void setGroup_auth(String group_auth) {
		this.group_auth = group_auth;
	}
	
	
}
