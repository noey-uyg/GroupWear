package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FileBoardDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public FileBoardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//파일첨부 게시글 작성
	public void InsertFileBoard(String group_id,String user_id,String user_name,String project_contents,String fileboard_title,String fileboard_contents,String fileName,String fileRealName) {
		try {
			String SQL = "INSERT INTO groupwear.fileboard VALUES (null,'"+group_id+"','"+user_id+"','"+user_name+"','"+project_contents+"','"
		+fileboard_title+"','"+fileboard_contents+"','"+fileName+"','"+fileRealName+"',NOW())";
			st.execute(SQL);
			
		} catch (SQLException e) {
		}
	}
	
	//모든 파일 게시판 게시글
	public ArrayList<FileBoardDTO> ShowAllFileBoard(String group_id) {
		ArrayList<FileBoardDTO> fbDTO = new ArrayList<>();
		String SQL = "select * from groupwear.fileboard where group_id = '"+group_id+"'order by fileboard_date desc";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				fbDTO.add(new FileBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return fbDTO;
	}
	
	//게시글 내용 가져오기
	public FileBoardDTO ShowFileContents(int file_id) {
		FileBoardDTO fbDTO = new FileBoardDTO();
		String SQL = "select * from groupwear.fileboard where file_id = '"+file_id+"'";
		
		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				fbDTO = new FileBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return fbDTO;
	}
}
