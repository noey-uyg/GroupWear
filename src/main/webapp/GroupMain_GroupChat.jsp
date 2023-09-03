<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupUserDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	String group = (String)session.getAttribute("groupname");
	@SuppressWarnings("unchecked")
	ArrayList<GroupUserDTO> groupchatuser = (ArrayList<GroupUserDTO>)session.getAttribute("exceptMeAndUser");
%>
<meta charset="UTF-8">
<title><%=group %>:그룹챗</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="GroupMain.jsp"></jsp:include>
	<div class="work_div_main">
		<div class="work_div_menu">
			<ul class="work_ul">
				<%if(groupchatuser!=null||!groupchatuser.isEmpty()){for(int i=0; i<groupchatuser.size(); i++){%>
					<li><button type="button" class="work_button" onclick="location.href='selectchatuser.do?chatuserid=<%= groupchatuser.get(i).getGroup_memberid()%>'">
					<%= groupchatuser.get(i).getGroup_membername()%></button></li>
				<%}}else{ %>
					<li class="li_top">그룹원 없음</li>
				<%} %>
			</ul>
		</div>
		<vr></vr>
		<div class="work_div_contents">
			<jsp:include page='GroupChat_Chat.jsp'></jsp:include>
		</div>
	</div>
</body>
</html>