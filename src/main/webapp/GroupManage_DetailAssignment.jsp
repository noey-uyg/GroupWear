<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<%@ page import="ToAo.GroupUserDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<projectDTO> AllProject = (ArrayList<projectDTO>)session.getAttribute("GroupAllProject");
	@SuppressWarnings("unchecked")
	ArrayList<GroupUserDTO> groupuser = (ArrayList<GroupUserDTO>)session.getAttribute("GroupAllUser");	
%>
<meta charset="UTF-8">
<title>내업무</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>GroupManage_DetailAssignment.jsp</h3>
	<form action="detailAssignment.do" method="post">
		<ul class="work_ul">
			<%for(int i=0;i<groupuser.size();i++){ %>
				<li>
					<%=groupuser.get(i).getGroup_membername() %><p/>
					<select name="projectname_<%=i %>">
						<option value="none">프로젝트</option>
						<%for(int j=0; j<AllProject.size(); j++){if(groupuser.get(i).getGroup_membername().equals(AllProject.get(j).getMember_name())){ %>
							<option value="<%=AllProject.get(j).getContents() %>"><%=AllProject.get(j).getContents() %></option>
						<%}} %>
					</select>
					<input class="form_input_search" type="text" placeholder="부여할 세부업무" maxlength="45" name="detailproject_<%=i %>"><p/>
					
					<select name="projectdate1year_<%=i %>">
						<option value="none">년</option>
						<%for(int j=2000; j<=2030; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="projectdate1month_<%=i %>">
						<option value="none">월</option>
						<%for(int j=1; j<=12; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="projectdate1day_<%=i %>">
						<option value="none">일</option>
						<%
						for(int j=1; j<=31; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					
					<%="~" %>
					
					<select name="projectdate2year_<%=i %>">
						<option value="none">년</option>
						<%for(int j=2000; j<=2030; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="projectdate2month_<%=i %>">
						<option value="none">월</option>
						<%for(int j=1; j<=12; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select>
					<select name="projectdate2day_<%=i %>">
						<option value="none">일</option>
						<%
						for(int j=1; j<=31; j++){ %>
							<option value="<%=j %>"><%=j %></option>
						<%} %>
					</select><p/>
					
					<button class="form_input_button" type="submit" name="detailButton" value='<%=i %>' >부여</button>
					<hr>
				</li>
			<%} %>
		</ul>
	</form>
</body>
</html>