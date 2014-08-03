<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String firstName = request.getParameter("firstName");
	String fatherName = request.getParameter("fatherName");
	String grandFatherName = request.getParameter("grandFatherName");
	String mobileNumber = request.getParameter("mobileNumber");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	HEW hew = new HEW(firstName,fatherName,grandFatherName,mobileNumber,healthPostId);
	hew.addHEW();
%>
<%@include file="showaddhewform.jsp"%>
<p class="msg done">HEW saved successfully!</p>