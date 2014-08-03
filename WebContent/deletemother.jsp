<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	Mother.deleteMother(motherId);
%>
<%@include file="showlistofmothersfordelete.jsp"%>