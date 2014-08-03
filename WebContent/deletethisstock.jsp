<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));

	Stock.deleteStock(stockId);
%>
<%@include file="showlistofstockfordelete.jsp"%>
<p class="msg done">Stock deleted successfully!</p>