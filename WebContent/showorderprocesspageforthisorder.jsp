<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	//out.println(_uri);
	Order order = Order.getOrderUsingOrderId(_uri);
	float pillsRequestedAmount=0.0f;
	float condomRequestedAmount=0.0f;
	float injectableRequestedAmount=0.0f;
	float implantRequestedAmount=0.0f;
	//now get the values...
	pillsRequestedAmount = order.getPills_amount();
	condomRequestedAmount = order.getCondom_amount();
	injectableRequestedAmount = order.getInjectable_amount();
	implantRequestedAmount = order.getImplant_amount();
	/////now get the item stored in the main store for the health center of this particular health post...
	HealthPost healthPost = HealthPost.getHealthPost(healthPostId);
	HealthCenter healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
	//now get the main store of this health center
	MainStore mainStore = MainStore.getMainStoreForThisHealthCenter(healthCenter.getId());
	//now get the current item quantity/amount of each item for this particular mainStore object in the main store detail...
	/////mahder you stopped here....
	float mainStorePillsQuantity = MainStoreDetail.getMainStoreItemCurrentQuantity(mainStore.getId(),"PILLS");
	float mainStoreCondomQuantity = MainStoreDetail.getMainStoreItemCurrentQuantity(mainStore.getId(),"CONDOM");
	float mainStoreInjectableQuantity = MainStoreDetail.getMainStoreItemCurrentQuantity(mainStore.getId(),"INJECTABLE");
	float mainStoreImplantQuantity = MainStoreDetail.getMainStoreItemCurrentQuantity(mainStore.getId(),"IMPLANT");
	//check if this order has already been approved or not...
	ApprovedOrder approvedOrder = ApprovedOrder.getApprovedOrderForThisOrder(_uri);
	if(approvedOrder == null){
%>
<form>
	<table border="0" width="100%">
		<tr style="background:#eeeeee;font-weight:bold;font-size:10pt">			
			<td>Item</td>
			<td>Requested Amount</td>
			<td>Available on Health Center</td>
			<td>Approved Amount</td>
		</tr>
		<tr>
			<td>Pills</td>
			<td><%=pillsRequestedAmount %></td>
			<td><%=mainStorePillsQuantity %></td>
			<td>
				<input type="text" name="txtpills" id="txtpills"/>
			</td>
		</tr>
		<tr>
			<td>Condom</td>
			<td><%=condomRequestedAmount %></td>
			<td><%=mainStoreCondomQuantity %></td>
			<td><input type="text" name="txtcondom" id="txtcondom"/></td>
		</tr>
		<tr>
			<td>Injectable</td>
			<td><%=injectableRequestedAmount %></td>
			<td><%=mainStoreInjectableQuantity %></td>
			<td><input type="text" name="txtinjectable" id="txtinjectable"/></td>
		</tr>
		<tr>
			<td>Implant</td>
			<td><%=implantRequestedAmount %></td>
			<td><%=mainStoreImplantQuantity %></td>
			<td><input type="text" name="txtimplant" id="txtimplant"/></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="Approve Order" onclick="approveThisOrderForThisHealthPost('<%=_uri %>',
				<%=healthPostId %>,document.getElementById('txtpills').value,document.getElementById('txtcondom').value,
				document.getElementById('txtinjectable').value,document.getElementById('txtimplant').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<%
	}else{
		%>
<form>
	<table border="0" width="100%">
		<tr>
			<td colspan="4">
				<p class="msg info">This order has already been approved! You can edit the values and click the update button to modify!</p>
			</td>
		</tr>
		<tr style="background:#eeeeee;font-weight:bold;font-size:10pt">			
			<td>Item</td>
			<td>Requested Amount</td>
			<td>Available on Health Center</td>
			<td>Approved Amount</td>
		</tr>
		<tr>
			<td>Pills</td>
			<td><%=pillsRequestedAmount %></td>
			<td><%=mainStorePillsQuantity %></td>
			<td>
				<input type="text" name="txtpills" id="txtpills" value="<%=approvedOrder.getPillsAmount() %>"/>
			</td>
		</tr>
		<tr>
			<td>Condom</td>
			<td><%=condomRequestedAmount %></td>
			<td><%=mainStoreCondomQuantity %></td>
			<td><input type="text" name="txtcondom" id="txtcondom" value="<%=approvedOrder.getCondomAmount() %>"/></td>
		</tr>
		<tr>
			<td>Injectable</td>
			<td><%=injectableRequestedAmount %></td>
			<td><%=mainStoreInjectableQuantity %></td>
			<td><input type="text" name="txtinjectable" id="txtinjectable" value="<%=approvedOrder.getInjectableAmount() %>"/></td>
		</tr>
		<tr>
			<td>Implant</td>
			<td><%=implantRequestedAmount %></td>
			<td><%=mainStoreImplantQuantity %></td>
			<td><input type="text" name="txtimplant" id="txtimplant" value="<%=approvedOrder.getImplantAmount() %>"/></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="Update Approved Order" onclick="updateThisOrderForThisHealthPost('<%=_uri %>',
				<%=healthPostId %>,document.getElementById('txtpills').value,document.getElementById('txtcondom').value,
				document.getElementById('txtinjectable').value,document.getElementById('txtimplant').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
		<%
	}
%>