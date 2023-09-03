package ToAo;

public class FileBoardDTO {
	int file_id;
	String group_id;
	String user_id;
	String user_name;
	String project_contents;
	String fileboard_title;
	String fileboard_contents;
	String filename;
	String realfilename;
	String fileboard_date;
	
	public FileBoardDTO() {
		
	}
	public FileBoardDTO(int file_id, String group_id, String user_id, String user_name, String project_contents,
			String fileboard_title, String fileboard_contents, String filename, String realfilename,
			String fileboard_date) {
		super();
		this.file_id = file_id;
		this.group_id = group_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.project_contents = project_contents;
		this.fileboard_title = fileboard_title;
		this.fileboard_contents = fileboard_contents;
		this.filename = filename;
		this.realfilename = realfilename;
		this.fileboard_date = fileboard_date;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
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
	public String getFileboard_title() {
		return fileboard_title;
	}
	public void setFileboard_title(String fileboard_title) {
		this.fileboard_title = fileboard_title;
	}
	public String getFileboard_contents() {
		return fileboard_contents;
	}
	public void setFileboard_contents(String fileboard_contents) {
		this.fileboard_contents = fileboard_contents;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	public String getFileboard_date() {
		return fileboard_date;
	}
	public void setFileboard_date(String fileboard_date) {
		this.fileboard_date = fileboard_date;
	}
	
	
}
