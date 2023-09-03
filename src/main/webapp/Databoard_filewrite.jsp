<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<!DOCTYPE html>
<html>
<head>
<% 
	@SuppressWarnings("unchecked")
	ArrayList<String> allProject = (ArrayList<String>)session.getAttribute("groupProject");
	@SuppressWarnings("unchecked")	
	ArrayList<projectDTO> userproject = (ArrayList<projectDTO>)session.getAttribute("Userproject");
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Databoard_filewrite.jsp</h3>
	<form action="fileboardwrite.do" method="post" enctype="multipart/form-data">
		<select name="projectName">
			<option value="공유자료">프로젝트</option>
			<%for(int i=0;i<allProject.size();i++){for(int j=0; j<userproject.size(); j++){if(allProject.get(i).equals(userproject.get(j).getContents())){ %>
			<option value="<%=allProject.get(i) %>"><%=allProject.get(i) %></option>
			<%}}} %>
		</select>
		<input type="text" style="width:400px; height:30px;" placeholder="제목" name="filetitle"><br>
		<input class="form_input_file" type="file" name="file"><br>
		<textarea maxlength="800" style="width:530px; height:180px; padding:10px; resize:none;"placeholder="내용을 입력하세요" name="filecontents"></textarea><br>
		<input class="form_input_button" type="submit" value="글쓰기">
	</form>
</body>
</html>