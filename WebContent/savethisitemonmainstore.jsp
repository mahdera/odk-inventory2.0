<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long mainStoreId = Long.parseLong(request.getParameter("mainStoreId"));
	String itemCode = request.getParameter("itemCode");
	float quantity = Float.parseFloat(request.getParameter("quantity"));
	
	//first check if this item is already available in this particular health center
	if(MainStoreDetail.isThisItemOnThisMainStoreAlreadyExisting(mainStoreId,itemCode)){
		//do update logic only
		//first get the current item quantity
		MainStoreDetail fetchedMainStoreDetail = MainStoreDetail.getMainStoreDetailForThisMainStoreAndItem((int)mainStoreId,itemCode);
		float currentQuantity = fetchedMainStoreDetail.getCurrentQuantity();
		float updatedQuantity = currentQuantity + quantity;
		MainStoreDetail.updateTheQuantityOfThisItemOnThisMainStore(mainStoreId,itemCode,updatedQuantity);
	}else{
		//insert new record
		MainStoreDetail mainStoreDetail = new MainStoreDetail(mainStoreId,itemCode,quantity);
		mainStoreDetail.addMainStoreDetail();
	}
%>
<%@include file="showadditemonmainstoreform.jsp"%>
<p class="msg done">Item on main store added successfully!</p>