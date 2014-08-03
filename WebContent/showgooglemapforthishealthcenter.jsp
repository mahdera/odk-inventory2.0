<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%	
	int healthCenterLocationId = Integer.parseInt(request.getParameter("healthCenterLocationId"));
	HealthCenterLocation healthCenterLocation = HealthCenterLocation.getHealthCenterLocation(healthCenterLocationId);
	out.print(healthCenterLocation.getGoogleMap());
%>