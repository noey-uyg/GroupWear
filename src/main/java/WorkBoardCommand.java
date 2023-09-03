import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;
import ToAo.UserDAO;
import ToAo.UserDTO;
import ToAo.WorkContentsDAO;
import ToAo.WorkContentsDTO;

public class WorkBoardCommand implements Command {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String nextPage="GroupMain_DataBoard.jsp?boardpage=Databoard_selectwork.jsp";
		
		String thisProject = req.getParameter("thisproject");
		String thisWork = req.getParameter("thiswork");
		String Title = req.getParameter("title");
		String Date = req.getParameter("date");
		String group_id = (String) session.getAttribute("group_id");
		String userName = req.getParameter("userName");
		WorkContentsDTO wcDTO = new WorkContentsDAO().WorkContentensShow(group_id,userName,thisProject,thisWork,Title,Date);
		GroupUserDTO guDTO = new GroupUserDAO().ShowGroupUserOnce(group_id, wcDTO.getUser_id());
		UserDTO uDTO = new UserDAO().UserInfoOnce(wcDTO.getUser_id());
		session.setAttribute("userinfo", uDTO);
		session.setAttribute("groupuserinfo", guDTO);
		session.setAttribute("showboard", wcDTO);
		return nextPage;
	}

}
