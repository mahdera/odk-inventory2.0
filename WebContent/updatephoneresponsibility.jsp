<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	long respoId = Long.parseLong(request.getParameter("respoId"));
	String fullName = request.getParameter("fullName");
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	String jobDescription = request.getParameter("jobDescription");
	String phoneBrand = request.getParameter("phoneBrand");
	String apparatusSerialNumber = request.getParameter("apparatusSerialNumber");
	String batterySerialNumber = request.getParameter("batterySerialNumber");
	String simPinNumber = request.getParameter("simPinNumber");
	String phoneNumber = request.getParameter("phoneNumber");
	Date dateGivenOn = Date.valueOf(request.getParameter("dateGivenOn"));
	String description = request.getParameter("description");
	String puk1 = request.getParameter("puk1");
	String puk2 = request.getParameter("puk2");
	//update the values....
	PhoneResponsibility.updatePhoneResponsibility(respoId, fullName, healthCenterId, jobDescription, phoneBrand, apparatusSerialNumber, 
			batterySerialNumber, simPinNumber, phoneNumber, dateGivenOn, description,puk1,puk2);
%>
<%@include file="showlistofphoneresponsiblityforedit.jsp"%>
<p class="msg done">Phone responsibility updated successfully!</p>