<%@page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String healthPostName = request.getParameter("healthPostName");
	String description = StringEscapeUtils.escapeSql(request.getParameter("description"));
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String gote = request.getParameter("gote");
	String googleMap = StringEscapeUtils.escapeSql(request.getParameter("googleMap"));
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	
	HealthPost healthPost = new HealthPost(healthPostName,description,healthCenterId);
	healthPost.addHealthPost();
	
	HealthPost fetchedHealthPost = HealthPost.fetchHealthPostUsing(healthPostName,description,healthCenterId);
	//now save the location of the health center...
	HealthPostLocation healthPostLocation = new HealthPostLocation(woreda,kebele,gote,googleMap,fetchedHealthPost.getId());
	healthPostLocation.addHealthPostLocation();
%>
<%@include file="showaddhealthpostform.jsp" %>
<p class="msg done">Health post saved successfully!</p>