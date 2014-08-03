<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	float pillsAmount = Float.parseFloat(request.getParameter("pillsAmount"));
	float condomAmount = Float.parseFloat(request.getParameter("condomAmount"));
	float injectableAmount = Float.parseFloat(request.getParameter("injectableAmount"));
	float implantAmount = Float.parseFloat(request.getParameter("implantAmount"));
	Account account = (Account)session.getAttribute("account");
	int userId = account.getUserId();
	//now save this information on the approved orders table
	ApprovedOrder approvedOrder = new ApprovedOrder(_uri,healthPostId,userId,pillsAmount,condomAmount,injectableAmount,implantAmount);
	approvedOrder.addApprovedOrder();	
%>
<p class="msg done">Order approved successfully!</p>