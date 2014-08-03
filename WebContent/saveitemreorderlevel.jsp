<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));
	String iCode = request.getParameter("itemCode");
	float reorderLevel = Float.parseFloat(request.getParameter("reorderLevel"));
	float emergencyReorderLevel = Float.parseFloat(request.getParameter("emergencyReorderLevel"));
	
	ItemReorderLevel itemReorderLevel = new ItemReorderLevel(stockId,iCode,reorderLevel,emergencyReorderLevel);
	itemReorderLevel.addItemReorderLevel();
%>
<%@include file="showadditemreorderlevelform.jsp"%>
<p class="msg done">Item reorder level saved successfully!</p>