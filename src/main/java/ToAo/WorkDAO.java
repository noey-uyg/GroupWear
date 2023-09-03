package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class WorkDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public WorkDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//내 프로젝트 업무보기
	public ArrayList<WorkDTO> ShowWork(String group_id, String member_id) {
		ArrayList<WorkDTO> wDTO = new ArrayList<>();
		String SQL = "select * from groupwear.work where group_id='"+group_id+"'and user_id='"+member_id+"' and work_clear=False";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				wDTO.add(new WorkDTO(rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("work_detail"),rs.getString("work_date1"),rs.getString("work_date2"),rs.getBoolean("work_clear")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return wDTO;
	}
	
	//그룹의 모든 세부 업무 보기
	public ArrayList<WorkDTO> ShowAllWork(String group_id) {
		ArrayList<WorkDTO> wDTO = new ArrayList<>();
		String SQL = "select * from groupwear.work where group_id='"+group_id+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				wDTO.add(new WorkDTO(rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("work_detail"),rs.getString("work_date1"),rs.getString("work_date2"), rs.getBoolean("work_clear")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return wDTO;
	}
	
	//선택된 프로젝트의 모든 세부 업무 보기
	public ArrayList<WorkDTO> SelectShowAllWork(String group_id, String project_name) {
		ArrayList<WorkDTO> wDTO = new ArrayList<>();
		String SQL = "select * from groupwear.work where group_id='"+group_id+"' and project_contents = '"+project_name+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				wDTO.add(new WorkDTO(rs.getString("group_id"),rs.getString("user_id"), rs.getString("user_name"), rs.getString("project_contents"),
						rs.getString("work_detail"),rs.getString("work_date1"),rs.getString("work_date2"), rs.getBoolean("work_clear")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return wDTO;
	}
	
	//프로젝트 세부 업무 부여
	public void InsertDetailWork(String work_group_id, String work_member_id, String work_member_name, String work_project, String work_detail, String work_date1, String work_date2) {
		try {
			String SQL = "INSERT INTO groupwear.work VALUES ('"+work_group_id+"','"+work_member_id+"','"+work_member_name+"','"+work_project+"','"+work_detail+"','"+work_date1+"','"+work_date2+"',False)";
			st.execute(SQL);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	//세부업무 완료
	public void UpdateUserWorkClear(String groupid,String workname,String projectname,String username) {
		String SQL = "update groupwear.work set work_clear=True where group_id='"+groupid+"'and work_detail='"+workname+"'and project_contents='"+projectname+"'and user_name='"+username+"'";
		try {
			st.executeUpdate(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//그룹의 세부업무 개수
	public int WorkCount(String group_id) {
		int count = 0;
		
		String SQL = "select count(*) from groupwear.work where group_id='"+group_id+"'";

		try {
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return count;
	}
}
