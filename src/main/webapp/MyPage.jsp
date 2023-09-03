<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<% 	
	String errMsg = (String)session.getAttribute("errMsgM");
	if(errMsg == null) errMsg="";
	
	String filename = (String)session.getAttribute("fileName");
	String userpw = (String)session.getAttribute("userPW");
	String username = (String)session.getAttribute("userName");
	String useremail = (String)session.getAttribute("userEmail");
	String userage = (String)session.getAttribute("userage");
%>
<meta charset="UTF-8">
<title>GroupWear:My</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>

	
	<%@ include file="MainTop.jsp" %>
	<h3>MyPage.jsp</h3>
	<div align="center">
		<img src="upload/<%=filename %>" width="100px" height="100px"><p>
		<form action="MyPagefile.do" method="post" enctype="multipart/form-data">
			<input class="form_input_file" type="file" name="file"><p>
			<input class="form_input_button" type="submit" value="사진 수정"><p>	
			<div class="errMsg"><%=errMsg %></div>
		</form>
		<form action="MyPage.do" method="post">	
			<input class="form_input_text" type="password" value="<%=userpw %>" name="cgpw"><p>
			<input class="form_input_text" type="password" value="<%=userpw %>" placeholder="비밀번호 재입력" name="cgcheckpw"><p>
			<input class="form_input_text" type="text" value="<%=username %>" placeholder="<%=username %>" name="cgname"><p>
			<input class="form_input_text" type="text" value="<%=useremail %>" placeholder="<%=useremail %>" name="cgemail"><p>
			<select name="cgyear">
				<%
				for(int i=1990; i<=2022; i++){
					if(i==Integer.parseInt(userage.split("-")[0])){%>
				<option value="<%=i %>" selected><%=i %></option>
				<%}else{ %>
				<option value="<%=i %>"><%=i %></option>
				<%}}%>
			</select>년
			<select name="cgmonth">
				<%
				for(int i=1; i<=12; i++){
					if(i==Integer.parseInt(userage.split("-")[1])){%>
				<option value="<%=i %>" selected><%=i %></option>
				<%}else{ %>
				<option value="<%=i %>"><%=i %></option>
				<%}}%>
			</select>월
			<select name="cgday">
				<%
				for(int i=1; i<=31; i++){
					if(i==Integer.parseInt(userage.split("-")[2])){%>
				<option value="<%=i %>" selected><%=i %></option>
				<%}else{ %>
				<option value="<%=i %>"><%=i %></option>
				<%}}%>
			</select>일<p>
			<button class="form_input_button" type="button" onclick="location.href='UserPage.jsp'">뒤로가기</button>&emsp;
			<input class="form_input_button" type="submit" value="수정하기"><p>	
		</form>
	</div>
</body>
</html>