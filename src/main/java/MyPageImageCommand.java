
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ToAo.UserDAO;

public class MyPageImageCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		String nextPage = "/MyPage.jsp";
		
		HttpSession session=req.getSession();
		
		String directory = req.getSession().getServletContext().getRealPath("/upload/");
		directory= "C"+directory.substring(1, directory.indexOf(".metadata"))+"JSPProject\\src\\main\\webapp\\upload\\";
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(req, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		String id = (String) session.getAttribute("userID");
		if(fileName == null || fileRealName == null) {
			session.setAttribute("errMsgM","이미지를 선택 해주세요.");
		}else {
			new UserDAO().UpdateUserProfileImage(id, fileName, fileRealName);
			nextPage="/LoginPage.jsp";
			session.setAttribute("errMsg","수정완료! 다시 로그인 해주세요.");
		}
		
		return nextPage;
	}

}
