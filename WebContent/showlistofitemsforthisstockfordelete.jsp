<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int stockId = Integer.parseInt(request.getParameter("stockId"));
	//now get all stock details of this stock from the database...
	List<StockDetail> stockDetailList = StockDetail.getAllStockDetailsOfThisStock(stockId);
	if(!stockDetailList.isEmpty()){
		Iterator<StockDetail> stockDetailItr = stockDetailList.iterator();
		%>
		<table border="1" width="100%">
			<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
				<td>Ser.No</td>
				<td>Item</td>
				<td>Current Quantity</td>
				<td>Delete</td>
			</tr>
			<%
				int ctr=1;
				while(stockDetailItr.hasNext()){
					StockDetail stockDetail = stockDetailItr.next();
					ItemCodeLookup itemCodeLookup = ItemCodeLookup.getItemCodeLookup(stockDetail.getItemCode());
					if(ctr % 2 == 0)
						out.print("<tr>");
					else
						out.print("<tr class='bg'>");
					%>
					<td><%=ctr %></td>
					<td><%=itemCodeLookup.getItemCode() %></td>
					<td><%=stockDetail.getCurrentQuantity() %></td>
					<td>
						<a href="#.jsp" onclick="deleteThisStockDetail(<%=stockDetail.getId() %>);">Delete</a>
					</td>
					</tr>
					<%
						String divId = "stockDetailEditDiv"+stockDetail.getId();
					%>
					<tr>
						<td colspan="4">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
					ctr++;
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg info">There are no items saved in this stock yet!</p>
		<%
	}
%>