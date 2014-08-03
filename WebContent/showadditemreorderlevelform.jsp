<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Stock:</td>
			<td>
				<select name="slctstock" id="slctstock" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Stock> stockList = Stock.getAllStocks();
						Iterator<Stock> stockItr = stockList.iterator();
						while(stockItr.hasNext()){
							Stock stock = stockItr.next();
							%>
							<option value="<%=stock.getId() %>">Health post:<%=HealthPost.getHealthPost(stock.getHealthPostId()).getHealthPostName() %>, <%=stock.getStockName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Item Code:</td>
			<td>
				<select name="slctitemcode" id="slctitemcode" style="width:50%" onchange="checkIfItemReorderLevelForThisItemOnThisStockIsAlreadyEntered(this.value,document.getElementById('slctstock').value);">
					<option value="" selected="selected">--Select--</option>
					<%
						List<ItemCodeLookup> itemCodeList = ItemCodeLookup.getAllItemCodeLookups();
						Iterator<ItemCodeLookup> itemCodeLookup = itemCodeList.iterator();
						while(itemCodeLookup.hasNext()){
							ItemCodeLookup itemCode = itemCodeLookup.next();
							%>
							<option value="<%=itemCode.getItemCode() %>"><%=itemCode.getItemCode() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Reorder Level:</td>
			<td><input type="text" name="txtreorderlevel" id="txtreorderlevel"/></td>
		</tr>
		<tr>
			<td>Emergency Reorder Level:</td>
			<td><input type="text" name="txtemergencyreorderlevel" id="txtemergencyreorderlevel"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="buttonDiv"></div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" id="saveButton" value="Save" onclick="saveItemReorderLevel(document.getElementById('slctstock').value,
						document.getElementById('slctitemcode').value,document.getElementById('txtreorderlevel').value,
						document.getElementById('txtemergencyreorderlevel').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>