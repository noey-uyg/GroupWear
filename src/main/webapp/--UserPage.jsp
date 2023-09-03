<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.GroupDTO" %>
<!DOCTYPE html>
<html>
<head>
<% 
	String filename = (String)session.getAttribute("fileName");
	String username = (String)session.getAttribute("userName");
	String useremail = (String)session.getAttribute("userEmail");
	
	//내가 가입된 그룹 리스트
	@SuppressWarnings("unchecked")
	ArrayList<GroupUserDTO> groupList = (ArrayList<GroupUserDTO>)session.getAttribute("groupList");
	//내가 가입된 그룹의 멤버 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> gmembercount = (ArrayList<Integer>)session.getAttribute("gmembercount");
	//내가 가입된 그룹의 세부업무 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> gworkcount = (ArrayList<Integer>)session.getAttribute("gworkcount");
	
	//내가 생성한 그룹 리스트
	@SuppressWarnings("unchecked")
	ArrayList<GroupDTO> createGroupList = (ArrayList<GroupDTO>)session.getAttribute("CreateGroupList");
	//내가 생성한 그룹의 멤버 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> cmembercount = (ArrayList<Integer>)session.getAttribute("cmembercount");
	//내가 생성한 그룹의 세부업무 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> cworkcount = (ArrayList<Integer>)session.getAttribute("cworkcount");
%>
<meta charset="UTF-8">
<title>GroupWear:User</title>
<link href="css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="MainTop.jsp" %>
	<h3>UserPage.jsp</h3>
	<div align="center">
		<img src="upload/<%=filename %>" width="100px" height="100px"><p>
		<h3 style="margin-top: 10px;"><%=username %></h3><p>
		<h5 style="margin-top: 10px; margin-bottom: 10px"><%=useremail %></h5>
		<form action="UserPage.do" method="post">
			<button class="form_input_button" type="button" onclick="location.href='MyPage.jsp'">내정보 수정</button>
			<button class="form_input_button" type="button" onclick="location.href='CreateGroup.jsp'">그룹 만들기</button>
			<button class="form_input_button" type="button" onclick="location.href='FindGroup.jsp'">그룹 찾기</button> <p>
			<select class="select_group" name="group">
				<% if (groupList==null){ %>
				<option value="none">그룹 선택</option>
				<%}else if(groupList.isEmpty()){ %>
				<option value="none">그룹 선택</option>
				<%}else{for(int i=0; i<groupList.size(); i++){ %>
				<option value="<%=groupList.get(i).getGroup_id() %>"><%=groupList.get(i).getGroup_name() %></option>
				<%}} %>
			</select>
			<input class="form_input_button" type="submit" value="이동"><p>
			<button class="form_input_button" type="button" onclick="location.href='Logout.jsp'">로그아웃</button>
		</form>
	</div>
</body>
</html>