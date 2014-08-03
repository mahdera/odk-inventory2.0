<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
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
		ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
		
		MainStoreDetail mainStoreDetail = (MainStoreDetail) appContext.getBean("mainStoreDetail");
		mainStoreDetail.setMainStoreId(mainStoreId);
		mainStoreDetail.setItemCode(itemCode);
		mainStoreDetail.setCurrentQuantity(quantity);
		
		mainStoreDetail.addMainStoreDetail();
	}
%>
<%@include file="showadditemonmainstoreform.jsp"%>
<p class="msg done">Item on main store added successfully!</p>