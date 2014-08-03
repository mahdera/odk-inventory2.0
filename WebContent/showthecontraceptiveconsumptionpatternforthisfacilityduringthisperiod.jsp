<%@page import="java.sql.Date"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String type = request.getParameter("type");
	int facilityId = Integer.parseInt(request.getParameter("facilityId"));
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	
	if(type.equalsIgnoreCase("hp")){
		//first get all the HEW working in this health post
		HealthPost healthPost = HealthPost.getHealthPost(facilityId);
		List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
		Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
		%>
		<h3 style="background:lightyellow">Contraceptive Consumption Pattern Report For Health Post During <%=fromDate %> up to <%=toDate %></h3>
		<table border="0" width="100%">
			<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
				<td colspan="7">
					Health Post: <%=healthPost.getHealthPostName() %>
				</td>
			</tr>
			<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
				<td>Ser.No</td>
				<td>HEW Name</td>
				<td>Condom</td>
				<td>Pills</td>
				<td>Injectable</td>
				<td>Implant</td>
				<td>Total</td>
			</tr>
		<%
		int ctr=1;
		float grandTotalCondom=0.0f;
		float grandTotalPills=0.0f;
		float grandTotalInjectable=0.0f;
		float grandTotalImplant=0.0f;
		float grandTotal=0.0f;
		
		while(hewManagesHealthPostItr.hasNext()){
			HEWManagesHealthPost hewManagesHealthPost = hewManagesHealthPostItr.next();
			int hewId = hewManagesHealthPost.getUserId();
			User user = User.getUser(hewId);
			String hewFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
			//now get the odk user id of this inv user from the database...
			RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(hewId);
			//now get sum of all givs issued by this particular user during this period for each item code
			float pillsAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
			float condomAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
			float injectableAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
			float implantAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
			float rowTotal = pillsAmt + condomAmt + injectableAmt + implantAmt;
			////now do the column calculation...
			grandTotalCondom += condomAmt;
			grandTotalPills += pillsAmt;
			grandTotalInjectable += injectableAmt;
			grandTotalImplant += implantAmt;
			grandTotal += rowTotal;
			%>			
			<tr>
				<td><%=ctr %></td>
				<td><%=hewFullName %></td>
				<td><%=condomAmt %></td>
				<td><%=pillsAmt %></td>
				<td><%=injectableAmt %></td>
				<td><%=implantAmt %></td>
				<td><%=rowTotal %></td>
			</tr>
			<%
		}//end while loop
		%>
			<tr style="font-weight:bolder">				
				<td colspan="2" align="right">Grand Total ==></td>
				<td><%=grandTotalCondom%></td>
				<td><%=grandTotalPills %></td>
				<td><%=grandTotalInjectable %></td>
				<td><%=grandTotalImplant %></td>
				<td><%=grandTotal %></td>
			</tr>
		</table>
		<%
	}else if(type.equalsIgnoreCase("hc")){
		//here get all health posts under this health center...
		HealthCenter healthCenter = HealthCenter.getHealthCenter(facilityId);
		
		List<HealthPost> healthPostList = HealthPost.getAllHealthPostsUnderThisHealthCenter(healthCenter.getId());
		Iterator<HealthPost> healthPostItr = healthPostList.iterator();
		%>
		<h3 style="background:lightyellow">Contraceptive Consumption Pattern Report For Health Center: <%=healthCenter.getHealthCenterName() %> During <%=fromDate %> up to <%=toDate %></h3>
		<%
		float hcCondomAmount=0.0f;
		float hcPillsAmount=0.0f;
		float hcInjectableAmount=0.0f;
		float hcImplantAmount=0.0f;
		
		while(healthPostItr.hasNext()){
			HealthPost healthPost = healthPostItr.next();
			List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
			Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
			%>
			
			<table border="0" width="100%">
				<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
				<td colspan="7">
					Health Post: <%=healthPost.getHealthPostName() %>
				</td>
				</tr>
				<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
					<td width="5%">Ser.No</td>
					<td width="30%">HEW Name</td>
					<td>Condom</td>
					<td>Pills</td>
					<td>Injectable</td>
					<td>Implant</td>
					<td>Total</td>
				</tr>
			<%
			int ctr=1;
			float grandTotalCondom=0.0f;
			float grandTotalPills=0.0f;
			float grandTotalInjectable=0.0f;
			float grandTotalImplant=0.0f;
			float grandTotal=0.0f;
			
			while(hewManagesHealthPostItr.hasNext()){
				HEWManagesHealthPost hewManagesHealthPost = hewManagesHealthPostItr.next();
				int hewId = hewManagesHealthPost.getUserId();
				User user = User.getUser(hewId);
				String hewFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
				//now get the odk user id of this inv user from the database...
				RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(hewId);
				//now get sum of all givs issued by this particular user during this period for each item code
				float pillsAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
				float condomAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
				float injectableAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
				float implantAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
				float rowTotal = pillsAmt + condomAmt + injectableAmt + implantAmt;
				////now do the column calculation...
				grandTotalCondom += condomAmt;
				grandTotalPills += pillsAmt;
				grandTotalInjectable += injectableAmt;
				grandTotalImplant += implantAmt;
				grandTotal += rowTotal;
				%>
				<tr>
					<td><%=ctr %></td>
					<td><%=hewFullName %></td>
					<td><%=condomAmt %></td>
					<td><%=pillsAmt %></td>
					<td><%=injectableAmt %></td>
					<td><%=implantAmt %></td>
					<td><%=rowTotal %></td>
				</tr>
				<%
			}//end while loop
			%>
				<tr style="font-weight:bolder">				
					<td colspan="2" align="right">Grand Total ==></td>
					<td><%=grandTotalCondom%></td>
					<td><%=grandTotalPills %></td>
					<td><%=grandTotalInjectable %></td>
					<td><%=grandTotalImplant %></td>
					<td><%=grandTotal %></td>
				</tr>
			</table>
			<%
			hcCondomAmount += grandTotalCondom;
			hcPillsAmount += grandTotalPills;
			hcInjectableAmount += grandTotalInjectable;
			hcImplantAmount += grandTotalImplant;
		}//end health center while loop
		float hcGrandTotal = hcCondomAmount + hcPillsAmount + hcInjectableAmount + hcImplantAmount;
		%>
		<h3>Health Center Consumption Pattern Summary:</h3>
		<table border="0" width="100%">
			<tr style="background:lightgreen;font-size:11pt;font-weight:bolder">
				<td>Condom</td>
				<td>Pills</td>
				<td>Injectable</td>
				<td>Implant</td>
				<td>Total</td>
			</tr>
			<tr>
				<td><%=hcCondomAmount %></td>
				<td><%=hcPillsAmount %></td>
				<td><%=hcInjectableAmount %></td>
				<td><%=hcImplantAmount %></td>
				<td><%=hcGrandTotal %></td>
			</tr>
		</table>
		<%
	}//end else if hc level
%>