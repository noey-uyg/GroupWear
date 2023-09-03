<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<GroupDTO> gDTO = (ArrayList<GroupDTO>)session.getAttribute("gDTO");
			
%>
<meta charset="UTF-8">
<title>GroupWear:Find</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%@ include file="MainTop.jsp" %>
	<h3>FindGroup.jsp</h3>
	<div align="center">
		<form action="FindGroup.do" method="post">
			<select class="select_search" name="searchname">
					<option value="관리자">관리자</option>
					<option value="그룹이름">그룹 이름</option>
			</select>
			<input class="form_input_search" type="text" placeholder="검색할 내용" name="search">
			<input class="form_input_button" type="submit" value="검색"><p>
			<%
				if(gDTO == null){
			%>
				<h3>검색결과가 없습니다.</h3>
			<%}else if(gDTO.isEmpty()){%>
				<h3>검색결과가 없습니다.</h3>
			<%}else {%>
				<table class="table_style">
					<tr>
						<th>그룹 이름</th>
						<th>관리자 이름</th>
					</tr>
				<% for(int i=0;i<gDTO.size();i++){ %>
					<tr>
						<td><%=gDTO.get(i).getGroup_name() %></td>
						<td><%=gDTO.get(i).getGroup_membername() %></td>
						<td><button class="form_input_button" type="button" onclick="location.href='Groupjoin.do?joingroup=<%=gDTO.get(i).getGroup_id() %>'" formmethod="post" >가입</button></td>	
					</tr>
				<%} %>
				</table>
			<%} %>
		</form>
	</div>
	
</body>
</html>