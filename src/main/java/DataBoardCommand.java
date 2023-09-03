import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.FileBoardDAO;
import ToAo.FileBoardDTO;
import ToAo.WorkContentsDAO;
import ToAo.WorkContentsDTO;
import ToAo.projectDAO;
import ToAo.projectDTO;

public class DataBoardCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();
		
		session.setAttribute("page", req.getParameter("page"));
		String nextPage="GroupMain_DataBoard.jsp";
		String group_id=(String) session.getAttribute("group_id");
		
		ArrayList<String> project = new projectDAO().GroupAllProject(group_id);
		session.setAttribute("groupProject",project);
		ArrayList<WorkContentsDTO> wcDTO = new WorkContentsDAO().ShowAllWorkContents(group_id);
		session.setAttribute("workcontents", wcDTO);
		ArrayList<projectDTO> userproject = new projectDAO().ShowProject(group_id, (String)session.getAttribute(("userID")));
		session.setAttribute("Userproject", userproject);
		
		if(req.getParameter("boardpage")!=null) {
			session.setAttribute("page", nextPage);
			String boardPage = req.getParameter("boardpage");
			if(boardPage.equals("DataBoard_workboard.jsp")) {	
				nextPage+="?boardpage=DataBoard_workboard.jsp";
			}else if(boardPage.equals("DataBoard_fileboard.jsp")) {
				ArrayList<FileBoardDTO> fbDTO = new FileBoardDAO().ShowAllFileBoard(group_id);
				session.setAttribute("fileboard", fbDTO);
				nextPage+="?boardpage=DataBoard_fileboard.jsp";
			}
		}
		
		return nextPage;
	}

}
