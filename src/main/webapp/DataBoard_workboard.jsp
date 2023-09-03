<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.WorkContentsDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	ArrayList<WorkContentsDTO> workcontents = (ArrayList<WorkContentsDTO>)session.getAttribute("workcontents");	
	int currentpage = 0;
	int pagesize = 10;
	
	if(request.getParameter("currentpage")!=null){
		currentpage = Integer.parseInt(request.getParameter("currentpage"));
		pagesize = Integer.parseInt(request.getParameter("pagesize"));
	}
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>DataBoard_workboard.jsp</h3>
		<table class="table_style" style="border-collapse:collapse; align:center;">
			<tr>
				<th style="width:200px;">프로젝트</th>
				<th style="width:240px;">보고업무</th>
				<th style="width:240px;">제목</th>
				<th style="width:80px;">업무보고자</th>
				<th style="width:160px;">보고날짜</th>
			</tr>
			<% if(workcontents !=null){for(int i=currentpage; i<pagesize & i<workcontents.size(); i++){ %>
			<tr style="border-bottom:1px solid #f2f2f2; height:28px;">
				<td><%="["+workcontents.get(i).getProject_contents()+"]" %></td>
				<td><%=workcontents.get(i).getWork_detail() %></td>
				<!-- 이때 데이터베이스 바보같이 만들어서 이렇게 됨 근데 수정은 안 함 귀찮아서 -->
				<td><a class="a_board" href="workboard.do?boardpage=Databoard_selectwork.jsp&thisproject=<%=workcontents.get(i).getProject_contents() %>&thiswork=<%=workcontents.get(i).getWork_detail() %>
				&userName=<%=workcontents.get(i).getUser_name() %>&title=<%=workcontents.get(i).getWork_title() %>&date=<%=workcontents.get(i).getWorkdata_date()%>"><%=workcontents.get(i).getWork_title() %></a></td>
				<td><%=workcontents.get(i).getUser_name() %></td>
				<td><%=workcontents.get(i).getWorkdata_date() %></td>
			</tr>
			<%}}else{ %>
			<tr>
				<td>게시글없음</td>
			</tr>
			<%} %>
		</table>
		<div style="text-align:center; width:920px;">
			<%if(currentpage==0){ %>
			<a style="margin-top:10px;" href="?boardpage=DataBoard_workboard.jsp&currentpage=<%=currentpage+10 %>&pagesize=<%=pagesize+10%>">다음</a>
			<%}else{%>
			<a style="margin-right:10px; margin-top:10px;" href="?boardpage=DataBoard_workboard.jsp&currentpage=<%=currentpage-10 %>&pagesize=<%=pagesize-10%>">이전</a>
			<a style="margin-right:10px; margin-top:10px;" href="?boardpage=DataBoard_workboard.jsp&currentpage=<%=currentpage+10 %>&pagesize=<%=pagesize+10%>">다음</a>
			<%} %>
		</div>
</body>
</html>