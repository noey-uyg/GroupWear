import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;
import ToAo.WorkContentsDAO;
import ToAo.WorkContentsDTO;

public class GroupChatCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		session.setAttribute("page", req.getParameter("page"));
		String nextPage="GroupMain_GroupChat.jsp";
		String group_id=(String) session.getAttribute("group_id");
		String user_id=(String) session.getAttribute("userID");
		ArrayList<WorkContentsDTO> wcDTO = new WorkContentsDAO().ShowAllWorkContents(group_id);
		session.setAttribute("workcontents", wcDTO);
		ArrayList<GroupUserDTO> guDTO = new GroupUserDAO().ExceptMeGroupAllMember(group_id, user_id);
		session.setAttribute("exceptMeAndUser", guDTO);
		return nextPage;
	}

}
