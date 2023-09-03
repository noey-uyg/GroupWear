package ToAo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public UserDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//회원가입
	public boolean SignUP(String id, String pw, String name, String email, String age, String filename, String realifilename) {
		try {
			String SQL = "INSERT INTO user VALUES ('"+id+"','"+pw+"','"+name+"','"+email+"','"+age+"','"+filename+"','"+realifilename+"')";
			st.execute(SQL);
			
		} catch (SQLException e) {
			return false;
		}
		return true;
	}
	
	//로그인
	public UserDTO Login(String id, String pw) {
		String SQL = "select * from user where user_id = ?";
		UserDTO userDTO = new UserDTO();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbPw=rs.getString("user_password");
				if(dbPw.equals(pw)) {
					userDTO.setId(rs.getString("user_id"));
					userDTO.setPw(rs.getString("user_password"));
					userDTO.setName(rs.getString("user_name"));
					userDTO.setEmail(rs.getString("user_email"));
					userDTO.setAge(rs.getString("user_age"));
					userDTO.setFileimage(rs.getString("profile_image"));
					userDTO.setRealimage(rs.getString("profile_realimage"));
					
					return userDTO;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;	
	}
	
	//유저 프로필 사진 수정
	public void UpdateUserProfileImage(String id, String filename, String filerealname) {
		String SQL = "update user set profile_image='"+filename+"',profile_realimage='"+filerealname+"'where user_id='"+id+"'";

		try {
			st.executeUpdate(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//유저 프로필 정보 수정
	public void UpdateUserInfo(String id, String pw, String name, String email, String age) {
		String SQL = "update user set user_password='"+pw+"',user_name='"+name+"',user_email='"+email+"',user_age='"+age+"'where user_id='"+id+"'";
		
		try {
			st.executeUpdate(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//한 유저의 정보
	public UserDTO UserInfoOnce(String userid) {
		UserDTO uDTO = new UserDTO();
		String SQL = "select * from user where user_id = ?";
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					uDTO.setId(rs.getString("user_id"));
					uDTO.setPw(rs.getString("user_password"));
					uDTO.setName(rs.getString("user_name"));
					uDTO.setEmail(rs.getString("user_email"));
					uDTO.setAge(rs.getString("user_age"));
					uDTO.setFileimage(rs.getString("profile_image"));
					uDTO.setRealimage(rs.getString("profile_realimage"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uDTO;
	}
	
}
