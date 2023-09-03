<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.projectDTO" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.WorkDTO" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	@SuppressWarnings("unchecked")
	ArrayList<String> allProject = (ArrayList<String>)session.getAttribute("groupProject");
	@SuppressWarnings("unchecked")
	ArrayList<projectDTO> AllProject = (ArrayList<projectDTO>)session.getAttribute("GroupAllProject");
	@SuppressWarnings("unchecked")
	ArrayList<WorkDTO> allWork = (ArrayList<WorkDTO>)session.getAttribute("allWork");
	
	String project_Name = (String)session.getAttribute("project_Name");
	if(project_Name==null){
		if(allProject==null||allProject.isEmpty()){
			project_Name="프로젝트 없음";
		}else{
			project_Name=allProject.get(0);
		}	
	}
	
	Calendar calendar = Calendar.getInstance();
	
	int year1=0;
	int year2=0;
	int month1=0;
	int month2=0;
	int day1=0;
	int day2=0;
	
	for(int i=0; i<AllProject.size(); i++){
		if(AllProject.get(i).getGroup_id().equals((String)session.getAttribute("group_id"))
				& AllProject.get(i).getContents().equals(project_Name)){
			year1=Integer.parseInt(AllProject.get(i).getDate1().split("-")[0]);
			year2=Integer.parseInt(AllProject.get(i).getDate2().split("-")[0]);
			month1=Integer.parseInt(AllProject.get(i).getDate1().split("-")[1]);
			month2=Integer.parseInt(AllProject.get(i).getDate2().split("-")[1]);
			day1=Integer.parseInt(AllProject.get(i).getDate1().split("-")[2]);
			day2=Integer.parseInt(AllProject.get(i).getDate2().split("-")[2]);
		}
	}
	
	int year = year1;
	int month = month1;	
	if(request.getParameter("month")!=null){
		month = Integer.parseInt(request.getParameter("month"));
		year = Integer.parseInt(request.getParameter("year"));
		if(month>=13){
			year++;
			month=1;
		}else if(month<=0){
			year--;
			month=12;
		}
	}
	
	//calendar.set(year,month-1,1);
	//int maxDays=calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	Calendar cal1 = Calendar.getInstance();
	Calendar cal2 = Calendar.getInstance();
	
	cal1.set(year1,month1-1,day1);
	cal2.set(year2,month2-1,day2);
	int maxDays=0;
	while(!cal1.after(cal2)){
		maxDays++;
		cal1.add(Calendar.DATE,1);
	}
%>
<title>Insert title here</title>
</head>
<body>
<h3>Schedule_Ganttchart.jsp</h3>
	<%if(allWork==null){ %>
		<h3>프로젝트를 선택하세요</h3>
	<%}else{ %>
	<table style="text-align:center; border-spacing: 0 20px;">
		<tr><!-- 헤더 -->
			<th style="width:200px;">업무명</th>
			<th style="width:200px;">담당자</th>
			<th style="width:200px;">상태</th>
			<th colspan=<%= maxDays %>><%=year1+"년"+month1+"월"+day1+"일~"+year2+"년"+month2+"월"+day2+"일" %><th>
		</tr>
		<% for(int i=0;i<allWork.size();i++){if(allWork.get(i).getWork_project().equals(project_Name)){
			int workyear1 = Integer.parseInt(allWork.get(i).getWork_date1().split("-")[0]);
			int workyear2 = Integer.parseInt(allWork.get(i).getWork_date2().split("-")[0]);
			int workmonth1 = Integer.parseInt(allWork.get(i).getWork_date1().split("-")[1]);
			int workmonth2 = Integer.parseInt(allWork.get(i).getWork_date2().split("-")[1]);
			int workday1 = Integer.parseInt(allWork.get(i).getWork_date1().split("-")[2]);
			int workday2 = Integer.parseInt(allWork.get(i).getWork_date2().split("-")[2]);
			
			Calendar workcal1 = Calendar.getInstance();
			Calendar workcal2 = Calendar.getInstance();
			
			workcal1.set(workyear1,workmonth1-1,workday1);
			workcal2.set(workyear2,workmonth2-1,workday2);
			int workday=0;
			while(!workcal1.after(workcal2)){
				workday++;
				workcal1.add(Calendar.DATE,1);
			}
			
			cal1.set(year1,month1-1,day1);
			workcal1.set(workyear1,workmonth1-1,workday1);
			int firstday=0;
			while(!cal1.after(workcal1)){
				firstday++;
				cal1.add(Calendar.DATE,1);
			}
		%>
		<tr>
			<td><%=allWork.get(i).getWork_detail() %></td>
			<td><%=allWork.get(i).getWork_member_name() %></td>
			<%if(allWork.get(i).getWork_clear()){ %>
				<td style="color:green;">완료</td>
			<%}else{ %>
				<td style="color:skyblue;">진행중</td>
			<%} %>
			<%for(int j=1;j<maxDays;j++){ if(firstday<=j && j<=firstday+workday){if(allWork.get(i).getWork_clear()){ %>
				<td style="background-color: green; width:20px;"> </td>
			<%}else{ %>
				<td style="background-color: skyblue; width:20px;"> </td>
			<%}}else{ %>
				<td style="background-color: white; width:20px;"> </td>
			<%}} %>
		</tr>
		<%}} %>
	</table>
	<%} %>
</body>
</html>