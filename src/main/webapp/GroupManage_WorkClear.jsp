<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.WorkDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
	@SuppressWarnings("unchecked")
	ArrayList<String> allProject = (ArrayList<String>)session.getAttribute("groupProject");
	@SuppressWarnings("unchecked")
	ArrayList<projectDTO> AllProject = (ArrayList<projectDTO>)session.getAttribute("GroupAllProject");
	@SuppressWarnings("unchecked")
	ArrayList<WorkDTO> AllWork = (ArrayList<WorkDTO>)session.getAttribute("AllWork");
%>
<title>Insert title here</title>
</head>
<body>
<h1>GroupManage_WorkClear.jsp</h1>
	<ul class="work_ul">
		<%for(int i = 0; i < allProject.size(); i++){ %>
		<li>
			<h3>프로젝트 이름 : <%=allProject.get(i) %></h3>
			<%for(int j=0; j<AllProject.size(); j++){if(allProject.get(i).equals(AllProject.get(j).getContents())){ %>
				<h4>담당자 이름 : <%=AllProject.get(j).getMember_name() %></h4>
				<%for(int k=0; k<AllWork.size(); k++){if(AllProject.get(j).getMember_name().equals(AllWork.get(k).getWork_member_name())
						&&AllProject.get(j).getContents().equals(AllWork.get(k).getWork_project())){ %>
				<h5><%=AllWork.get(k).getWork_detail()+"("+AllWork.get(k).getWork_date1()+"~"+AllWork.get(k).getWork_date2()+")" %></h5>
					<%if(!AllWork.get(k).getWork_clear()){ %>
						<button type="submit" onclick="location.href='clearwork.do?workName=<%=AllWork.get(k).getWork_detail() %>&projectName=<%=allProject.get(i) %>&userName=<%=AllProject.get(j).getMember_name() %>'" >완료처리</button>
			<%}}}}}%>
			<hr>
			<%}%>
		</li>
	</ul>	
</body>
</html>