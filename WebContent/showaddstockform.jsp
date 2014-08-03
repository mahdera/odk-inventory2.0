<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Stock Name:</td>
			<td><input type="text" name="txtstockname" id="txtstockname"/></td>
		</tr>
		<tr>
			<td>Health Post:</td>
			<td>
				<select name="slcthealthpost" id="slcthealthpost" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost healthPost = healthPostItr.next();
							%>
							<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveStock(document.getElementById('txtstockname').value,
						document.getElementById('slcthealthpost').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>