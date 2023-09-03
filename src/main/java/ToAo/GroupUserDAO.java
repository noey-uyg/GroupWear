package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GroupUserDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public GroupUserDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//유저 가입된 그룹 목록
	public ArrayList<GroupUserDTO> UserGroupList(String userid){
		ArrayList<GroupUserDTO> guDTO = new ArrayList<>();
		
		try {
			String SQL = "select * from groupwear.groupmember where user_id ='"+userid+"' and not group_auth='관리자'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				guDTO.add(new GroupUserDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name"), rs.getString("group_auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return guDTO;
	}
		
	//선택한 그룹
	public ArrayList<GroupUserDTO> SelectGroup(String groupid, String userid){
		ArrayList<GroupUserDTO> guDTO = new ArrayList<>();
		
		try {
			String SQL = "select * from groupwear.groupmember where group_id ='"+groupid+"'and user_id='"+userid+"'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				guDTO.add(new GroupUserDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name"), rs.getString("group_auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return guDTO;
	}
	
	//자신을 제외한 그룹의 모든 유저
	public ArrayList<GroupUserDTO> ExceptMeGroupAllMember(String groupid, String userid){
		ArrayList<GroupUserDTO> guDTO = new ArrayList<>();
		
		try {
			String SQL = "select * from groupwear.groupmember where group_id ='"+groupid+"'and not user_id='"+userid+"'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				guDTO.add(new GroupUserDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name"), rs.getString("group_auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return guDTO;
	}
	//그룹의 모든 유저
	public ArrayList<GroupUserDTO> GroupAllMember(String groupid){
		ArrayList<GroupUserDTO> guDTO = new ArrayList<>();
		
		try {
			String SQL = "select * from groupwear.groupmember where group_id ='"+groupid+"'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				guDTO.add(new GroupUserDTO(rs.getString("group_id"), rs.getString("group_name"), rs.getString("user_id"), rs.getString("user_name"), rs.getString("group_auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return guDTO;
	}
	
	//그룹내 멤버의 수
	public int MemberCount(String groupid){
		int count = 0;
		
		try {
			String SQL = "select count(*) from groupwear.groupmember where group_id ='"+groupid+"'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	//그룹내 멤버 직책 바꾸기
	public ArrayList<GroupUserDTO> UpdateMemberAuth(String group_id, String member_id, String auth) {
		String SQL = "update groupwear.groupmember set group_auth='"+auth+"'where group_id='"+group_id+"'and user_id='"+member_id+"'";
		try {
			st.executeUpdate(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return GroupAllMember(group_id);
	}
	
	//멤버 한명의 정보
	public GroupUserDTO ShowGroupUserOnce(String group_id, String user_id) {
		GroupUserDTO guDTO = new GroupUserDTO();
		
		try {
			String SQL = "select * from groupwear.groupmember where group_id ='"+group_id+"'and user_id='"+user_id+"'";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				guDTO.setGroup_id(rs.getString("group_id"));
				guDTO.setGroup_name(rs.getString("group_name"));
				guDTO.setGroup_memberid(rs.getString("user_id"));
				guDTO.setGroup_membername(rs.getString("user_name"));
				guDTO.setGroup_auth(rs.getString("group_auth"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return guDTO;
	}

}
