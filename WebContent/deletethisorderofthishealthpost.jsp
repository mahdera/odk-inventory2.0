<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	Order.deleteThisOrderOfThisHealthPost(_uri,healthPostId);
%>
<p class="msg done">Order deleted successfully!</p>