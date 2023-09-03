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
<title>GroupWear:Sign Up</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>

	
	<%@ include file="MainTop.jsp" %>
	<h3>SignupPage.jsp</h3>
	<div align="center">
		<form action="SignupPage.do" method="post">	
			<input type="text" class="form_input_text" placeholder="아이디 입력" name="signid"><p>
			<input type="password" class="form_input_text" placeholder="비밀번호 입력" name="signpw"><p>
			<input type="password" class="form_input_text" placeholder="비밀번호 재입력" name="signcheckpw"><p>
			<input type="text" class="form_input_text" placeholder="이름 입력" name="signname"><p>
			<input type="text" class="form_input_text" placeholder="이메일 입력" name="signemail"><p>
			<select name="signyear">
				<option value="none">년</option>
			<%
				for(int i=1990; i<=2022; i++){ %>
				<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select>
			<select name="signmonth">
				<option value="none">월</option>
				<%
				for(int i=1; i<=12; i++){ %>
				<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select>
			<select name="signday">
				<option value="none">일</option>
				<%
				for(int i=1; i<=31; i++){ %>
				<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select><p>

			<button type="button" class="form_input_button" onclick="location.href='LoginPage.jsp'">취소</button>
			<input type="submit" class="form_input_button" value="회원가입"><p>	
			
			<div class="errMsg"><%=errMsg %></div>
		</form>
	</div>
</body>
</html>