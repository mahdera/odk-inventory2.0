<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));
	Stock stock = Stock.getStock(stockId);
	HealthPost healthPost = HealthPost.getHealthPost(stock.getHealthPostId());
	///define field names...
	String stockNameField = "txtstockname"+stockId;
	String healthPostField = "slcthealthpost"+stockId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Stock Name:</td>
			<td><input type="text" name="<%=stockNameField%>" id="<%=stockNameField %>" value="<%=stock.getStockName() %>"/></td>
		</tr>
		<tr>
			<td>Health Post:</td>
			<td>
				<select name="<%=healthPostField %>" id="<%=healthPostField %>" style="width:30%">
					<%
						List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost hPost = healthPostItr.next();
							if(healthPost.getId() == hPost.getId()){
								%>
								<option value="<%=healthPost.getId() %>" selected="selected"><%=healthPost.getHealthPostName() %></option>
								<%
							}else{
								%>
								<option value="<%=hPost.getId() %>"><%=hPost.getHealthPostName() %></option>
								<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateStock(<%=stockId %>,document.getElementById('<%=stockNameField %>').value,
				document.getElementById('<%=healthPostField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>