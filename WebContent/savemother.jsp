<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String motherFullName = request.getParameter("motherFullName");
	String houseNumberGote = request.getParameter("houseNumberGote");
	String preferredContraceptiveMethod = request.getParameter("preferredContraceptiveMethod");
	String phoneNumber = request.getParameter("phoneNumber");
	
	Mother mother = new Mother(motherFullName,houseNumberGote,preferredContraceptiveMethod,phoneNumber);
	mother.addMother();
%>
<%@include file="showaddmotherform.jsp"%>