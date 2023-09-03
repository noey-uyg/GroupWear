package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class WorkContentsDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public WorkContentsDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//업무 보고
	public void InsertWorkContents(String group_id, String user_id, String user_name, String project_contents, String work_detail, String work_title, String work_contents) {
		try {
			String SQL = "INSERT INTO groupwear.workdata VALUES (null,'"+group_id+"','"+user_id+"','"+user_name+"','"+project_contents+"','"+work_detail+"','"+work_title+"','"+work_contents+"',NOW())";
			st.execute(SQL);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	//모든 업무 데이터
	public ArrayList<WorkContentsDTO> ShowAllWorkContents(String group_id) {
		ArrayList<WorkContentsDTO> wcDTO = new ArrayList<>();
		String SQL = "select * from groupwear.workdata where group_id = '"+group_id+"'order by workdata_date desc";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				wcDTO.add(new WorkContentsDTO(rs.getInt("workdata_id"),rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("work_detail"), rs.getString("work_title"), rs.getString("work_contents"),rs.getString("workdata_date")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return wcDTO;
	}
	
	public WorkContentsDTO WorkContentensShow(String group_id, String userName, String thisProject, String thisWork, String Title, String Date) {
		WorkContentsDTO wcDTO = new WorkContentsDTO();
		String SQL = "select * from groupwear.workdata where group_id = '"+group_id+"'and user_name='"+userName+"'and project_contents='"+thisProject+"'and work_detail='"+thisWork+"'"
				+ "and work_title='"+Title+"'and workdata_date = '"+Date+"'";
		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				wcDTO.setGroup_id(rs.getString("group_id"));
				wcDTO.setUser_id(rs.getString("user_id"));
				wcDTO.setUser_name(rs.getString("user_name"));
				wcDTO.setProject_contents(rs.getString("project_contents"));
				wcDTO.setWork_detail(rs.getString("work_detail"));
				wcDTO.setWork_title(rs.getString("work_title"));
				wcDTO.setWork_contents(rs.getString("work_contents"));
				wcDTO.setWorkdata_date(rs.getString("workdata_date"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return wcDTO;
	}
}
