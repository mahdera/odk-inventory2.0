<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	DecimalFormat twoDigit = new DecimalFormat("0.00");
	//String type = request.getParameter("type");
	//int facilityId = Integer.parseInt(request.getParameter("facilityId"));
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	Iterator<HEWManagesHealthPost> hewManagesHealthPostItr = null;
	//now get the total quantity for each item type during the specified period...
	float condomTotalQty=0.0f;
	float pillsTotalQty=0.0f;
	float injectableTotalQty=0.0f;
	float implantTotalQty=0.0f;
	List<HealthPost> stockOutHealthPostList = new ArrayList<HealthPost>();
	Iterator<HealthPost> stockOutHealthPostItr = null;
	boolean isHealthPostStockOut = false;
	//now get all healthposts from all health centers...
	List<HealthPost> allHealthPostList = HealthPost.getAllHealthPosts();	
	
	//condomTotalQty =....stopped here...continue from here... 
	
	if(!allHealthPostList.isEmpty()){		
		//here get all health posts under this health center...
		//HealthCenter healthCenter = HealthCenter.getHealthCenter(facilityId);
		
		List<HealthPost> healthPostList = allHealthPostList;//HealthPost.getAllHealthPostsUnderThisHealthCenter(healthCenter.getId());
		Iterator<HealthPost> healthPostItr = healthPostList.iterator();
		if(!healthPostList.isEmpty()){
			healthPostItr = healthPostList.iterator();
		%>
		<h3 style="background:lightyellow">Contraceptive Stock out Listing for All Health Posts During <%=fromDate %> up to <%=toDate %></h3>
		<%
		float hcCondomAmount=0.0f;
		float hcPillsAmount=0.0f;
		float hcInjectableAmount=0.0f;
		float hcImplantAmount=0.0f;
		///
		//Goods Issue Voucher...
		float grandTotalGIVCondom=0.0f;
		float grandTotalGIVPills=0.0f;
		float grandTotalGIVInjectable=0.0f;
		float grandTotalGIVImplant=0.0f;
		float grandTotalGIV=0.0f;
		///Goods Received Voucher...
		float grandTotalGRVCondom=0.0f;
		float grandTotalGRVPills=0.0f;
		float grandTotalGRVInjectable=0.0f;
		float grandTotalGRVImplant=0.0f;
		float grandTotalGRV=0.0f;
		///Lost or Damaged...
		float grandTotalLostDamagedCondom=0.0f;
		float grandTotalLostDamagedPills=0.0f;
		float grandTotalLostDamagedInjectable=0.0f;
		float grandTotalLostDamagedImplant=0.0f;
		float grandTotalLostDamaged=0.0f;
		
		while(healthPostItr.hasNext()){
			HealthCenter healthCenter = null;
			HealthPost healthPost = healthPostItr.next();
			List<HEWManagesHealthPost> hewManagesHealthPostList = HEWManagesHealthPost.getAllHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
			if(!hewManagesHealthPostList.isEmpty())
				hewManagesHealthPostItr = hewManagesHealthPostList.iterator();
			healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
			%>
			
			<table border="0" width="100%">
				<tr style="background:#eeeeee;font-size:11pt;font-weight:bolder">
				<td colspan="7">
					Health Post: <%=healthPost.getHealthPostName() %>, Health Center: <%=healthCenter.getHealthCenterName() %>
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
				
				//now get the odk user id of this inv user from the database...
				RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(hewId);
				if(relatedUser != null && user != null){
					String hewFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
					//now get sum of all givs issued by this particular user during this period for each item code
					float pillsGIVAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
					float condomGIVAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
					float injectableGIVAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
					float implantGIVAmt = GIV.getTotalIssuedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT",relatedUser.get_uri(),fromDate,toDate);
					float rowGIVTotal = pillsGIVAmt + condomGIVAmt + injectableGIVAmt + implantGIVAmt;
					///now do the same for GRV...
					float pillsGRVAmt = GRV.getTotalReceivedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float condomGRVAmt = GRV.getTotalReceivedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float injectableGRVAmt = GRV.getTotalReceivedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float implantGRVAmt = GRV.getTotalReceivedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float rowGRVTotal = pillsGRVAmt + condomGRVAmt + injectableGRVAmt + implantGRVAmt;
					///now do the same for LostDamaged
					float pillsLostDamagedAmt = LostDamaged.getTotalLostOrDamagedAmountsForThisItemByThisUserDuringThisPeriod("PILLS_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float condomLostDamagedAmt = LostDamaged.getTotalLostOrDamagedAmountsForThisItemByThisUserDuringThisPeriod("CONDOM_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float injectableLostDamagedAmt = LostDamaged.getTotalLostOrDamagedAmountsForThisItemByThisUserDuringThisPeriod("INJECTABLE_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float implantLostDamagedAmt = LostDamaged.getTotalLostOrDamagedAmountsForThisItemByThisUserDuringThisPeriod("IMPLANT_AMOUNT", relatedUser.get_uri(), fromDate, toDate);
					float rowLostDamagedTotal = pillsLostDamagedAmt + condomLostDamagedAmt + injectableLostDamagedAmt + implantLostDamagedAmt;
					
					////now do the column calculation...
					grandTotalGIVCondom += condomGIVAmt;
					grandTotalGIVPills += pillsGIVAmt;
					grandTotalGIVInjectable += injectableGIVAmt;
					grandTotalGIVImplant += implantGIVAmt;
					grandTotalGIV += rowGIVTotal;
					/////do the grand calculation for GRV
					grandTotalGRVCondom += condomGRVAmt;
					grandTotalGRVPills += pillsGRVAmt;
					grandTotalGRVInjectable += injectableGRVAmt;
					grandTotalGRVImplant += implantGRVAmt;
					grandTotalGRV += rowGRVTotal;
					/////do the grand calculation for LostDamaged...
					grandTotalLostDamagedCondom += condomLostDamagedAmt;
					grandTotalLostDamagedPills += pillsLostDamagedAmt;
					grandTotalLostDamagedInjectable += injectableLostDamagedAmt;
					grandTotalLostDamagedImplant += implantLostDamagedAmt;
					grandTotalLostDamaged += rowLostDamagedTotal;
					%>
					<tr>
					<td><%=ctr %></td>
					<td><%=hewFullName %></td>
					<td>
						<%
							float condomGIVRemainingAmount = (condomGRVAmt - condomLostDamagedAmt) - condomGIVAmt;
							if(condomGIVAmt > (condomGRVAmt - condomLostDamagedAmt) || condomGIVRemainingAmount == 0){
								isHealthPostStockOut = true;								
								%>
								<font color="red">STOCK OUT</font>
								<%
							}else{
								//show the remaining amount								 
								%>
								<font color="green"><%=twoDigit.format(condomGIVRemainingAmount) %></font>
								<%
							}
						%>
					</td>
					<td>
						<%
							float pillsGIVRemainingAmount = (pillsGRVAmt - pillsLostDamagedAmt) - pillsGIVAmt;
							if(pillsGIVAmt > (pillsGRVAmt - pillsLostDamagedAmt) || pillsGIVRemainingAmount == 0){
								isHealthPostStockOut = true;
								%>
								<font color="red">STOCK OUT</font>
								<%
							}else{
								//show the remaining amount								 
								%>
								<font color="green"><%=twoDigit.format(pillsGIVRemainingAmount) %></font>
								<%
							}
						%>
					</td>
					<td>
						<%
							float injectableGIVRemainingAmount = (injectableGRVAmt - injectableLostDamagedAmt) - injectableGIVAmt;
							if(injectableGIVAmt > (injectableGRVAmt - injectableLostDamagedAmt) || injectableGIVRemainingAmount == 0){
								isHealthPostStockOut = true;
								%>
								<font color="red">STOCK OUT</font>
								<%
							}else{
								//show the remaining amount								 
								%>
								<font color="green"><%=twoDigit.format(injectableGIVRemainingAmount) %></font>
								<%
							}
						%>
					</td>
					<td>
						<%
							float implantGIVRemainingAmount = (implantGRVAmt - implantLostDamagedAmt) - implantGIVAmt;
							if(implantGIVAmt > (implantGRVAmt - implantLostDamagedAmt) || implantGIVRemainingAmount == 0){
								isHealthPostStockOut = true;
								%>
								<font color="red">STOCK OUT</font>
								<%
							}else{
								//show the remaining amount								 
								%>
								<font color="green"><%=twoDigit.format(implantGIVRemainingAmount) %></font>
								<%
							}
						%>
					</td>
					<td>
						<%
							float totalGIVRemainingAmount = (grandTotalGRV - grandTotalLostDamaged) - grandTotalGIV;
							if(grandTotalGIV > (grandTotalGRV - grandTotalLostDamaged) || totalGIVRemainingAmount == 0){
								isHealthPostStockOut = true;
								%>
								<font color="red">STOCK OUT</font>
								<%
							}else{
								//show the remaining amount								 
								%>
								<font color="green"><%=twoDigit.format(totalGIVRemainingAmount) %></font>
								<%
							}
						%>
					</td>
				</tr>
					<%
					if(isHealthPostStockOut){
						HealthPost hPost = HealthPost.getHealthPost(hewManagesHealthPost.getHealthPostId());
						stockOutHealthPostList.add(hPost);
					}
				}//end if relatedUser != null
				isHealthPostStockOut = false;
			}//end while loop
			%>
				<tr style="font-weight:bolder">				
					<td colspan="2" align="right"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
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
		<h3>Health Center Stock out Summary (All HPs Stock out Listing):</h3>
		<table border="0" width="100%">
			<%
				int ctr=1;
			%>
			<tr style="background:red;color:white;font-size:11pt;font-weight:bolder">
				<td>Ser.No.</td>
				<td>Health Center</td>
				<td>Health Post Name</td>
				<td>Stock Status</td>
				<td>Stock Out Period</td>				
			</tr>
			<%
				if(!stockOutHealthPostList.isEmpty()){
					stockOutHealthPostItr = stockOutHealthPostList.iterator();
					while(stockOutHealthPostItr.hasNext()){
						HealthPost hPost = stockOutHealthPostItr.next();
						HealthCenter hCenter = HealthCenter.getHealthCenter(hPost.getHealthCenterId());
			%>			
			<tr>
				<td><%=ctr++ %></td>
				<td><%=hCenter.getHealthCenterName() %></td>
				<td><%=hPost.getHealthPostName() %></td>
				<td><font color='red'>STOCK OUT</font></td>
				<td><%=fromDate %> up to <%=toDate %></td>				
			</tr>
			<%
					}//end while loop
				}//end if
			%>
		</table>
		<%
		}//!hewHealthPostList.isEmpty()...
	}//end else if hc level
%>