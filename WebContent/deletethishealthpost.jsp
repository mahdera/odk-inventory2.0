<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	HealthPost.deleteHealthPost(healthPostId);
%>
<%@include file="showlistofhealthpostsfordelete.jsp"%>
<p class="msg done">Health post deleted successfully!</p>