
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.UserDAO;

public class MyPageCommand implements Command{
	
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String id = (String) session.getAttribute("userID");
		String cgpw = req.getParameter("cgpw");
		String cgcheckpw = req.getParameter("cgcheckpw");
		String cgname = req.getParameter("cgname");
		String cgemail = req.getParameter("cgemail");
		String cgage = req.getParameter("cgyear")+"-"+req.getParameter("cgmonth")+"-"+req.getParameter("cgday");
		String nextPage = "/MyPage.jsp";
		
		if(cgpw.equals(cgcheckpw)) {
			new UserDAO().UpdateUserInfo(id, cgpw, cgname, cgemail, cgage);
			nextPage="/LoginPage.jsp";
			session.setAttribute("errMsg","수정완료! 다시 로그인 해주세요.");
		}else {
			session.setAttribute("errMsgM","비밀번호가 같지 않습니다.");
		}
		
		return nextPage;
	}

}
