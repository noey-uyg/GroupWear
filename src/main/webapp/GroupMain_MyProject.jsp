<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<projectDTO> userproject = (ArrayList<projectDTO>)session.getAttribute("Userproject");
	String group = (String)session.getAttribute("groupname");
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
<title><%=group %>:내업무</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="GroupMain.jsp"></jsp:include>
	
	<div class="work_div_main">
		<div class="work_div_menu">
			<ul class="work_ul">
				<li class="li_top"><%=projectName %> </li>
				<% if(userproject!=null || !userproject.isEmpty()){ for(int i=0; i<userproject.size(); i++){ %>
				<li><button type="button" class="work_button" onclick="location.href='selectprojectname.do?projectName=<%=userproject.get(i).getContents() %>'"><%=userproject.get(i).getContents() %>
				<br><%="("+userproject.get(i).getDate1()+"~"+userproject.get(i).getDate2()+")" %></button>
				</li>
				<%}}else{ %>
				<li class="li_top">프로젝트 없음</li>
				<%} %>
			</ul>
		</div>
		<vr></vr>
		<%if(userproject!=null || !userproject.isEmpty()){ %>
			<div class="work_div_contents">
				<jsp:include page='MyProject_Mywork.jsp'></jsp:include>
			</div>
		<%} %>
		
	</div>

</body>
</html>