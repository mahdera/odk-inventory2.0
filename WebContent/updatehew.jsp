<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int hewId = Integer.parseInt(request.getParameter("hewId"));
	String firstName = request.getParameter("firstName");
	String fatherName = request.getParameter("fatherName");
	String grandFatherName = request.getParameter("grandFatherName");
	String mobileNumber = request.getParameter("mobileNumber");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	//now do the updating...
	HEW.updateHEW(hewId, firstName, fatherName, grandFatherName,mobileNumber, healthPostId);
%>
<%@include file="showlistofhewsforedit.jsp"%>
<p class="msg done">HEW updated successfully!</p>