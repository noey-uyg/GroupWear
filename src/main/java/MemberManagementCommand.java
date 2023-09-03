import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;

public class MemberManagementCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<GroupUserDTO> groupuser = (ArrayList<GroupUserDTO>)session.getAttribute("GroupAllUser");	
		String nextPage = "GroupMain_GroupManager.jsp?managerpage=GroupManage_MemberManagement.jsp";
		
		String i = req.getParameter("ManagementButton");
		String group_id = (String) session.getAttribute("group_id");
		String member_id = groupuser.get(Integer.parseInt(i)).getGroup_memberid();
		String member_auth = req.getParameter("memberauth_"+i);
		
		ArrayList<GroupUserDTO> updategroupuser =new GroupUserDAO().UpdateMemberAuth(group_id, member_id, member_auth);
		session.removeAttribute("GroupAllUser");
		session.setAttribute("GroupAllUser", updategroupuser);
		return nextPage;
	}

}
