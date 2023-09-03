<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ToAo.WorkContentsDTO" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<%
	WorkContentsDTO wcDTO = (WorkContentsDTO)session.getAttribute("showboard");
	GroupUserDTO guDTO = (GroupUserDTO)session.getAttribute("groupuserinfo");
	UserDTO uDTO = (UserDTO)session.getAttribute("userinfo");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Databoard_selectwork.jsp</h3>
	<div style="display:block; margin-top:10px; padding:10px; width:860px; border:1px solid #f2f2f2;">
		<div style="position:relative; margin-top:20px; margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #d1d1d1; display:block;"><!-- 헤더 -->
			<div style="margin-bottom:12px; display:block;">
				<div style="margin-bottom:12px; display:block;"><!-- 프로젝트명 업무명 -->
					<h3 style="font-size:13px; color:#065093"><%="["+wcDTO.getProject_contents()+"]_"+wcDTO.getWork_detail() %></h3>
					<div style="margin-top:7px; display:block;">
						<h3 style="font-weight:400; font-size:26px; word-wrap:break-word; word-break:break-word;"><!-- 타이틀 -->
						<%=wcDTO.getWork_title() %>
						</h3>
					</div>
				</div>
				<div style="height:36px; display:block;" ><!-- 작성자정보 -->
					<img style="position:relative; float:left; margin-right:10px; width:36px; height:36px;"src="upload/<%=uDTO.getFileimage() %>"><!-- 프로필이미지 -->
					<div style="float:left; display:block;">
						<div style="margin-top:2px; margin-bottom:6px; display:block;"><!-- 이름 및 직책 -->
							<div style="dispaly:inline-block; margin-right:6px; float:left; position:relative;  vertical-align:top;"><!-- 이름 -->
								<h3 style="font-size:13px;"><%=wcDTO.getUser_name() %></h3>
							</div>
							<em style="display:inline-block; float:left; vertical-align:top; font-size:12px; font-style:normal; color:#626262;"><!-- 직책 -->
								<%=guDTO.getGroup_auth() %>
							</em>
						</div>
					</div>
					<br>
					<div style="line-height:13px; display:block;"> <!-- 작성날짜 -->
						<h3 style="font-size:12px; color:#979797;"><%=wcDTO.getWorkdata_date() %></h3>
					</div>
				</div>
			</div>
		</div>
		<div style="display:block;"><!-- 콘텐츠 컨테이너 -->
			<div style="line-height:1; display:block; position:relative; max-width:860px; height:auto; word-break:break-all; word-wrap:break-word; ">
			<%=wcDTO.getWork_contents() %>
			</div>
		</div>
	</div>
</body>
</html>