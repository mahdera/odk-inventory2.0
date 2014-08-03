<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));
	String stockName = request.getParameter("stockName");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	Stock.updateStock(stockId, stockName, healthPostId);
%>
<%@include file="showlistofstockforedit.jsp"%>
<p class="msg done">Stock updated successfully!</p>