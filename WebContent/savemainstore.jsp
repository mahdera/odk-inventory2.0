<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String mainStoreName = request.getParameter("mainStoreName");
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	
	MainStore mainStore = new MainStore(mainStoreName,healthCenterId);
	mainStore.addMainStore();
%>
<%@include file="showaddmainstoreform.jsp"%>
<p class="msg done">Main store saved successfully!</p>