<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	String status = request.getParameter("status");
	
	List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPostId);
	Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = null;
	if(hewManagesHealthPostList != null)
		hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
	
	if(!hewManagesHealthPostList.isEmpty()){
		%>
		<table border="1" width="100%">
			<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
				<td>Ser.No</td>
				<td>Submission Date</td>
				<td>HEW</td>
				<td>Pills Requested Amount</td>				
				<td>Condom Requested Amount</td>				
				<td>Injectable Requested Amount</td>				
				<td>Implant Requested Amount</td>		
				<td>Delete</td>				
			</tr>
			<%
				int ctr=1;
				while(hewManagesHealthPostItr.hasNext()){
					HEWManagesHealthPost hewManagesHealthPost = hewManagesHealthPostItr.next();
					int userId = hewManagesHealthPost.getUserId();
					RelateODKUserWithInventoryUser relateOdkUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(userId);
					if(relateOdkUser != null){
						//get all grvs filled by this odk user...
						List<Order> orderList = Order.getAllOrdersFilledByODKUser(relateOdkUser.get_uri());
						Iterator<Order> orderItr = orderList.iterator();
						
						while(orderItr.hasNext()){
							Order order = orderItr.next();
							User user = User.getUser(userId);
							String fullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
							%>
							<tr>
								<td><%=ctr %></td>
								<td><%=order.get_submission_date() %></td>
								<td><%=fullName %></td>
								<td><%=order.getPills_amount() %></td>								
								<td><%=order.getCondom_amount() %></td>								
								<td><%=order.getInjectable_amount() %></td>								
								<td><%=order.getImplant_amount() %></td>	
								<td>
									<a href="#.jsp" onclick="deleteThisOrderOfThisHealthPost('<%=order.get_uri() %>',<%=healthPostId %>);">Delete</a>
								</td>							
							</tr>
							<%
								String divId = "processDiv" + order.get_uri();
							%>
							<tr>
								<td colspan="8">
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
		<%
	}else{
		%>
		<p class="msg info">This Health post does not have any HEW associated with it!</p>
		<%
	}
%>