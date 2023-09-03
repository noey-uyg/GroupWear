<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<%
	String Page = request.getParameter("managerpage");
	if(Page==null){
		Page="GroupManage_Assignment.jsp";
	}
	String group = (String)session.getAttribute("groupname");
	String auth = (String)session.getAttribute("userGroupAuth");
%>
<meta charset="UTF-8">
<title><%=group %>:그룹관리</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="GroupMain.jsp"></jsp:include>
	<div class="work_div_main">
		<div class="work_div_menu">
			<ul class="work_ul">
				<li><button type="button" class="work_button" onclick="location.href='?managerpage=GroupManage_Assignment.jsp'">프로젝트 부여</button></li>
				<li><button type="button" class="work_button" onclick="location.href='?managerpage=GroupManage_DetailAssignment.jsp'">세부업무 부여</button></li>
				<li><button type="button" class="work_button" onclick="location.href='?managerpage=GroupManage_WorkClear.jsp'">업무처리</button></li>
				<li><%if(auth.equals("관리자")){ %>
						<button type="button" class="work_button" onclick="location.href='?managerpage=GroupManage_MemberManagement.jsp'">멤버관리</button>
						<%}else{ %>
						<button type="button" class="work_button" onclick="alert('관리자가 아닙니다.')">멤버관리</button>
					<%} %>
				</li>
			</ul>
		</div>
		<vr></vr>
		<div class="work_div_contents">
			<jsp:include page='<%=Page%>'></jsp:include>
		</div>
	</div>
</body>
</html>