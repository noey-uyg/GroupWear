<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<%@ page import="ToAo.WorkDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<projectDTO> userproject = (ArrayList<projectDTO>)session.getAttribute("Userproject");
	@SuppressWarnings("unchecked")
	ArrayList<WorkDTO> userwork = (ArrayList<WorkDTO>)session.getAttribute("Userwork");
	String projectName = (String)session.getAttribute("projectname");
	if(projectName==null){
		if(userproject==null||userproject.isEmpty()){
			projectName="프로젝트 없음";
		}else{
			projectName=userproject.get(0).getContents();
		}	
	}
%>
<meta charset="UTF-8">
<title>내 할일</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>MyProject_Mywork.jsp</h3>
	<form action="Mywork.do" method="post">
		<ul class="work_ul">
			<%if(userwork!=null|| !userwork.isEmpty()){for(int i=0; i<userwork.size();i++){if(userwork.get(i).getWork_project().equals(projectName)){ %>
				<li>
					<h3><input type="hidden" name="workdetail_<%=i %>" value="<%=userwork.get(i).getWork_detail() %>"><%=userwork.get(i).getWork_detail() %></h3>
					<h3><%=userwork.get(i).getWork_date1()+"~"+userwork.get(i).getWork_date2() %></h3>
					<textarea name="worktitle_<%=i %>" maxlength="45" style="width:530px; height:28px; padding:10px; resize:none;" placeholder="제목을 입력하세요"></textarea><br/>
					<textarea name="workcontents_<%=i %>" maxlength="800" style="width:530px; height:180px; padding:10px; resize:none;"placeholder="내용을 입력하세요"></textarea>
					<br/>
					<button class="form_input_button" type="submit" name="AssignmentButton" value='<%=i %>' >보고</button>
					<hr>
				</li>
			<%}}}%>
		</ul>
	</form>
</body>
</html>
