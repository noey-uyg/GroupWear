import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FileDownloadCommand implements Command{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=req.getSession();


		
		String directory = session.getServletContext().getRealPath("/upload/");
		directory= "C"+directory.substring(1, directory.indexOf(".metadata"))+"JSPProject\\src\\main\\webapp\\fileupload\\";
		
		String file_name = req.getParameter("file_name");
		File file = new File(directory+file_name);
		
		String mimeType = session.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			res.setContentType("application/octet-stream");
		}
		
		String downloadName=null;
		if (req.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(file_name.getBytes("UTF-8"),"8859_1");
		}else {
			downloadName = new String(file_name.getBytes("EUC-kr"),"8859_1");
		}
		
		res.setHeader("Content-Disposition", "attachment;filename=\""
				+ downloadName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = res.getOutputStream();
		
		byte b[] = new byte[1024];
		int data=0;
		
		while((data = (fileInputStream.read(b,0,b.length))) != -1) {
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		
		return null;
	}

}
