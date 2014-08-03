<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	String _uri = request.getParameter("_uri");
	float pillsAmount = Float.parseFloat(request.getParameter("pillsAmount"));
	float condomAmount = Float.parseFloat(request.getParameter("condomAmount"));
	float injectableAmount = Float.parseFloat(request.getParameter("injectableAmount"));
	float implantAmount = Float.parseFloat(request.getParameter("implantAmount"));
	Date pillsExpireDate = Date.valueOf(request.getParameter("pillsExpireDate"));
	Date condomExpireDate = Date.valueOf(request.getParameter("condomExpireDate"));
	Date injectableExpireDate = Date.valueOf(request.getParameter("injectableExpireDate"));
	Date implantExpireDate = Date.valueOf(request.getParameter("implantExpireDate"));
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	//get the old grv values of this particular record...
	GRV grv = GRV.getGRVWithURI(_uri);
	
	//first update the value in the grv table
	GRV.updateGRVWithURI(_uri,pillsAmount,condomAmount,injectableAmount,implantAmount,pillsExpireDate,
			condomExpireDate,injectableExpireDate,implantExpireDate);
	//now update the quantity of items in the health post stock...
	//to do this, first get the stock of this health post
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
	float pillsUpdtedAmount = (pillsCurrentAmount - grv.getPills_amount()) + pillsAmount;
	float condomUpdatedAmount = (condomCurrentAmount - grv.getCondom_amount()) + condomAmount;
	float injectableUpdatedAmount = (injectableCurrentAmount - grv.getInjectable_amount()) + injectableAmount;
	float implantUpdatedAmount = (implantCurrentAmount - grv.getImplant_amount()) + implantAmount;
	
	//now update this values to the stock details of this health post...
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"PILLS",pillsUpdtedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"CONDOM",condomUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"INJECTABLE",injectableUpdatedAmount);
	StockDetail.updateItemAmountForThisItemCodeInThisStock((int)stock.getId(),"IMPLANT",implantUpdatedAmount);
%>
<p class="msg done">GRV and stock item detail updated successfully!</p>