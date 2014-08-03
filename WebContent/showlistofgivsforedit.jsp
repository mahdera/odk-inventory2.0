<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "givManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	
	if(role.isUpdateable()){
%>
<form style="background:#eeeeee">
	<table border="1" width="100%">
		<tr>
			<td>Select Health Post</td>
			<td>
				<select name="slcthealthpost" id="slcthealthpost" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost healthPost = healthPostItr.next();
							%>
							<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
			<td>
				<input type="button" value="Show" onclick="showListOfGIVsForThisHealthPostForEdit(document.getElementById('slcthealthpost').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="givDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>