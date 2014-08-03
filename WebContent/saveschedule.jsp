<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	Date lastVisitDate = Date.valueOf(request.getParameter("lastVisitDate"));
	Date nextScheduledDate = Date.valueOf(request.getParameter("nextScheduledDate"));
	Date actualVisitDate = Date.valueOf(request.getParameter("actualVisitDate"));
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	
	Schedule schedule = (Schedule) appContext.getBean("schedule");
	schedule.setMotherId(motherId);
	schedule.setLastVisitDate(lastVisitDate);
	schedule.setNextScheduledDate(nextScheduledDate);
	schedule.setActualVisitDate(actualVisitDate);
	
	schedule.addSchedule();
%>
<%@include file="showaddscheduleform.jsp"%>