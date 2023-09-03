package ToAo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChatDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	
	//DB연결 기본생성자
	public ChatDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/groupwear","root","0000");//jdbc:mysql://다음은 환경에 맞춰서 입력
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//선택한 사람과의 대화내용
	public ArrayList<ChatDTO> SelectUserChatContents(String group_id, String user_id, String select_id) {
		ArrayList<ChatDTO> cDTO = new ArrayList<>();
		try {
			String SQL = "select * from groupwear.chatdata where (group_id ='"+group_id+"' and from_id= '"+user_id+"'and to_id='"+select_id+"')"
					+ "or (group_id ='"+group_id+"' and from_id= '"+select_id+"'and to_id='"+user_id+"')order by chatTime";
			rs = st.executeQuery(SQL);
			while(rs.next()) {
				cDTO.add(new ChatDTO(rs.getInt("chat_id"),rs.getString("group_id"),rs.getString("from_id"),rs.getString("to_id"),rs.getString("chat_contents"),rs.getString("chatTime")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cDTO;
	}
	
	//채팅보내기
	public void InsertChatData(String group_id,String from_id, String to_id, String contents) {
		try {
			String SQL = "INSERT INTO groupwear.chatdata values (null,'"+group_id+"','"+from_id+"','"+to_id+"','"+contents+"',NOW())";
			st.execute(SQL);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
