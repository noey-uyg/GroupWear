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

public class UserPageCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		
		String groupid = req.getParameter("group");
		if(groupid==null) {
			groupid=(String) session.getAttribute("group_id");
		}else {
			session.setAttribute("group_id", groupid);
		}
		
		String nextPage="/GroupMain.jsp";
		
		ArrayList<GroupUserDTO> guDTO = new GroupUserDAO().SelectGroup(groupid, (String)session.getAttribute("userID"));
		
		session.setAttribute("groupname", guDTO.get(0).getGroup_name());
		session.setAttribute("userGroupAuth", guDTO.get(0).getGroup_auth());
		
		//유저 업무 초기화
		String group_id=groupid;
		String member_id=(String) session.getAttribute("userID");

		ArrayList<projectDTO> userproject = new projectDAO().ShowProject(group_id, member_id);
		session.setAttribute("Userproject", userproject);
		ArrayList<WorkDTO> userwork = new WorkDAO().ShowWork(group_id, member_id);
		session.setAttribute("Userwork", userwork);
		
		String ProjectName=req.getParameter("MyProjectButton");
		session.setAttribute("projectname", ProjectName);
		session.removeAttribute("page");
		return nextPage;
	}

}
