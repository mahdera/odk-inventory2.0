<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form>
	<table border="1" width="100%">
		<tr>
			<td>Health Post Stock:</td>
			<td>
				<select name="slctstock" id="slctstock" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Stock> stockList = Stock.getAllStocks();
						Iterator<Stock> stockItr = stockList.iterator();
						while(stockItr.hasNext()){
							Stock stock = stockItr.next();
							%>
							<option value="<%=stock.getId() %>"><%=stock.getStockName() %>: Health Post: <%=HealthPost.getHealthPost(stock.getHealthPostId()).getHealthPostName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Item:</td>
			<td>
				<select name="slctitem" id="slctitem" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<ItemCodeLookup> itemCodeLookupList = ItemCodeLookup.getAllItemCodeLookups();
						Iterator<ItemCodeLookup> itemCodeLookupItr = itemCodeLookupList.iterator();
						while(itemCodeLookupItr.hasNext()){
							ItemCodeLookup itemCodeLookup = itemCodeLookupItr.next();
							%>
							<option value="<%=itemCodeLookup.getItemCode() %>"><%=itemCodeLookup.getItemCode() %></option>
							<%
						}//end class
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Quantity:</td>
			<td><input type="text" name="txtquantity" id="txtquantity"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveThisItemOnHealthPostStock(document.getElementById('slctstock').value,
						document.getElementById('slctitem').value,document.getElementById('txtquantity').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>