<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockDetailId = Long.parseLong(request.getParameter("stockDetailId"));
	StockDetail.deleteStockDetail(stockDetailId);
%>
<p class="msg done">Stock detail deleted successfully!</p>