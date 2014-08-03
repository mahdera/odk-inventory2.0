<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int stockId = Integer.parseInt(request.getParameter("stockId"));
	String itemCode = request.getParameter("itemCode");
	float quantity = Float.parseFloat(request.getParameter("quantity"));
	//now save this information on to the database...
	//first check if this item is already available in this particular health center
	if(StockDetail.isThisItemOnThisStockAlreadyExisting(stockId,itemCode)){
		//do update logic only
		//first get the current item quantity
		StockDetail fetchedStockDetail = StockDetail.getStockDetailForThisStockAndItem(stockId,itemCode);
		float currentQuantity = fetchedStockDetail.getCurrentQuantity();
		float updatedQuantity = currentQuantity + quantity;
		StockDetail.updateTheQuantityOfThisItemOnThisStock(stockId,itemCode,updatedQuantity);
	}else{
		//insert new record
		ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
		
		StockDetail stockDetail = (StockDetail) appContext.getBean("stockDetail");
		stockDetail.setStockId(stockId);
		stockDetail.setItemCode(itemCode);
		stockDetail.setCurrentQuantity(quantity);
		
		stockDetail.addStockDetail();
	}
%>
<%@include file="showadditemonhealthpoststockform.jsp"%>
<p class="msg done">Item on stock added successfully!</p>