<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockDetailId = Long.parseLong(request.getParameter("stockDetailId"));
	StockDetail stockDetail = StockDetail.getStockDetail(stockDetailId);
	//define fields here...
	String qtyName = "txtquantity"+stockDetailId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Stock:</td>
			<td><%=Stock.getStock(stockDetail.getStockId()).getStockName() %></td>
		</tr>
		<tr>
			<td>Item Code:</td>
			<td><%=ItemCodeLookup.getItemCodeLookup(stockDetail.getItemCode()).getItemCode() %></td>
		</tr>
		<tr>
			<td>Current Quantity:</td>
			<td><input type="text" name="<%=qtyName %>" id="<%=qtyName %>" value="<%=stockDetail.getCurrentQuantity() %>"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateThisStockDetail(<%=stockDetailId %>,
				document.getElementById('<%=qtyName %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>