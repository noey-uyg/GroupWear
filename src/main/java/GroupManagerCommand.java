import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;
import ToAo.WorkDAO;
import ToAo.WorkDTO;
import ToAo.projectDAO;
import ToAo.projectDTO;

public class GroupManagerCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		session.setAttribute("page", req.getParameter("page"));
		String nextPage="GroupMain_GroupManager.jsp?managerpage=GroupManage_Assignment.jsp";
		String group_id=(String) session.getAttribute("group_id");
		ArrayList<GroupUserDTO> guDTO = new GroupUserDAO().GroupAllMember(group_id);
		ArrayList<projectDTO> pDTO = new projectDAO().ShowAllProject(group_id);
		ArrayList<String> project = new projectDAO().GroupAllProject(group_id);
		ArrayList<WorkDTO> wDTO = new WorkDAO().ShowAllWork(group_id);
		session.setAttribute("AllWork", wDTO);
		session.setAttribute("groupProject",project);
		session.setAttribute("GroupAllProject", pDTO);
		session.setAttribute("GroupAllUser", guDTO);

		return nextPage;
	}

}
