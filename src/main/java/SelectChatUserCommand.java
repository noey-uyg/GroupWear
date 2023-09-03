import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.ChatDAO;
import ToAo.ChatDTO;
import ToAo.UserDAO;
import ToAo.UserDTO;

public class SelectChatUserCommand implements Command {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String nextPage="/GroupMain_GroupChat.jsp";
		
		String group_id = (String)session.getAttribute("group_id");
		String user_id = (String)session.getAttribute("userID");
		String select_id = req.getParameter("chatuserid");
		ArrayList<ChatDTO> cDTO = new ChatDAO().SelectUserChatContents(group_id, user_id, select_id);
		UserDTO uDTO = new UserDAO().UserInfoOnce(select_id);
		session.setAttribute("select_id", select_id);
		session.setAttribute("selectUserInfo", uDTO);
		session.setAttribute("selectChatUser", cDTO);
		return nextPage;
	}

}
