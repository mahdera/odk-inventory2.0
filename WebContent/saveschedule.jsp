<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	Date lastVisitDate = Date.valueOf(request.getParameter("lastVisitDate"));
	Date nextScheduledDate = Date.valueOf(request.getParameter("nextScheduledDate"));
	Date actualVisitDate = Date.valueOf(request.getParameter("actualVisitDate"));
	
	Schedule schedule = new Schedule(motherId,lastVisitDate,nextScheduledDate,actualVisitDate);
	schedule.addSchedule();
%>
<%@include file="showaddscheduleform.jsp"%>