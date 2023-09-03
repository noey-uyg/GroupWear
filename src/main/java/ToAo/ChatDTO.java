package ToAo;

public class ChatDTO {
	int chat_id;
	String group_id;
	String from_id;
	String to_id;
	String chat_contents;
	String chat_time;
	
	public ChatDTO() {
		
	}
	public ChatDTO(int chat_id, String group_id, String from_id, String to_id, String chat_contents, String chat_time) {
		super();
		this.chat_id = chat_id;
		this.group_id = group_id;
		this.from_id = from_id;
		this.to_id = to_id;
		this.chat_contents = chat_contents;
		this.chat_time = chat_time;
	}
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getChat_contents() {
		return chat_contents;
	}
	public void setChat_contents(String chat_contents) {
		this.chat_contents = chat_contents;
	}
	public String getChat_time() {
		return chat_time;
	}
	public void setChat_time(String chat_time) {
		this.chat_time = chat_time;
	}
	
	
}
