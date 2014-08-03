<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String stockName = request.getParameter("stockName");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	Stock stock = new Stock(stockName,healthPostId);
	stock.addStock();
%>
<%@include file="showaddstockform.jsp"%>
<p class="msg done">Stock saved successfully!</p>