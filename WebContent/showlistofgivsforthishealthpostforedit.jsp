<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	//now get the grvs for this particular health post...
	//List<GRV> grvList = GRV.getAllGRVs
	//now get odk user of this health post id
	List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPostId);
	Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
%>
<table border="1" width="100%">
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Submission Date</td>
		<td>HEW</td>
		<td>Pills Amount</td>		
		<td>Condom Amount</td>		
		<td>Injectable Amount</td>		
		<td>Implant Amount</td>			
		<td>Edit</td>	
	</tr>
	<%
		int ctr=1;
		while(hewManagesHealthPostItr.hasNext()){
			HEWManagesHealthPost hewManagesHealthPost = hewManagesHealthPostItr.next();
			int userId = hewManagesHealthPost.getUserId();
			RelateODKUserWithInventoryUser relateOdkUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(userId);
			if(relateOdkUser != null){
				//get all grvs filled by this odk user...
				List<GIV> givList = GIV.getAllGIVsFilledByODKUser(relateOdkUser.get_uri());
				Iterator<GIV> givItr = givList.iterator();
				while(givItr.hasNext()){
					GIV giv = givItr.next();
					User user = User.getUser(userId);
					String fullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
					%>
					<tr>
						<td><%=ctr %></td>
						<td><%=giv.get_submission_date() %></td>
						<td><%=fullName %></td>
						<td><%=giv.getPills_amount() %></td>						
						<td><%=giv.getCondom_amount() %></td>						
						<td><%=giv.getInjectable_amount() %></td>						
						<td><%=giv.getImplant_amount() %></td>						
						<td>
							<a href="#.jsp" onclick="showEditFieldsOfThisGIV('<%=giv.get_uri() %>',<%=healthPostId %>);">Edit</a>
						</td>
					</tr>
					<%
						String divId = "givEditDiv"+giv.get_uri();
					%>
					<tr>
						<td colspan="12">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
					ctr++;
				}//end inner while loop
			}//end if condition
		}//end while loop
	%>
</table>