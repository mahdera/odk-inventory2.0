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
							<option value="<%=stock.getId() %>">Health Post: <%=HealthPost.getHealthPost(stock.getHealthPostId()).getHealthPostName() %>, Stock: <%=stock.getStockName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
			<td>
				<input type="button" value="Show" onclick="showListOfItemReorderLevelsForThisStockForDelete(document.getElementById('slctstock').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="itemReorderDiv"></div>