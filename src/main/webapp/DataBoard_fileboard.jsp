<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.FileBoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	@SuppressWarnings("unchecked")
	ArrayList<FileBoardDTO> fileboard = (ArrayList<FileBoardDTO>)session.getAttribute("fileboard");	
	int currentpage = 0;
	int pagesize = 10;
	
	if(request.getParameter("currentpage")!=null){
		currentpage = Integer.parseInt(request.getParameter("currentpage"));
		pagesize = Integer.parseInt(request.getParameter("pagesize"));
	}
%>
<title>Insert title here</title>
</head>
<body>
	<h3>DataBoard_fileboard.jsp</h3>
	<table class="table_style" style="border-collapse:collapse; align:center;">
		<tr>
			<th style="width:200px;">프로젝트</th>
			<th style="width:240px;">제목</th>
			<th style="width:80px;">작성자</th>
			<th style="width:160px;">보고날짜</th>
			<th style="float:right;"><button class="form_input_button" type="button" onclick="location.href='?boardpage=Databoard_filewrite.jsp'">글쓰기</button></th>
		</tr>
		<% if(fileboard !=null){for(int i=currentpage; i<pagesize & i<fileboard.size(); i++){ %>
		<tr style="border-bottom:1px solid #f2f2f2; height:28px;">
			<td><%="["+fileboard.get(i).getProject_contents()+"]" %></td>
			<td><a class="a_board" href="fileboard.do?file_id=<%=fileboard.get(i).getFile_id() %>"><%=fileboard.get(i).getFileboard_title() %></a></td>
			<td><%=fileboard.get(i).getUser_name() %></td>
			<td><%=fileboard.get(i).getFileboard_date() %></td>
		</tr>
		<%}}else{ %>
		<tr>
			<td>게시글없음</td>
		</tr>
		<%} %>
	</table>
	<div style="text-align:center; width:920px;">
		<%if(currentpage==0){ %>
		<a style="margin-top:10px;" href="?boardpage=DataBoard_fileboard.jsp&currentpage=<%=currentpage+10 %>&pagesize=<%=pagesize+10%>">다음</a>
		<%}else{%>
		<a style="margin-right:10px; margin-top:10px;" href="?boardpage=DataBoard_fileboard.jsp&currentpage=<%=currentpage-10 %>&pagesize=<%=pagesize-10%>">이전</a>
		<a style="margin-right:10px; margin-top:10px;" href="?boardpage=DataBoard_fileboard.jsp&currentpage=<%=currentpage+10 %>&pagesize=<%=pagesize+10%>">다음</a>
		<%} %>
	</div>
</body>
</html>