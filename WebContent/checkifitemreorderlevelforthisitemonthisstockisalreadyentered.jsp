<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String itemCode = request.getParameter("itemCode");
	long stockId = Long.parseLong(request.getParameter("stockId"));
	//now check
	if(ItemReorderLevel.doesThisItemHasReorderLevelEnteredForItInThisStock(itemCode,stockId))
		out.print(1);
	else
		out.print(0);
%>