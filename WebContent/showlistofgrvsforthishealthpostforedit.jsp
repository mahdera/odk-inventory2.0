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
		<td>Pills Expire Date</td>
		<td>Condom Amount</td>
		<td>Condom Expire Date</td>
		<td>Injectable Amount</td>
		<td>Injectable Expire Date</td>
		<td>Implant Amount</td>
		<td>Implant Expire Date</td>	
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
				List<GRV> grvList = GRV.getAllGRVsFilledByODKUser(relateOdkUser.get_uri());
				Iterator<GRV> grvItr = grvList.iterator();
				while(grvItr.hasNext()){
					GRV grv = grvItr.next();
					User user = User.getUser(userId);
					String fullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
					%>
					<tr>
						<td><%=ctr %></td>
						<td><%=grv.get_submission_date() %></td>
						<td><%=fullName %></td>
						<td><%=grv.getPills_amount() %></td>
						<td><%=grv.getPillsExpireDate() %></td>
						<td><%=grv.getCondom_amount() %></td>
						<td><%=grv.getCondomExpireDate() %></td>
						<td><%=grv.getInjectable_amount() %></td>
						<td><%=grv.getInjectableExpireDate() %></td>
						<td><%=grv.getImplant_amount() %></td>
						<td><%=grv.getImplantExpireDate() %></td>
						<td>
							<a href="#.jsp" onclick="showEditFieldsOfThisGRV('<%=grv.get_uri() %>',<%=healthPostId %>);">Edit</a>
						</td>
					</tr>
					<%
						String divId = "grvEditDiv"+grv.get_uri();
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