
import java.util.HashMap;

public class CommandHandler {
	HashMap<String, String> command = new HashMap<>();
	
	public CommandHandler() {
		command.put("SignupPage", "SignupCommand");
		command.put("LoginPage", "LoginCommand");
		command.put("MyPage", "MyPageCommand");
		command.put("MyPagefile", "MyPageImageCommand");
		command.put("CreateGroup","CreateGroupCommand");
		command.put("FindGroup", "FindGroupCommand");
		command.put("UserPage", "UserPageCommand");
		command.put("Groupjoin", "GroupjoinCommand");
		command.put("MyProject","MyProjectCommand");
		command.put("GroupManager", "GroupManagerCommand");
		command.put("Assignment", "AssignmentCommand");
		command.put("detailAssignment", "DetailAssignmentCommand");
		command.put("membermanagement", "MemberManagementCommand");
		command.put("selectprojectname", "SelectProjectNameCommand");
		command.put("Mywork", "WorkContentsCommand");
		command.put("DataBoard", "DataBoardCommand");
		command.put("workboard", "WorkBoardCommand");
		command.put("GroupChat", "GroupChatCommand");
		command.put("selectchatuser", "SelectChatUserCommand");
		command.put("chatsubmit", "ChatSubmitCommand");
		command.put("fileboardwrite","FileBoardWriteCommand");
		command.put("fileboard", "FileBoardCommand");
		command.put("filedownload", "FileDownloadCommand");
		command.put("clearwork", "ClearWorkCommand");
		command.put("schedule","ScheduleCommand");
		}
	
	Command getCommand(String cmd) {
		String strClass = command.get(cmd);
		Command cmdClass = null;
	
		try {
			cmdClass = (Command) Class.forName(strClass).getDeclaredConstructor().newInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cmdClass;
	}
}
