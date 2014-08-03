<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int mainStoreId = Integer.parseInt(request.getParameter("mainStoreId"));
	String mainStoreName = request.getParameter("mainStoreName");
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	//now update...
	MainStore.updateMainStore(mainStoreId, mainStoreName, healthCenterId);
%>
<%@include file="showlistofmainstoresforedit.jsp"%>
<p class="msg done">Main store updated successfully!</p>