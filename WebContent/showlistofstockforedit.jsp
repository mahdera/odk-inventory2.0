<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<Stock> stockList = Stock.getAllStocks();
	Iterator<Stock> stockItr = stockList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Stocks</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Stock Name</td>
		<td>Health Post</td>	
		<td>Edit</td>	
	</tr>
	<%
		int ctr=1;
		while(stockItr.hasNext()){
			Stock stock = stockItr.next();
			HealthPost healthPost = HealthPost.getHealthPost(stock.getHealthPostId());
			if(ctr % 2 == 0){
			%>
			<tr class='bg'>
			<%
			}else{
			%>
			<tr>
			<%
			}
			%>
				<td><%=ctr %></td>
				<td><%=stock.getStockName() %></td>
				<td><%=healthPost.getHealthPostName() %></td>	
				<td>
					<a href="#.jsp" onclick="showEditFieldsOfThisStock(<%=stock.getId() %>);">Edit</a>
				</td>			
			</tr>
			<%
				String divId = "stockEditDiv"+stock.getId();
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