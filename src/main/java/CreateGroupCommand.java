
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupDAO;
import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;

public class CreateGroupCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=req.getSession();
		
		
		String gid = req.getParameter("crgid");
		String gname = req.getParameter("crgname");
		String gmemberid = (String) session.getAttribute("userID");
		String gmembername = (String) session.getAttribute("userName");
		String auth = "관리자";
		String nextPage = "/CreateGroup.jsp";
		GroupDAO gDAO = new GroupDAO();
		
		if(gDAO.GroupCreate(gid, gname, gmemberid, gmembername, auth)) {
			nextPage = "LoginPage.do";
			ArrayList<GroupUserDTO> glist = new GroupUserDAO().UserGroupList((String)session.getAttribute("userID"));
			session.setAttribute("groupList", glist);
			session.setAttribute("gbox", "close");
		} else {
			session.setAttribute("errMsg","이미 있는 아이디입니다.");
		}
			
		
		return nextPage;
	}

}
