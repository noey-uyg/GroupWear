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
	<h3>GroupManage_Assignment.jsp</h3>
	<form action="Assignment.do" method="post">
		<ul class="work_ul">
			<%for(int i=0;i<groupuser.size();i++){ %>
				<li>
					<%=groupuser.get(i).getGroup_membername() %><p/>
					<input class="form_input_search" type="text" placeholder="부여할 프로젝트 이름" maxlength="45" name="projectName_<%=i %>"><p/>
					<select name="date1year_<%=i %>">
						<option value="none">년</option>
						<%for(int j=2000; j<=2030; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="date1month_<%=i %>">
						<option value="none">월</option>
						<%for(int j=1; j<=12; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="date1day_<%=i %>">
						<option value="none">일</option>
						<%
						for(int j=1; j<=31; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					
					<%="~" %>
					
					<select name="date2year_<%=i %>">
						<option value="none">년</option>
						<%for(int j=2000; j<=2030; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="date2month_<%=i %>">
						<option value="none">월</option>
						<%for(int j=1; j<=12; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="date2day_<%=i %>">
						<option value="none">일</option>
						<%
						for(int j=1; j<=31; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>					
					<p/>
					<button class="form_input_button" type="submit" name="AssignmentButton" value='<%=i %>' >부여</button>
					<hr>
				</li>
			<%} %>
		</ul>
	</form>
	
</body>
</html>