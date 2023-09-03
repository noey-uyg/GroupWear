import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ToAo.FileBoardDAO;

public class FileBoardWriteCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		String nextPage = "GroupMain_DataBoard.jsp?boardpage=DataBoard_fileboard.jsp";
		
		HttpSession session=req.getSession();
		
		String directory = req.getSession().getServletContext().getRealPath("/upload/");
		directory= "C"+directory.substring(1, directory.indexOf(".metadata"))+"JSPProject\\src\\main\\webapp\\fileupload\\";
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(req, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String group_id = (String)session.getAttribute("group_id");
		String user_id = (String)session.getAttribute("userID");
		String user_name = (String)session.getAttribute("userName");
		String project_contents = multipartRequest.getParameter("projectName");
		String fileboard_title = multipartRequest.getParameter("filetitle");
		String fileboard_contents =multipartRequest.getParameter("filecontents");		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		new FileBoardDAO().InsertFileBoard(group_id, user_id, user_name, project_contents, fileboard_title, fileboard_contents, fileName, fileRealName);
		return nextPage;
	}

}
