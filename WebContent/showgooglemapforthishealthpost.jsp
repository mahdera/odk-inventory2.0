<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%	
	int healthPostLocationId = Integer.parseInt(request.getParameter("healthPostLocationId"));
	HealthPostLocation healthPostLocation = HealthPostLocation.getHealthPostLocation(healthPostLocationId);
	out.print(healthPostLocation.getGoogleMap());
%>