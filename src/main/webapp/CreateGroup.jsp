<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg == null) errMsg="";
%>

<meta charset="UTF-8">
<link href="css/Main.css" rel="stylesheet" type="text/css">
<title>GroupWear:CreateG</title>
</head>
<body>
	
	<div align="center" style="padding-top: 100px;">
		<form action="CreateGroup.do" method="post">
			<input class="form_input_text" type="text" placeholder="그룹 아이디 입력" name="crgid"><p>
			<input class="form_input_text" type="text" placeholder="그룹 이름 입력" name="crgname"><p>
			<input class="form_input_button" type="submit" value="그룹만들기">
			<div class="errMsg"><%= errMsg %></div>
		</form>
	</div>
	
</body>
</html>