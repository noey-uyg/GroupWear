
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupDAO;
import ToAo.GroupDTO;
import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;
import ToAo.UserDAO;
import ToAo.UserDTO;
import ToAo.WorkDAO;

public class LoginCommand implements Command{

	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String Loginid = req.getParameter("loginid");
		String Loginpw = req.getParameter("loginpw");
		
		if(req.getParameter("loginid")==null) {
			Loginid=(String)session.getAttribute("userID");
			Loginpw=(String)session.getAttribute("userPW");
		}
		String nextPage = "LoginPage.jsp#signin";

		UserDTO user = new UserDAO().Login(Loginid, Loginpw);
		
		ArrayList<GroupUserDTO> glist = new GroupUserDAO().UserGroupList(Loginid);
		session.setAttribute("groupList", glist);
		
		ArrayList<Integer> gmembercount = new ArrayList<>();
		ArrayList<Integer> gWorkcount = new ArrayList<>();
		ArrayList<Integer> cmembercount = new ArrayList<>();
		ArrayList<Integer> cWorkcount = new ArrayList<>();
		
		if(user!=null) {
			ArrayList<GroupDTO> creategrouplist = new GroupDAO().MyCreateGroup(Loginid);
			session.setAttribute("CreateGroupList", creategrouplist);
			
			if(!glist.isEmpty()) {
				for(int i=0;i<glist.size();i++) {
					gmembercount.add(new GroupUserDAO().MemberCount(glist.get(i).getGroup_id()));
					gWorkcount.add(new WorkDAO().WorkCount(glist.get(i).getGroup_id()));
				}
				if(gmembercount!=null) {
					session.setAttribute("gmembercount", gmembercount);
				}
				if(gWorkcount!=null) {
					session.setAttribute("gworkcount", gWorkcount);
				}
			}
			if(!creategrouplist.isEmpty()) {
				for(int i=0;i<creategrouplist.size();i++) {
					cmembercount.add(new GroupUserDAO().MemberCount(creategrouplist.get(i).getGroup_id()));
					cWorkcount.add(new WorkDAO().WorkCount(creategrouplist.get(i).getGroup_id()));
				}
				if(cmembercount!=null) {
					session.setAttribute("cmembercount", cmembercount);
				}
				if(cWorkcount!=null) {
					session.setAttribute("cworkcount", cWorkcount);
				}
			}
			
			nextPage="/UserPage.jsp";
			
			session.setAttribute("userID", user.getId());
			session.setAttribute("userPW", user.getPw());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userEmail", user.getEmail());
			session.setAttribute("userage", user.getAge());
			session.setAttribute("userProfile", user.getFileimage());
			session.setAttribute("fileName", user.getRealimage());		
		}else {
			session.setAttribute("errMsg","로그인 정보가 올바르지 않습니다.");
		}
		
		
		return nextPage;
	}

}
