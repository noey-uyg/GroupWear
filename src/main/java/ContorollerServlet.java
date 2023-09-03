


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("*.do")
public class ContorollerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CommandHandler cmdHandler = new CommandHandler();
      
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			String requestURI = req.getRequestURI();
			String contextPath = req.getContextPath();
			String cmd = requestURI.substring(contextPath.length() + 1, requestURI.indexOf(".do"));
			System.out.println("cmd: " + cmd);
			String nextPage;
			try {
				nextPage = cmdHandler.getCommand(cmd).execute(req, res);
				if(nextPage!=null) {
					if(nextPage.charAt(0)=='/') {
						req.getServletContext().getRequestDispatcher(nextPage).forward(req, res);
					}
					else {
						res.sendRedirect(nextPage);
					}
				}				
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
