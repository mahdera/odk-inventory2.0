<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	HealthCenter.deleteHealthCenter(healthCenterId);
%>
<%@include file="showlistofhealthcentersfordelete.jsp" %>
<p class="msg done">Health center deleted successfully!</p>