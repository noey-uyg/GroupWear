<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupDTO" %>
<!DOCTYPE html>
<html>
<head>
<% 
	String Page = (String) session.getAttribute("page");
	if(Page==null){
		Page="GroupMain_MyProject.jsp";
	}
	String filename = (String)session.getAttribute("fileName");
	String group = (String)session.getAttribute("groupname");
	String auth = (String)session.getAttribute("userGroupAuth");
%>
<meta charset="UTF-8">
<title><%=group %></title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<nav>
		<button class="group_button" onclick="location.href='MyPage.jsp'">
			<img src="upload/<%=filename %>" width="100px" height="100px">
		</button>
		<div>
			<h4 class="group_text">그룹 이름 : <%=group %></h4>
		</div>
		
		<div>
			<ul class="standard_ul">
				<li>
					<%if(Page.equals("GroupMain_MyProject.jsp")){ %>
						<a class="if_a" href="MyProject.do?page=GroupMain_MyProject.jsp">내업무</a>
					<%}else{ %>
						<a href="MyProject.do?page=GroupMain_MyProject.jsp">내업무</a>
					<%} %>
				</li>
				<li>
					<%if(Page.equals("GroupMain_Schedule.jsp")){ %>
						<a class="if_a" href="schedule.do?page=GroupMain_Schedule.jsp">간트차트</a>
					<%}else{ %>
						<a href="schedule.do?page=GroupMain_Schedule.jsp">간트차트</a>
					<%} %>
				</li>
				<li>
					<%if(Page.equals("GroupMain_GroupChat.jsp")){ %>
						<a class="if_a" href="GroupChat.do?page=GroupMain_GroupChat.jsp">그룹챗</a>
					<%}else{ %>
						<a href="GroupChat.do?page=GroupMain_GroupChat.jsp">그룹챗</a>
					<%} %>
				</li>
				<li>
					<%if(Page.equals("GroupMain_DataBoard.jsp")){ %>
						<a class="if_a" href="DataBoard.do?page=GroupMain_DataBoard.jsp">자료게시판</a>
					<%}else{ %>
						<a href="DataBoard.do?page=GroupMain_DataBoard.jsp">자료게시판</a>
					<%} %>
				</li>
				<li>
					<%if(Page.equals("GroupMain_GroupManager.jsp")){if(auth.equals("관리자")||auth.equals("매니저")){ %>
						<a class="if_a" href="GroupManager.do?page=GroupMain_GroupManager.jsp">그룹관리</a>
						<%}else{ %>
						<a class="if_a">그룹관리</a>
					<%}}else{if(auth.equals("관리자")||auth.equals("매니저")){ %>
						<a href="GroupManager.do?page=GroupMain_GroupManager.jsp">그룹관리</a>
						<%}else{ %>
						<a onclick="alert('관리자가 아닙니다.')">그룹관리</a>
					<%}} %>
				</li>
				<li>
				[GroupMain.jsp]<%=Page %>
				</li>
			</ul>
		</div>
		<hr>
	</nav>
</body>
</html>