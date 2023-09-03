package ToAo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GroupDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public GroupDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//그룹 생성
	public boolean GroupCreate(String gid, String gname, String gmemberid, String gmembername, String auth) {
		try {
			String SQL = "INSERT INTO groupwear.group VALUES ('"+gid+"','"+gname+"','"+gmemberid+"','"+gmembername+"')";
			st.execute(SQL);
			SQL = "INSERT INTO groupwear.groupmember VALUES ('"+gid+"','"+gname+"','"+gmemberid+"','"+gmembername+"','"+auth+"')";
			st.execute(SQL);
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	//그룹 가입
	public void GroupJoin(String group_id, String group_memberid, String group_membername, String group_auth) {
		String SQL = "select * from groupwear.group where group_id =?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, group_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String group_name = rs.getString("group_name");
				String SQL2 = "INSERT INTO groupwear.groupmember VALUES ('"+group_id+"','"+group_name+"','"+group_memberid+"','"+group_membername+"','"+group_auth+"')";
				st.execute(SQL2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	}
	
	//내가 생성한 그룹
	public ArrayList<GroupDTO> MyCreateGroup(String user_id) {
		String SQL = "select * from groupwear.group where user_id =?";
		ArrayList<GroupDTO> MyCreateGroup = new ArrayList<>(); 
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MyCreateGroup.add(new GroupDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return MyCreateGroup;
	}
	//그룹 찾기
	public ArrayList<GroupDTO> FindGroup(String searchname, String search) {
		String SQL = "";
		ArrayList<GroupDTO> gDTO = new ArrayList<>();
		
		if(searchname.equals("관리자")) {
			SQL = "select * from groupwear.group where user_name ='"+search+"'";
			try {
				rs = st.executeQuery(SQL);
				while(rs.next()) {
					gDTO.add(new GroupDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			SQL = "select * from groupwear.group where group_name ='"+search+"'";
			try {
				rs = st.executeQuery(SQL);
				while(rs.next()) {
					gDTO.add(new GroupDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return gDTO;
	}
	
	
		
	
}
