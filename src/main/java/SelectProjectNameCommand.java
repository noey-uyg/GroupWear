import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.WorkDAO;
import ToAo.WorkDTO;

public class SelectProjectNameCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String nextPage=null;
		if(req.getParameter("projectName")!=null) {
			nextPage="/GroupMain_MyProject.jsp";
			
			String projectName = req.getParameter("projectName");
			session.setAttribute("projectname", projectName);
		}else if(req.getParameter("project_Name")!=null) {
			nextPage="/GroupMain_Schedule.jsp";	
			
			String projectName = req.getParameter("project_Name");
			session.setAttribute("project_Name", projectName);
			
			ArrayList<WorkDTO> wDTO = new WorkDAO().SelectShowAllWork((String)session.getAttribute("group_id"),projectName);
			session.setAttribute("allWork", wDTO);
		}
		
		return nextPage;
	}

}
