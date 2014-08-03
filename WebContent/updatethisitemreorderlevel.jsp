<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int reorderLevelId = Integer.parseInt(request.getParameter("reorderLevelId"));
	float itemReorderLevel = Float.parseFloat(request.getParameter("itemReorderLevel"));
	float emergencyReorderLevel = Float.parseFloat(request.getParameter("emergencyReorderLevel"));
	
	ItemReorderLevel.updateItemReorderLevel(reorderLevelId, itemReorderLevel,emergencyReorderLevel);
%>
<p class="msg done">Item reorder level updated successfully!</p>