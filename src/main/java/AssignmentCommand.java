import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDTO;
import ToAo.projectDAO;

public class AssignmentCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<GroupUserDTO> groupuser = (ArrayList<GroupUserDTO>)session.getAttribute("GroupAllUser");	
		
		String nextPage = "GroupMain_GroupManager.jsp?managerpage=GroupManage_Assignment.jsp";
		
		String i = req.getParameter("AssignmentButton");
		String projectGroupID = (String) session.getAttribute("group_id");
		String projectName = req.getParameter("projectName_"+i);
		String date1 = req.getParameter("date1year_"+i)+"-"+req.getParameter("date1month_"+i)+"-"+req.getParameter("date1day_"+i);
		String date2 = req.getParameter("date2year_"+i)+"-"+req.getParameter("date2month_"+i)+"-"+req.getParameter("date2day_"+i);
		String projectMemberID = groupuser.get(Integer.parseInt(i)).getGroup_memberid();
		String projectMembername = groupuser.get(Integer.parseInt(i)).getGroup_membername();
		new projectDAO().InsertProject(projectGroupID, projectMemberID, projectMembername, projectName, date1, date2);
		
		return nextPage;
	}

}
