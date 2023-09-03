import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.WorkDAO;
import ToAo.WorkDTO;
import ToAo.projectDAO;
import ToAo.projectDTO;

public class ClearWorkCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String groupId = (String)session.getAttribute("group_id");
		String workName = req.getParameter("workName");
		String projectName = req.getParameter("projectName");
		String userName = req.getParameter("userName");
		
		new WorkDAO().UpdateUserWorkClear(groupId, workName, projectName, userName);
		
		ArrayList<projectDTO> pDTO = new projectDAO().ShowAllProject(groupId);
		ArrayList<String> project = new projectDAO().GroupAllProject(groupId);
		ArrayList<WorkDTO> wDTO = new WorkDAO().ShowAllWork(groupId);
		session.setAttribute("AllWork", wDTO);
		session.setAttribute("groupProject",project);
		session.setAttribute("GroupAllProject", pDTO);
		
		return "GroupMain_GroupManager.jsp?managerpage=GroupManage_WorkClear.jsp";
	}

}
