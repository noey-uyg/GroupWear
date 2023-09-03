import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.WorkDAO;
import ToAo.WorkDTO;
import ToAo.projectDAO;
import ToAo.projectDTO;

public class MyProjectCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String group_id=(String) session.getAttribute("group_id");
		String member_id=(String) session.getAttribute("userID");
		String nextPage="GroupMain_MyProject.jsp";
		
		session.setAttribute("page", req.getParameter("page"));
		ArrayList<projectDTO> userproject = new projectDAO().ShowProject(group_id, member_id);
		session.setAttribute("Userproject", userproject);
		ArrayList<WorkDTO> userwork = new WorkDAO().ShowWork(group_id, member_id);
		session.setAttribute("Userwork", userwork);
		return nextPage;
	}

}
