<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<MainStore> mainStoreList = null;
	List<Stock> stockList = null;
	MainStoreDetail mainStoreDetail = null;
	StockDetail stockDetail = null;
	
	mainStoreList = MainStore.getAllMainStores();
	stockList = Stock.getAllStocks();
	
	
	if(!mainStoreList.isEmpty()){
		Iterator<MainStore> mainStoreItr = mainStoreList.iterator();
		while(mainStoreItr.hasNext()){
			MainStore mainStore = mainStoreItr.next();
			MainStoreDetail fetchedDetail = MainStoreDetail.getMainStoreDetailForThisMainStoreAndItem((int)mainStore.getId(), "CONDOM");
			if(fetchedDetail == null){
				mainStoreDetail = new MainStoreDetail(mainStore.getId(),"CONDOM",500);
				mainStoreDetail.addMainStoreDetail();
			}
			fetchedDetail = MainStoreDetail.getMainStoreDetailForThisMainStoreAndItem((int)mainStore.getId(), "PILLS");
			if(fetchedDetail == null){
				mainStoreDetail = new MainStoreDetail(mainStore.getId(),"PILLS",500);
				mainStoreDetail.addMainStoreDetail();
			}
			fetchedDetail = MainStoreDetail.getMainStoreDetailForThisMainStoreAndItem((int)mainStore.getId(), "IMPLANT");
			if(fetchedDetail == null){
				mainStoreDetail = new MainStoreDetail(mainStore.getId(),"IMPLANT",500);
				mainStoreDetail.addMainStoreDetail();
			}
			fetchedDetail = MainStoreDetail.getMainStoreDetailForThisMainStoreAndItem((int)mainStore.getId(), "INJECTABLE");
			if(fetchedDetail == null){
				mainStoreDetail = new MainStoreDetail(mainStore.getId(),"INJECTABLE",500);
				mainStoreDetail.addMainStoreDetail();
			}
			mainStoreDetail = null;
		}//end while loop
	}//end mainstore list
	
	if(!stockList.isEmpty()){
		Iterator<Stock> stockItr = stockList.iterator();
		while(stockItr.hasNext()){
			Stock stock = stockItr.next();
			StockDetail fetchedDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "CONDOM");
			if(fetchedDetail == null){
				stockDetail = new StockDetail(stock.getId(),"CONDOM",0);
				stockDetail.addStockDetail();
			}
			fetchedDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "PILLS");
			if(fetchedDetail == null){
				stockDetail = new StockDetail(stock.getId(),"PILLS",0);
				stockDetail.addStockDetail();
			}
			fetchedDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "IMPLANT");
			if(fetchedDetail == null){
				stockDetail = new StockDetail(stock.getId(),"IMPLANT",0);
				stockDetail.addStockDetail();
			}
			fetchedDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "INJECTABLE");
			if(fetchedDetail == null){
				stockDetail = new StockDetail(stock.getId(),"INJECTABLE",0);
				stockDetail.addStockDetail();
			}
			stockDetail = null;
		}//end while loop
	}
%>
<p class="msg done">Done initializaing main store and stock detail values!</p>