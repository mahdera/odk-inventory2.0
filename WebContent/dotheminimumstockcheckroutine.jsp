<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%
	//first get all stocks in the database...
	List<Stock> stockList = Stock.getAllStocks();
	Iterator<Stock> stockItr = stockList.iterator();
	
	java.util.Date d = new java.util.Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	System.out.println(currentDate);
	java.sql.Date sentDate = java.sql.Date.valueOf(currentDate);
	
	while(stockItr.hasNext()){
		Stock stock = stockItr.next();
		HealthPost healthPost = HealthPost.getHealthPost(stock.getHealthPostId());
		StockDetail condomStockDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "CONDOM");
		StockDetail pillsStockDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "PILLS");
		StockDetail injectableStockDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "INJECTABLE");
		StockDetail implantStockDetail = StockDetail.getStockDetailForThisStockAndItem((int)stock.getId(), "IMPLANT");
		//now get the item reorder level of this particular stock item
		ItemReorderLevel condomReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "CONDOM");
		ItemReorderLevel pillsReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "PILLS");
		ItemReorderLevel injectableReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "INJECTABLE");
		ItemReorderLevel implantReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "IMPLANT");
		//now check if the reorder levels are below the limit define for this particular health post
		if(condomReorderLevel != null){
			if(condomStockDetail.getCurrentQuantity() <= condomReorderLevel.getReorderLevel()){
				String message = "Condom in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
						" has passed its minimum stock level. Please refill inventory! Current quantity is : "+condomStockDetail.getCurrentQuantity();
				ItemReorderReminder reminder = new ItemReorderReminder(stock.getId(),"CONDOM",message,sentDate,"Unchecked");
				reminder.addItemReorderReminder();
				if(condomStockDetail.getCurrentQuantity() <= condomReorderLevel.getEmergencyReorderLevel()){
					//first case is if this remider is not saved in the item reorder reminder....
					/* if(!ItemReorderReminder.isThisItemForThisStockHasReminderSentForIt((int)stock.getId(),"CONDOM")){
						message = "Condom in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
								" has passed its emergency stock level. Please refill inventory! Current quantity is : "+condomStockDetail.getCurrentQuantity();
						reminder = new ItemReorderReminder(stock.getId(),"CONDOM",message,sentDate,"Unchecked");
						reminder.addItemReorderReminder();
					} */
				}
			}
		}
		
		if(pillsReorderLevel != null){
			if(pillsStockDetail.getCurrentQuantity() <= pillsReorderLevel.getReorderLevel()){
				String message = "Pills in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
						" has passed its minimum stock level. Please refill inventory! Current pills quantity is : "+pillsStockDetail.getCurrentQuantity();
				ItemReorderReminder reminder = new ItemReorderReminder(stock.getId(),"PILLS",message,sentDate,"Unchecked");
				reminder.addItemReorderReminder();
				if(pillsStockDetail.getCurrentQuantity() <= pillsReorderLevel.getEmergencyReorderLevel()){
					message = "Pills in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
							" has passed its emergency stock level. Please refill inventory! Current pills quantity is : "+pillsStockDetail.getCurrentQuantity();
					reminder = new ItemReorderReminder(stock.getId(),"PILLS",message,sentDate,"Unchecked");
					reminder.addItemReorderReminder();
				}
			}
		}
		
		if(injectableReorderLevel != null){
			if(injectableStockDetail.getCurrentQuantity() <= injectableReorderLevel.getReorderLevel()){
				String message = "Injectable in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
						" has passed its minimum stock level. Please refill inventory! Current injectable quantity is : "+injectableStockDetail.getCurrentQuantity();
				ItemReorderReminder reminder = new ItemReorderReminder(stock.getId(),"INJECTABLE",message,sentDate,"Unchecked");
				reminder.addItemReorderReminder();
				if(injectableStockDetail.getCurrentQuantity() <= injectableReorderLevel.getEmergencyReorderLevel()){
					message = "Injectable in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
							" has passed its emergency stock level. Please refill inventory! Current injectable quantity is : "+injectableStockDetail.getCurrentQuantity();
					reminder = new ItemReorderReminder(stock.getId(),"INJECTABLE",message,sentDate,"Unchecked");
					reminder.addItemReorderReminder();
				}
			}
		}
		
		if(implantReorderLevel != null){
			if(implantStockDetail.getCurrentQuantity() <= implantReorderLevel.getReorderLevel()){
				String message = "Implant in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
						" has passed its minimum stock level. Please refill inventory! Current implant quantity is : "+implantStockDetail.getCurrentQuantity();
				ItemReorderReminder reminder = new ItemReorderReminder(stock.getId(),"IMPLANT",message,sentDate,"Unchecked");
				reminder.addItemReorderReminder();
				if(condomStockDetail.getCurrentQuantity() <= condomReorderLevel.getEmergencyReorderLevel()){
					message = "Implant in stock "+stock.getStockName()+" of Health post: "+healthPost.getHealthPostName()+
							" has passed its emergency stock level. Please refill inventory! Current implant quantity is : "+implantStockDetail.getCurrentQuantity();
					reminder = new ItemReorderReminder(stock.getId(),"IMPLANT",message,sentDate,"Unchecked");
					reminder.addItemReorderReminder();
				}
			}
		}
		
	}//end while loop
%>