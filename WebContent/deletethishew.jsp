<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int hewId = Integer.parseInt(request.getParameter("hewId"));
	HEW.deleteHEW(hewId);
%>
<%@include file="showlistofhewsfordelete.jsp"%>
<p class="msg done">HEW deleted successfully!</p>