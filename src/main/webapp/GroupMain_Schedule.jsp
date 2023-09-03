<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
	@SuppressWarnings("unchecked")
	ArrayList<String> allProject = (ArrayList<String>)session.getAttribute("groupProject");
	
	String group = (String)session.getAttribute("groupname");
	String project_Name = (String)session.getAttribute("project_Name");
	if(project_Name==null){
		if(allProject==null||allProject.isEmpty()){
			project_Name="프로젝트 없음";
		}else{
			project_Name=allProject.get(0);
		}	
	}
%>
<title><%=group %>:내업무</title>
</head>
<body>
	<jsp:include page="GroupMain.jsp"></jsp:include>
		
	<div class="work_div_main">
		<div class="work_div_menu">
			<ul class="work_ul">
				<li class="li_top"><%=project_Name %></li>
				
				<% if(allProject!=null || !allProject.isEmpty()){ for(int i=0; i<allProject.size(); i++){ %>
				<li>
					<button type="button" class="work_button" onclick="location.href='selectprojectname.do?project_Name=<%=allProject.get(i) %>'"><%=allProject.get(i)%></button>
				</li>
				<%}}else{ %>
				<li class="li_top">프로젝트 없음</li>
				<%} %>
			</ul>
		</div>
		<vr></vr>
		<%if(allProject!=null || !allProject.isEmpty()){ %>
			<div class="work_div_contents">
				<jsp:include page='Schedule_Ganttchart.jsp'></jsp:include>
			</div>
		<%} %>
		
	</div>
</body>
</html>