<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg == null) errMsg="";
	
	session.invalidate();
%>
<meta charset="UTF-8">
<title>GroupWear:Login</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<%@ include file="MainTop.jsp" %>
	<h3>LoginPage.jsp</h3>
	<div align="center">
		<form action="LoginPage.do" method="post">
		<div class="form">
			<div class="form_inner">
				<input class="form_input_text" type="text" placeholder="아이디 입력" name="loginid"><p>
				<input class="form_input_text" type="password" placeholder="비밀번호 입력" name="loginpw"><p>
				<input class="form_input_button" type="submit" value="로그인"><p>	
				<div class="errMsg"><%=errMsg %></div>
			</div>
		</div>
		</form>
		<ul class="standard_ul">
			<li><a href=#>비밀번호 찾기</a></li>
			<li><a href=#>아이디 찾기</a></li>
			<li><a href="SignupPage.jsp">회원가입</a></li>
		</ul>
	</div>
</body>
</html>