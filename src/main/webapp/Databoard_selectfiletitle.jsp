<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ToAo.FileBoardDTO" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.UserDTO" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	FileBoardDTO fbDTO = (FileBoardDTO)session.getAttribute("selectFileContents");
	GroupUserDTO guDTO = (GroupUserDTO)session.getAttribute("groupuserinfo");
	UserDTO uDTO = (UserDTO)session.getAttribute("userinfo");

%>
<title>Insert title here</title>
</head>
<body>
<h3>Dateboard_selectfiletitle.jsp</h3><br><br>

<h3><%="["+fbDTO.getProject_contents()+"]" %></h3><!-- 프로젝트 이름 -->
<h3><%=fbDTO.getFileboard_title() %></h3><!-- 게시글 제목 -->
<img style="position:relative; float:left; margin-right:10px; width:36px; height:36px;"src="upload/<%=uDTO.getFileimage() %>"><!-- 작성자 프로필 사진 -->
<h3><%=fbDTO.getUser_name() %></h3><!-- 작성자 -->
<em style="display:inline-block; float:left; vertical-align:top; font-size:12px; font-style:normal; color:#626262;"><!-- 직책 -->
	<%=guDTO.getGroup_auth() %>
</em>
<h3><%=fbDTO.getFileboard_date() %></h3><!-- 작성일-->
<div style="display:block;"><!-- 콘텐츠 컨테이너 -->
	<div style="line-height:1; display:block; position:relative; max-width:860px; vertical-align:baseline;">
		<hr>
		<%if(!fbDTO.getFilename().equals("null")){ %><!-- 첨부파일-->
		첨부파일 : <a href="filedownload.do?file_name=<%=fbDTO.getFilename() %>"><%=fbDTO.getFilename() %></a>
		<%} %><br><hr>
		<%=fbDTO.getFileboard_contents() %><!-- 게시글 내용 -->
	</div>
</div>
</body>
</html>