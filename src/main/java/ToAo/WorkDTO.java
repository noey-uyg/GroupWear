package ToAo;

public class WorkDTO {
	String work_group_id;
	String work_member_id;
	String work_member_name;
	String work_project;
	String work_detail;
	String work_date1;
	String work_date2;
	Boolean work_clear;
	public WorkDTO() {
		
	}
	public WorkDTO(String work_group_id, String work_member_id, String work_member_name, String work_project,
			String work_detail, String work_date1, String work_date2, Boolean work_clear) {
		super();
		this.work_group_id = work_group_id;
		this.work_member_id = work_member_id;
		this.work_member_name = work_member_name;
		this.work_project = work_project;
		this.work_detail = work_detail;
		this.work_date1 = work_date1;
		this.work_date2 = work_date2;
		this.work_clear = work_clear;
	}
	public Boolean getWork_clear() {
		return work_clear;
	}
	public void setWork_clear(Boolean work_clear) {
		this.work_clear = work_clear;
	}
	public String getWork_group_id() {
		return work_group_id;
	}
	public void setWork_group_id(String work_group_id) {
		this.work_group_id = work_group_id;
	}
	public String getWork_member_id() {
		return work_member_id;
	}
	public void setWork_member_id(String work_member_id) {
		this.work_member_id = work_member_id;
	}
	public String getWork_member_name() {
		return work_member_name;
	}
	public void setWork_member_name(String work_member_name) {
		this.work_member_name = work_member_name;
	}
	public String getWork_project() {
		return work_project;
	}
	public void setWork_project(String work_project) {
		this.work_project = work_project;
	}
	public String getWork_detail() {
		return work_detail;
	}
	public void setWork_detail(String work_detail) {
		this.work_detail = work_detail;
	}
	public String getWork_date1() {
		return work_date1;
	}
	public void setWork_date1(String work_date1) {
		this.work_date1 = work_date1;
	}
	public String getWork_date2() {
		return work_date2;
	}
	public void setWork_date2(String work_date2) {
		this.work_date2 = work_date2;
	}
	
	
}
