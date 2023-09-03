package ToAo;

public class WorkContentsDTO {
	int workdata_id;
	String group_id;
	String user_id;
	String user_name;
	String project_contents;
	String work_detail;
	String work_title;
	String work_contents;
	String workdata_date;
	
	public WorkContentsDTO() {};
	
	public WorkContentsDTO(int workdata_id, String group_id, String user_id, String user_name, String project_contents,
			String work_detail, String work_title, String work_contents,  String workdata_date) {
		super();
		this.workdata_id = workdata_id;
		this.group_id = group_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.project_contents = project_contents;
		this.work_detail = work_detail;
		this.work_contents = work_contents;
		this.work_title = work_title;
		this.workdata_date = workdata_date;
	}
	
	public int getWorkdata_id() {
		return workdata_id;
	}
	public void setWorkdata_id(int workdata_id) {
		this.workdata_id = workdata_id;
	}
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getProject_contents() {
		return project_contents;
	}
	public void setProject_contents(String project_contents) {
		this.project_contents = project_contents;
	}
	public String getWork_detail() {
		return work_detail;
	}
	public void setWork_detail(String work_detail) {
		this.work_detail = work_detail;
	}
	public String getWork_contents() {
		return work_contents;
	}
	public void setWork_contents(String work_contents) {
		this.work_contents = work_contents;
	}
	public String getWorkdata_date() {
		return workdata_date;
	}
	public void setWorkdata_date(String workdata_date) {
		this.workdata_date = workdata_date;
	}
	
	
}
