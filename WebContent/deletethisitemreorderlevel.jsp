<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int reorderLevelId = Integer.parseInt(request.getParameter("reorderLevelId"));
	ItemReorderLevel.deleteItemReorderLevel(reorderLevelId);
%>
<p class="msg done">Item reorder level deleted successfully!</p>