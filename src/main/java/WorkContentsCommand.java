import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.WorkContentsDAO;



public class WorkContentsCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		String nextPage = "/GroupMain_MyProject.jsp";
		
		String i = req.getParameter("AssignmentButton");
		String projectGroupID = (String) session.getAttribute("group_id");
		String user_id = (String) session.getAttribute("userID");
		String user_name = (String) session.getAttribute("userName");
		String projectName = (String) session.getAttribute("projectname");
		String work_detail = req.getParameter("workdetail_"+i);
		String work_title = req.getParameter("worktitle_"+i);
		String work_contents = req.getParameter("workcontents_"+i);
		
		new WorkContentsDAO().InsertWorkContents(projectGroupID, user_id, user_name, projectName, work_detail,work_title, work_contents);
		
		return nextPage;
	}

}
