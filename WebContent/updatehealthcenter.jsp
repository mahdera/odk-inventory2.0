<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	String healthCenterName = request.getParameter("healthCenterName");
	String description = request.getParameter("description");
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String gote = request.getParameter("gote");
	String googleMap = request.getParameter("googleMap");
	
	HealthCenter.updateHealthCenter(healthCenterId, healthCenterName, description);
	HealthCenterLocation.updateHealthCenterLocationForThisHealthCenter(healthCenterId, woreda, kebele, gote, googleMap);
%>
<%@include file="showlistofhealthcentersforedit.jsp" %>
<p class="msg done">Health center updated successfully!</p>