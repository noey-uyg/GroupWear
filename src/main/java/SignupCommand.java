
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.UserDAO;

public class SignupCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		String signid = req.getParameter("signid");
		String signpw = req.getParameter("signpw");
		String signchpw = req.getParameter("signcheckpw");
		String signname = req.getParameter("signname");
		String signemail = req.getParameter("signemail");
		String agedate = req.getParameter("signdate");
		String signimage = "kakao_1.jpg";
		String nextPage = "/SignupPage.jsp";
		
		HttpSession session=req.getSession();
		UserDAO userDao = new UserDAO();
			
		if(signpw.equals(signchpw)) {
			if(userDao.SignUP(signid, signchpw, signname, signemail, agedate, signimage, signimage)) {
				nextPage = "LoginPage.jsp#signin";
			}else {
				session.setAttribute("errMsg","이미 있는 아이디입니다.");
			}
		}else{
			session.setAttribute("errMsg","비밀번호가 같지 않습니다.");
		}
			
		
		return nextPage;
	}
	
	
}
