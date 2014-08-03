<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	String healthPostName = request.getParameter("healthPostName");
	String description = request.getParameter("description");
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String gote = request.getParameter("gote");
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	String googleMapLocation = request.getParameter("googleMapLocation");
	//now update the health post
	HealthPost.updateHealthPost(healthPostId, healthPostName, description, healthCenterId,googleMapLocation);
	HealthPostLocation.updateHealthPostLocationOfThisHealthPost(healthPostId, woreda, kebele, gote);
%>
<%@include file="showlistofhealthpostsforedit.jsp"%>
<p class="msg done">Health post updated successfully!</p>