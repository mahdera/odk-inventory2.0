<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account)session.getAttribute("account");
	User user = User.getUser(account.getUserId());
	
	String functionalityName = "viewApprovedOrders";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());

	if(role.isReadable()){
	System.out.println(user.getUserType());
	List<HealthPost> healthPostList = null;
	Iterator<HealthPost> healthPostItr = null;
	
	if(user.getUserType().equals("Administrator")){
		healthPostList = HealthPost.getAllHealthPosts();
		healthPostItr = healthPostList.iterator();
	}else if(user.getUserType().equals("HC Administrator")){
		NurseManagesHealthCenter nurseManagesHealthCenter = NurseManagesHealthCenter.getNurseManagesHealthCenterForThisUser(user.getId());
		HealthCenter healthCenter = HealthCenter.getHealthCenter(nurseManagesHealthCenter.getHealthCenterId());
		healthPostList = HealthPost.getAllHealthPostsUnderThisHealthCenter(healthCenter.getId());
		healthPostItr = healthPostList.iterator();
	}else if(user.getUserType().equals("HEW")){
		HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostForThisUser(user.getId());
		//now get the specific health post for this particular userId
		if(hewManagesHealthPost != null){
			int healthPostId = hewManagesHealthPost.getHealthPostId();
			healthPostList = HealthPost.getAllHealthPostWithThisId(healthPostId);
			healthPostItr = healthPostList.iterator();
		}
	}
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">		
		<tr>
			<td>Health Post</td>
			<td>
				<%
				if(healthPostItr != null){
				%>
				<select name="slcthealthpost" id="slcthealthpost" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						while(healthPostItr.hasNext()){
							HealthPost healthPost = healthPostItr.next();
							%>
							<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
							<%
						}//end while loop
					%>
				</select>
				<%
				}else{
					%>
					<p class="msg warning">Sorry! this HEW does not manage any health post!</p>
					<%
				}
				%>
			</td>			
			<td>
				<input type="button" value="Show" onclick="showListOfApprovedOrdersForThisHealthPost(document.getElementById('slcthealthpost').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>
<div id="orderDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
	%>