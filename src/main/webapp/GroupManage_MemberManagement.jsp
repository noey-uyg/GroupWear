<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupUserDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<GroupUserDTO> groupuser = (ArrayList<GroupUserDTO>)session.getAttribute("GroupAllUser");	
%>
<meta charset="UTF-8">
<title>내업무</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>GroupManage_MemberManagement.jsp</h3>
	<form action="membermanagement.do" method="post">
		<ul class="work_ul">
			<%for(int i=0;i<groupuser.size();i++){ %>
				<li>
					<%=groupuser.get(i).getGroup_membername() %>
					<%="("+groupuser.get(i).getGroup_auth()+")" %><p/>
					<select name="memberauth_<%=i %>">
						<option value="일반 회원">일반 회원</option>
						<option value="우수 회원">우수 회원</option>
						<option value="매니저">매니저</option>
					</select>
					<button class="form_input_button" type="submit" name="ManagementButton" value='<%=i %>' >부여</button>
					<hr>
				</li>
			<%} %>
		</ul>
	</form>
</body>
</html>