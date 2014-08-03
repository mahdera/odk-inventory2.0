<%@page import="java.sql.Date"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%	
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	%>
	<h3 style="background:lightyellow">Contraceptive Order Pattern Report For All Health Post During <%=fromDate %> up to <%=toDate %></h3>
	<%
	if(true){
		//first mac...get all health posts stored in the database....
		List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
		Iterator<HealthPost> healthPostItr = healthPostList.iterator();
		%>
		<table border="0" width="100%">					
			<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
				<td>Ser.No</td>
				<td>Health Post</td>
				<td>HEW Name</td>
				<td>Condom</td>
				<td>Pills</td>
				<td>Injectable</td>
				<td>Implant</td>
				<td>Total</td>
			</tr>
		<%
		int ctr=1;
		while(healthPostItr.hasNext()){			
			//first get all the HEW working in this health post		
			HealthPost healthPost = healthPostItr.next();
			List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
			if(!hewManagesHealthPostList.isEmpty()){
				Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
				
				
				float grandTotalCondom=0.0f;
				float grandTotalPills=0.0f;
				float grandTotalInjectable=0.0f;
				float grandTotalImplant=0.0f;
				float grandTotal=0.0f;
				
				while(hewManagesHealthPostItr.hasNext()){
					HEWManagesHealthPost hewManagesHealthPost = hewManagesHealthPostItr.next();
					if(hewManagesHealthPost != null){
						int hewId = hewManagesHealthPost.getUserId();
						String hewFullName = null;
						User user = User.getUser(hewId);
						if(user != null)
							 hewFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
						//now get the odk user id of this inv user from the database...
						RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(hewId);
						if(relatedUser != null){
							//now get sum of all givs issued by this particular user during this period for each item code
							float pillsAmt = Order.getTotalOrderedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
							float condomAmt = Order.getTotalOrderedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
							float injectableAmt = Order.getTotalOrderedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
							float implantAmt = Order.getTotalOrderedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
							float rowTotal = pillsAmt + condomAmt + injectableAmt + implantAmt;
							////now do the column calculation...
							grandTotalCondom += condomAmt;
							grandTotalPills += pillsAmt;
							grandTotalInjectable += injectableAmt;
							grandTotalImplant += implantAmt;
							grandTotal += rowTotal;
							%>			
							<tr>
								<td><%=ctr++ %></td>
								<td><%=healthPost.getHealthPostName() %></td>
								<td><%=hewFullName %></td>
								<td><%=condomAmt %></td>
								<td><%=pillsAmt %></td>
								<td><%=injectableAmt %></td>
								<td><%=implantAmt %></td>
								<td><%=rowTotal %></td>
							</tr>
							<%
						}
					}//if related user is <> from null
				}//end while loop
				
			}//this is the end of the if condition...
		}//end while loop
	}
%>
</table>