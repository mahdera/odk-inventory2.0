<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String motherFullName = request.getParameter("motherFullName");
	String houseNumberGote = request.getParameter("houseNumberGote");
	String preferredContraceptiveMethod = request.getParameter("preferredContraceptiveMethod");
	String phoneNumber = request.getParameter("phoneNumber");
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	
	Mother mother = (Mother) appContext.getBean("mother");
	mother.setMotherFullName(motherFullName);
	mother.setHouseNumberGote(houseNumberGote);
	mother.setPreferredContraceptiveMethod(preferredContraceptiveMethod);
	mother.setPhoneNumber(phoneNumber);
	
	mother.addMother();
%>
<%@include file="showaddmotherform.jsp"%>