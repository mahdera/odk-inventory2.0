<%@page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String healthCenterName = request.getParameter("healthCenterName");
	String description = StringEscapeUtils.escapeSql(request.getParameter("description"));
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String gote = request.getParameter("gote");
	String googleMap = StringEscapeUtils.escapeSql(request.getParameter("googleMap"));
	
	
	HealthCenter healthCenter = new HealthCenter(healthCenterName,description);
	healthCenter.addHealthCenter();
	HealthCenter fetchedHealthCenter = HealthCenter.fetchHealthCenterUsing(healthCenterName,description);
	//now save the location of the health center...
	HealthCenterLocation healthCenterLocation = new HealthCenterLocation(woreda,kebele,gote,googleMap,fetchedHealthCenter.getId());
	healthCenterLocation.addHealthCenterLocation();
%>
<%@include file="showaddhealthcenterform.jsp" %>
<p class="msg done">Health center saved successfully!</p>