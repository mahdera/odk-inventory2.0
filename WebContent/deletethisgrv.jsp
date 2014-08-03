<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	//before deleting the grv value, I need to update the current item quantity of each item found in the stock detail 
	//of this health post
	GRV grv = GRV.getGRVWithURI(_uri);
	
	Stock stock = Stock.getStockOfThisHealthPost(healthPostId);
	//now get the current quantity of each item in the health post detail...
	float pillsCurrentAmount = 0.0f;
	float condomCurrentAmount = 0.0f;
	float injectableCurrentAmount = 0.0f;
	float implantCurrentAmount = 0.0f;
	
	pillsCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"PILLS");
	condomCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"CONDOM");
	injectableCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"INJECTABLE");
	implantCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"IMPLANT");
	
	//to get the updated item amount in each stock first sub old grv val and then add the updated (new) value
	float pillsUpdtedAmount = (pillsCurrentAmount - grv.getPills_amount());
	float condomUpdatedAmount = (condomCurrentAmount - grv.getCondom_amount());
	float injectableUpdatedAmount = (injectableCurrentAmount - grv.getInjectable_amount());
	float implantUpdatedAmount = (implantCurrentAmount - grv.getImplant_amount());
	
	//now update this values to the stock details of this health post...
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"PILLS",pillsUpdtedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"CONDOM",condomUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"INJECTABLE",injectableUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"IMPLANT",implantUpdatedAmount);
	
	//now Mahder, you can safely delete the GRV from the database...
	GRV.deleteGRVWithURI(_uri);
%>
<p class="msg done">GRV and the related stock item detail information deleted successfully!</p>