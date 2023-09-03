import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ToAo.FileBoardDAO;
import ToAo.FileBoardDTO;
import ToAo.GroupUserDAO;
import ToAo.GroupUserDTO;
import ToAo.UserDAO;
import ToAo.UserDTO;

public class FileBoardCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session=req.getSession();

		int file_id = Integer.parseInt(req.getParameter("file_id"));
		String nextPage="GroupMain_DataBoard.jsp?boardpage=Databoard_selectfiletitle.jsp?file_id="+file_id;
		
		session.setAttribute("fileID",file_id);
		FileBoardDTO fbDTO = new FileBoardDAO().ShowFileContents(file_id);
		GroupUserDTO guDTO = new GroupUserDAO().ShowGroupUserOnce(fbDTO.getGroup_id(), fbDTO.getUser_id());
		UserDTO uDTO = new UserDAO().UserInfoOnce(fbDTO.getUser_id());
		session.setAttribute("selectFileContents", fbDTO);
		session.setAttribute("userinfo", uDTO);
		session.setAttribute("groupuserinfo", guDTO);
		return nextPage;
	}

}
