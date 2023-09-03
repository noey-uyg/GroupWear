<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<%
	String Page = request.getParameter("boardpage");
	if(Page==null){
		Page="DataBoard_workboard.jsp";
	}
	String group = (String)session.getAttribute("groupname");
%>
<meta charset="UTF-8">
<title><%=group %>:자료게시판</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<jsp:include page="GroupMain.jsp"></jsp:include>
	<div class="work_div_main">
		<div class="work_div_menu">
			<ul class="work_ul">
				<li><button type="button" class="work_button" onclick="location.href='DataBoard.do?boardpage=DataBoard_workboard.jsp'">업무 보고 게시판</button></li>
				<li><button type="button" class="work_button" onclick="location.href='DataBoard.do?boardpage=DataBoard_fileboard.jsp'">자료 파일 게시판</button></li>
			</ul>
		</div>
		<vr></vr>
		<div class="work_div_contents">
			<jsp:include page='<%=Page%>'></jsp:include>
		</div>
	</div>
</body>
</html>