<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.ChatDTO" %>
<%@ page import="ToAo.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<ChatDTO> selectChatUser = (ArrayList<ChatDTO>) session.getAttribute("selectChatUser");
	UserDTO selectuserinfo = (UserDTO)session.getAttribute("selectUserInfo");
	String userid = (String)session.getAttribute("userID");
%>
<meta charset="UTF-8">
<title></title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>GroupChat_Chat.jsp</h3>
	<div style="overflow:auto; position:relative; display:block; width:400px; height:350px; border:1px solid #333; padding:10px; margin-top:10px; "><!-- 채팅내역 -->
		<%if(selectChatUser==null||selectChatUser.isEmpty()){ %>
		<h3>채팅내역이 없습니다.</h3>
		<%}else{%>
			<div style="align:center;">
			<h3><%=selectuserinfo.getName() %></h3>
			<hr>
			</div>	
		<%for(int i=0; i<selectChatUser.size();i++){if(selectChatUser.get(i).getFrom_id().equals(userid)){ %>
			<div class="chat_div_right">
				<h3 style="padding:2px; float:right; max-width:180px; font-size:13px; height:auto; white-space:pre-line; "><%=selectChatUser.get(i).getChat_contents()%></h3>
			</div>
			<br style="clear:both;">
		<%}else{%>
			<img style="margin-top:9px; float:left; margin-right:3px; width:36px; height:36px;"src="upload/<%=selectuserinfo.getFileimage()%>">
			<div class="chat_div_left">
				<h3 style="padding:2px; float:left; max-width:180px; font-size:13px; height:auto; white-space:pre-line;"><%=selectChatUser.get(i).getChat_contents() %></h3>
			</div>
			<br style="clear:both;">
		<%}}} %>
	</div>
	<div >
		<form action="chatsubmit.do" method="post" style="width:400px; height:100px; border:1px solid #333; padding:10px;">
			<textarea name="chat_contents" style="padding:2px; float:left; width:294px; height:94px; resize:none;"maxlength="100" placeholder="메시지를 입력해주세요."></textarea>
			<input style="float:right; width:100px;height:100px;" type="submit" value="전송">
		</form>
	</div>
</body>
</html>