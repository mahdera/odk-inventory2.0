<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	String _uri = request.getParameter("_uri");
	float pillsAmount = Float.parseFloat(request.getParameter("pillsAmount"));
	float condomAmount = Float.parseFloat(request.getParameter("condomAmount"));
	float injectableAmount = Float.parseFloat(request.getParameter("injectableAmount"));
	float implantAmount = Float.parseFloat(request.getParameter("implantAmount"));	
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	Stock stock = Stock.getStockOfThisHealthPost(healthPostId);
	GIV giv = GIV.getGIVWithURI(_uri);
	//now get the current item value in the stock detail
	float pillsCurrentAmount = 0.0f;
	float condomCurrentAmount = 0.0f;
	float injectableCurrentAmount = 0.0f;
	float implantCurrentAmount = 0.0f;
	
	pillsCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"PILLS");
	condomCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"CONDOM");
	injectableCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"INJECTABLE");
	implantCurrentAmount = StockDetail.getTheCurrentItemAmountForThisItemCodeInThisStock((int)stock.getId(),"IMPLANT");
	
	//to get the updated item amount in each stock first sub old grv val and then add the updated (new) value
	float pillsUpdtedAmount = (pillsCurrentAmount - giv.getPills_amount()) + pillsAmount;
	float condomUpdatedAmount = (condomCurrentAmount - giv.getCondom_amount()) + condomAmount;
	float injectableUpdatedAmount = (injectableCurrentAmount - giv.getInjectable_amount()) + injectableAmount;
	float implantUpdatedAmount = (implantCurrentAmount - giv.getImplant_amount()) + implantAmount;
	
	//now update this values to the stock details of this health post...
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"PILLS",pillsUpdtedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"CONDOM",condomUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"INJECTABLE",injectableUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"IMPLANT",implantUpdatedAmount);
	
	GIV.updateGIVWithURI(_uri,pillsAmount,condomAmount,injectableAmount,implantAmount);	
%>
<p class="msg done">GIV and stock item detail updated successfully!</p>