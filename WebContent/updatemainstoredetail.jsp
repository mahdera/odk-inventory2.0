<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long mainStoreDetailId = Long.parseLong(request.getParameter("mainStoreDetailId"));
	float quantity = Float.parseFloat(request.getParameter("quantity"));
	
	MainStoreDetail.updateMainStoreDetail(mainStoreDetailId, quantity);
%>
<p class="msg done">Main store detail updated successfully!</p>