import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupDAO;
import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;

public class GroupjoinCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String joingid = req.getParameter("joingroup");
		String joinuid = (String) session.getAttribute("userID");
		String joinuname = (String) session.getAttribute("userName");
		String uauth = "일반 회원";
		String nextPage = "LoginPage.do";
		
		new GroupDAO().GroupJoin(joingid, joinuid, joinuname, uauth);
		
		ArrayList<GroupUserDTO> glist = new GroupUserDAO().UserGroupList((String)session.getAttribute("userID"));
		session.setAttribute("groupList", glist);
		return nextPage;
	}

}
