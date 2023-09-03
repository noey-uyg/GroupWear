import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDTO;
import ToAo.WorkDAO;

public class DetailAssignmentCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		
		String nextPage = "GroupMain_GroupManager.jsp?managerpage=GroupManage_DetailAssignment.jsp";
		
		@SuppressWarnings("unchecked")
		ArrayList<GroupUserDTO> groupuser = (ArrayList<GroupUserDTO>)session.getAttribute("GroupAllUser");	
		
		String i = req.getParameter("detailButton");
		String work_group_id = (String) session.getAttribute("group_id");
		String work_member_id = groupuser.get(Integer.parseInt(i)).getGroup_memberid();
		String work_member_name = groupuser.get(Integer.parseInt(i)).getGroup_membername();
		String work_project = req.getParameter("projectname_"+i);
		String work_detail = req.getParameter("detailproject_"+i);
		String work_date1 = req.getParameter("projectdate1year_"+i)+"-"+req.getParameter("projectdate1month_"+i)+"-"+req.getParameter("projectdate1day_"+i);
		String work_date2 = req.getParameter("projectdate2year_"+i)+"-"+req.getParameter("projectdate2month_"+i)+"-"+req.getParameter("projectdate2day_"+i);
		
		new WorkDAO().InsertDetailWork(work_group_id, work_member_id, work_member_name, work_project, work_detail, work_date1, work_date2);
		return nextPage;
	}
}