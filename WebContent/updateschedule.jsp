<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	long scheduleId = Long.parseLong(request.getParameter("scheduleId"));
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	Date lastVisitDate = Date.valueOf(request.getParameter("lastVisitDate"));
	Date nextScheduleDate = Date.valueOf(request.getParameter("nextScheduleDate"));
	Date actualVisitDate = Date.valueOf(request.getParameter("actualVisitDate"));
	
	Schedule.updateSchedule(scheduleId, lastVisitDate, nextScheduleDate, actualVisitDate);
%>
<%@include file="showlistofschedulesforedit.jsp"%>