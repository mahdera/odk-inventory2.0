<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long mainStoreDetailId = Long.parseLong(request.getParameter("mainStoreDetailId"));
	MainStoreDetail.deleteMainStoreDetail(mainStoreDetailId);
%>
<p class="msg done">Main store detail deleted successfully!</p>