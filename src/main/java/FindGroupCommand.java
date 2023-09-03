
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.GroupDAO;
import ToAo.GroupDTO;

public class FindGroupCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		String searchname = req.getParameter("searchname");
		String search = req.getParameter("search");

		String nextPage = "/FindGroup.jsp";
		ArrayList<GroupDTO> gDTO = new GroupDAO().FindGroup(searchname, search);
		session.setAttribute("gDTO", gDTO);
		
		return nextPage;
	}

}
