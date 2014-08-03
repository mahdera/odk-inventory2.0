<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	String motherFullName = request.getParameter("motherFullName");
	String houseNumberGote = request.getParameter("houseNumberGote");
	String preferredContraceptiveMethod = request.getParameter("preferredContraceptiveMethod");
	String phoneNumber = request.getParameter("phoneNumber");
	
	//now update the file Mahder...
	Mother.updateMother(motherId, motherFullName, houseNumberGote, preferredContraceptiveMethod, phoneNumber);
%>
<%@include file="showlistofmothersforedit.jsp"%>