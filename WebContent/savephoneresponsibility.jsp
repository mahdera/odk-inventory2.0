<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
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
	
	PhoneResponsibility phoneResponsiblity = new PhoneResponsibility(fullName,healthCenterId,jobDescription,
			phoneBrand,apparatusSerialNumber,batterySerialNumber,simPinNumber,puk1,puk2,phoneNumber,dateGivenOn,description);
	phoneResponsiblity.addPhoneResponsibility();
%>
<%@include file="showaddphoneresponsibilityform.jsp"%>
<p class="msg done">Phone responsibility saved successfully!</p>