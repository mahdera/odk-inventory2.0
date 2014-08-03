<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Select stock:</td>
			<td>
				<select name="slctstock" id="slctstock" style="width:100%">
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
			<td>
				<input type="button" value="Show" onclick="showListOfItemsForThisStock(document.getElementById('slctstock').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="itemsOnStockDiv"></div>