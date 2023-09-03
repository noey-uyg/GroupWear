package ToAo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class projectDTO implements Serializable{
	String group_id;
	String member_id;
	String member_name;
	String contents;
	String date1;
	String date2;
	
	public projectDTO() {
		
	}
	public projectDTO(String group_id, String member_id, String member_name, String contents, String date1, String date2) {
		super();
		this.group_id = group_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.contents = contents;
		this.date1 = date1;
		this.date2 = date2;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	
	
	
}
