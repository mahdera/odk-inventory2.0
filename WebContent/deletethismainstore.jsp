<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int mainStoreId = Integer.parseInt(request.getParameter("mainStoreId"));
	MainStore.deleteMainStore(mainStoreId);
%>
<%@include file="showlistofmainstoresfordelete.jsp"%>
<p class="msg done">Main store deleted successfully!</p>