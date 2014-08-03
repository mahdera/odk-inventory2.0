<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long scheduleId = Long.parseLong(request.getParameter("scheduleId"));
	Schedule.deleteSchedule(scheduleId);
%>
<%@include file="showlistofschedulesfordelete.jsp"%>