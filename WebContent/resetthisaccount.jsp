<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%
	int aId = Integer.parseInt(request.getParameter("accountId"));
	String rUsername = request.getParameter("resetedUsername");
	String rPassword = request.getParameter("resetedPassword");
	//out.print(aId+":"+rUsername+":"+rPassword);
	Account.resetThisAccount(aId,rUsername,rPassword);
%>
<%@include file="showaccountsforreset.jsp"%>
<p class="msg done">Account reset successfully!</p>