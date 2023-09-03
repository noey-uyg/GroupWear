import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.ChatDAO;

public class ChatSubmitCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String group_id = (String)session.getAttribute("group_id");
		String from_id = (String)session.getAttribute("userID");
		String to_id = (String)session.getAttribute("select_id");
		String chat_contents = req.getParameter("chat_contents");
		
		
		String nextPage="selectchatuser.do?chatuserid="+to_id;
		
		new ChatDAO().InsertChatData(group_id, from_id, to_id, chat_contents);
		return nextPage;
	}

}
