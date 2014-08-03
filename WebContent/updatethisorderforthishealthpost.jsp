<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	float pillsAmount = Float.parseFloat(request.getParameter("pillsAmount"));
	float condomAmount = Float.parseFloat(request.getParameter("condomAmount"));
	float injectableAmount = Float.parseFloat(request.getParameter("injectableAmount"));
	float implantAmount = Float.parseFloat(request.getParameter("implantAmount"));
	
	ApprovedOrder.updateApprovedOrderForThisHealthPost(_uri,healthPostId,pillsAmount,condomAmount,injectableAmount,implantAmount);
%>
<p class="msg done"></p>