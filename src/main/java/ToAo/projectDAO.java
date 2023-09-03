package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class projectDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public projectDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//내 프로젝트보기
	public ArrayList<projectDTO> ShowProject(String group_id, String member_id) {
		ArrayList<projectDTO> pDTO = new ArrayList<>();
		String SQL = "select * from groupwear.project where group_id='"+group_id+"'and user_id='"+member_id+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				pDTO.add(new projectDTO(rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("project_date1"),rs.getString("project_date2")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return pDTO;
	}
	
	//유저의 모든 프로젝트보기
	public ArrayList<projectDTO> ShowAllProject(String group_id) {
		ArrayList<projectDTO> pDTO = new ArrayList<>();
		String SQL = "select * from groupwear.project where group_id = '"+group_id+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				pDTO.add(new projectDTO(rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("project_date1"),rs.getString("project_date2")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return pDTO;
	}
	
	//멤버에게 프로젝트 부여
	public void InsertProject(String projectGroupID, String projectMemberID, String projectmembername, String projectName, String date1, String date2) {
		try {
			String SQL = "INSERT INTO groupwear.project VALUES ('"+projectGroupID+"','"+projectMemberID+"','"+projectmembername+"','"+projectName+"','"+date1+"','"+date2+"')";
			st.execute(SQL);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	
	//프로젝트 이름만 보기
	public ArrayList<String> GroupAllProject(String group_id) {
		ArrayList<String> project = new ArrayList<>();
		String SQL = "select distinct project_contents from groupwear.project where group_id = '"+group_id+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				project.add(rs.getString("project_contents"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return project;
	}
}
