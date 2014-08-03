<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockDetailId = Long.parseLong(request.getParameter("stockDetailId"));
	float qty = Float.parseFloat(request.getParameter("qty"));
	//update now
	StockDetail.updateStockDetail(stockDetailId,qty);
%>
<p class="msg done"> Stock detail updated successfully!</p>