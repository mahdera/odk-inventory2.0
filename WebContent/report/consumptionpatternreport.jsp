<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.*" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.io.*"%>
<%
	//String username = request.getParameter("txtusername");
	String localUsername = request.getParameter("txtusername");
	//now get _uri from _registered_users table of odk software...
	RegisteredUsers registeredUsers = RegisteredUsers.getRegisteredUserUsingLocalUsername(localUsername);
	String username = registeredUsers.get_URI();
	
	Date fromDate = Date.valueOf(request.getParameter("txtfromdate"));
	Date toDate = Date.valueOf(request.getParameter("txttodate"));
	//now using the username, try to get the usertype and the health posts found under this user
	//first fetch from the tbl_relate_odk_user_with_inventory_user
	String reportXMLHeader = "<Report DateFrom='"+fromDate+"' DateTo='"+toDate+"'>";
	RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserUsingODKUsername(username);
	if(relatedUser != null){
		int invUserId = relatedUser.getUserId();
		User inventoryUser = User.getUser(invUserId);
		if(inventoryUser.getUserType().equalsIgnoreCase("HEW Supervisor")){
			System.out.println("got here mahder...");
			//now find all the health posts managed under this HEW Supervisor...
			//first i need to find all the health centers by this hew supervisor...
			String fileName = "stockSummaryReport"+inventoryUser.getId()+"_"+fromDate+"_"+toDate+".xml";
			File reportFile = new File(application.getRealPath("/")+ "report/"+fileName);
			if(reportFile.exists())
				reportFile.delete();		
			
			boolean fileCreated = reportFile.createNewFile();
			
			if(fileCreated)
				System.out.println("File created");
			else
				System.out.println("No file created");
			
			reportFile.setExecutable(true);
			reportFile.setWritable(true);
			
			
			FileWriter fileWriter = new FileWriter(reportFile);
			PrintWriter printWriter = new PrintWriter(fileWriter);
			System.out.println("the file info is : "+reportFile.getAbsolutePath());
			NurseManagesHealthCenter hewSupervisorManagesHealthCenter = NurseManagesHealthCenter.getNurseManagesHealthCenterForThisUser(inventoryUser.getId());
			if(hewSupervisorManagesHealthCenter != null){			
				HealthCenter healthCenter = HealthCenter.getHealthCenter(hewSupervisorManagesHealthCenter.getHealthCenterId());
				//System.out.println(healthCenter.getHealthCenterName());
				//now get all health posts under this health centers
				List<HealthPost> healthPostList = HealthPost.getAllHealthPostsUnderThisHealthCenter(healthCenter.getId());
				List<HealthPost> healthPostsInThisHealthCenterList = healthPostList;
				if(!healthPostList.isEmpty()){
					try{								
						printWriter.println("<Reports>");
						System.out.println("<Reports>");
						printWriter.println("<CurrentStockStatus>");
						System.out.println("<CurrentStockStatus>");
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							//first get the stock for this health post
							HealthPost healthPost = healthPostItr.next();
							HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
							if(hewManagesHealthPost != null){
								User user = User.getUser(hewManagesHealthPost.getUserId());
								RelateODKUserWithInventoryUser userRelated = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(user.getId());
								if(userRelated != null){
									String creatorUser = userRelated.get_uri();
									//System.out.println(healthPost.getHealthPostName());
									//Stock stock = Stock.getStock(healthPost.getId());
									float condomTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("CONDOM_AMOUNT",creatorUser);
									float pillsTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("PILLS_AMOUNT",creatorUser);
									float injectableTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("INJECTABLE_AMOUNT",creatorUser);
									float implantTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("IMPLANT_AMOUNT",creatorUser);
									/////now get the total issued quantity for 
									float condomTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("CONDOM_AMOUNT",creatorUser);
									float pillsTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("PILLS_AMOUNT",creatorUser);
									float injectableTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("INJECTABLE_AMOUNT",creatorUser);
									float implantTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("IMPLANT_AMOUNT",creatorUser);
									//now use the formula to calculate the currrent quantity of each item for this particular user
									
									float condomCurrentQuantity = condomTotalReceivedQuantity - condomTotalIssuedQuantity;
									float pillsCurrentQuantity = pillsTotalReceivedQuantity - pillsTotalIssuedQuantity;
									float injectableCurrentQuantity = injectableTotalReceivedQuantity - injectableTotalIssuedQuantity;
									float implantCurrentQuantity = implantTotalReceivedQuantity - implantTotalIssuedQuantity;
									//first get the current stock status for this health post							
									
									printWriter.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'  CONDOM='"+condomCurrentQuantity+"' IMPLANT='"+implantCurrentQuantity+"' INJECTABLE='"+injectableCurrentQuantity+"' PILLS='"+pillsCurrentQuantity+"'/>");
									System.out.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'  CONDOM='"+condomCurrentQuantity+"' IMPLANT='"+implantCurrentQuantity+"' INJECTABLE='"+injectableCurrentQuantity+"' PILLS='"+pillsCurrentQuantity+"'/>");
								}//end if userRelated....
							}
						}//end while loop
						printWriter.println("</CurrentStockStatus>");
						System.out.println("</CurrentStockStatus>");
						Iterator<HealthPost> healthPostsInThisHealthCenterItr = healthPostsInThisHealthCenterList.iterator();
							printWriter.println("<Report DateFrom='"+fromDate+"' DateTo='"+toDate+"'>");								
								while(healthPostsInThisHealthCenterItr.hasNext()){
									HealthPost hPost = healthPostsInThisHealthCenterItr.next();
									HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostsForThisHealthPost(hPost.getId());
									if(hewManagesHealthPost != null){
										User user = User.getUser(hewManagesHealthPost.getUserId());
										RelateODKUserWithInventoryUser userRelated = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(user.getId());
										if(userRelated != null){
											String creatorUser = userRelated.get_uri();
											float condomReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"CONDOM_AMOUNT",fromDate,toDate);
											float pillsReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"PILLS_AMOUNT",fromDate,toDate);
											float injectableReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"INJECTABLE_AMOUNT",fromDate,toDate);
											float implantReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"IMPLANT_AMOUNT",fromDate,toDate);
											/////////below is for the issued qty...
											float condomIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"CONDOM_AMOUNT",fromDate,toDate);
											float pillsIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"PILLS_AMOUNT",fromDate,toDate);
											float injectableIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"INJECTABLE_AMOUNT",fromDate,toDate);
											float implantIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"IMPLANT_AMOUNT",fromDate,toDate);
											/////////below is code for item lost or damaged...
											float condomLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"CONDOM_AMOUNT",fromDate,toDate);
											float pillsLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"PILLS_AMOUNT",fromDate,toDate);
											float injectableLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"INJECTABLE_AMOUNT",fromDate,toDate);
											float implantLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(creatorUser,"IMPLANT_AMOUNT",fromDate,toDate);
											
											printWriter.println("<HealthPost Name='"+hPost.getHealthPostName()+"'>");
												printWriter.println("<Item Name='Condom' Received='"+condomReceivedQuantity+"' Issued='"+condomIssuedQuantity+"' LostDamaged='"+condomLostDamagedQuantity+"'/>");
												printWriter.println("<Item Name='Pills' Received='"+pillsReceivedQuantity+"' Issued='"+pillsIssuedQuantity+"' LostDamaged='"+pillsLostDamagedQuantity+"'/>");
												printWriter.println("<Item Name='Implant' Received='"+implantReceivedQuantity+"' Issued='"+implantIssuedQuantity+"' LostDamaged='"+injectableLostDamagedQuantity+"'/>");
												printWriter.println("<Item Name='Injectable' Received='"+injectableReceivedQuantity+"' Issued='"+injectableIssuedQuantity+"' LostDamaged='"+implantLostDamagedQuantity+"'/>");
											printWriter.println("</HealthPost>");
										}//end if userRelated
									}//end if hewManagesHealthPost
								}//end while loop
							printWriter.println("</Report>");
							
						printWriter.println("</Reports>");
						System.out.println("</Reports>");
						printWriter.flush();
						printWriter.close();
						///now read the contents of the xml file to the jsp
						////////////////////here i need to display the content of the xml file
						FileReader fileReader  = new FileReader(reportFile);					
						BufferedReader bufReader = new BufferedReader(fileReader);
						String line = null;
						StringBuffer buffer = new StringBuffer();
						//OutputStream o = response.getOutputStream();
						response.setContentType("application/text");					
						while((line = bufReader.readLine()) != null){
							out.println(line);
							System.out.println("mac : "+line);
						}//end while loop
						response.flushBuffer();		
						bufReader.close();						
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						//printWriter.flush();
						printWriter.close();						
					}
				}else{
					%>
					<p class="msg info">This health center has no health posts under it!</p>
					<%
				}
			}else{
				%>
				<p class="msg info">You do not manage any health center!</p>
				<%
			}
		}else if(inventoryUser.getUserType().equalsIgnoreCase("HEW")){
			///////////////////start here//////////////////////
			PrintWriter printWriter = null;
			try{	
				String fileName = "stockSummaryReport"+inventoryUser.getId()+"_"+fromDate+"_"+toDate+".xml";
				File reportFile = new File(application.getRealPath("/")+ "report/"+fileName);
				if(reportFile.exists())
					reportFile.delete();		
				
				boolean fileCreated = reportFile.createNewFile();
				
				if(fileCreated)
					System.out.println("File created");
				else
					System.out.println("No file created");
				
				reportFile.setExecutable(true);
				reportFile.setWritable(true);
				
				
				FileWriter fileWriter = new FileWriter(reportFile);
				printWriter = new PrintWriter(fileWriter);
				
				printWriter.println("<Reports>");
				System.out.println("<Reports>");
				printWriter.println("<CurrentStockStatus>");
				System.out.println("<CurrentStockStatus>");
				//Iterator<HealthPost> healthPostItr = healthPostList.iterator();
				HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostForThisUser(relatedUser.getUserId());
				HealthPost healthPost = HealthPost.getHealthPost(hewManagesHealthPost.getHealthPostId());
				if(healthPost != null){
					//first get the stock for this health post					
					//System.out.println(healthPost.getHealthPostName());
					//HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
					Stock stock = Stock.getStock(healthPost.getId());
					//first get the current stock status for this health post
					//current item quantity is calculated as the difference b/n the sum of all received item minus the sum of issued item
					//so first i need to get the sum of all received item for this particular item...
					float condomTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("CONDOM_AMOUNT",relatedUser.get_uri());
					float pillsTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("PILLS_AMOUNT",relatedUser.get_uri());
					float injectableTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("INJECTABLE_AMOUNT",relatedUser.get_uri());
					float implantTotalReceivedQuantity = GRV.getTheTotalReceivedQuantityForThisItemByThisCreatorUser("IMPLANT_AMOUNT",relatedUser.get_uri());
					/////now get the total issued quantity for 
					float condomTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("CONDOM_AMOUNT",relatedUser.get_uri());
					float pillsTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("PILLS_AMOUNT",relatedUser.get_uri());
					float injectableTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("INJECTABLE_AMOUNT",relatedUser.get_uri());
					float implantTotalIssuedQuantity = GIV.getTheTotalIssuedQuantityForThisItemByThisCreatorUser("IMPLANT_AMOUNT",relatedUser.get_uri());
					//now use the formula to calculate the currrent quantity of each item for this particular user
					
					float condomCurrentQuantity = condomTotalReceivedQuantity - condomTotalIssuedQuantity;
					float pillsCurrentQuantity = pillsTotalReceivedQuantity - pillsTotalIssuedQuantity;
					float injectableCurrentQuantity = injectableTotalReceivedQuantity - injectableTotalIssuedQuantity;
					float implantCurrentQuantity = implantTotalReceivedQuantity - implantTotalIssuedQuantity;
					
					printWriter.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'  CONDOM='"+condomCurrentQuantity+"' IMPLANT='"+implantCurrentQuantity+"' INJECTABLE='"+injectableCurrentQuantity+"' PILLS='"+pillsCurrentQuantity+"'/>");
					System.out.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'  CONDOM='"+condomCurrentQuantity+"' IMPLANT='"+implantCurrentQuantity+"' INJECTABLE='"+injectableCurrentQuantity+"' PILLS='"+pillsCurrentQuantity+"'/>");
				}//end while loop
				printWriter.println("</CurrentStockStatus>");
				System.out.println("</CurrentStockStatus>");
				//Iterator<HealthPost> healthPostsInThisHealthCenterItr = healthPostsInThisHealthCenterList.iterator();
					printWriter.println("<Report DateFrom='"+fromDate+"' DateTo='"+toDate+"'>");								
						if(healthPost != null){
							//HealthPost hPost = healthPostsInThisHealthCenterItr.next();
							float condomReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"CONDOM_AMOUNT",fromDate,toDate);
							float pillsReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"PILLS_AMOUNT",fromDate,toDate);
							float injectableReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"INJECTABLE_AMOUNT",fromDate,toDate);
							float implantReceivedQuantity = GRV.getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"IMPLANT_AMOUNT",fromDate,toDate);
							/////////below is for the issued qty...
							float condomIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"CONDOM_AMOUNT",fromDate,toDate);
							float pillsIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"PILLS_AMOUNT",fromDate,toDate);
							float injectableIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"INJECTABLE_AMOUNT",fromDate,toDate);
							float implantIssuedQuantity = GIV.getItemIssuedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"IMPLANT_AMOUNT",fromDate,toDate);
							/////////below is code for item lost or damaged...
							float condomLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"CONDOM_AMOUNT",fromDate,toDate);
							float pillsLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"PILLS_AMOUNT",fromDate,toDate);
							float injectableLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"INJECTABLE_AMOUNT",fromDate,toDate);
							float implantLostDamagedQuantity = LostDamaged.getLostDamagedQuantityForThis_URIAndThisItemDuringThisPeriod(username,"IMPLANT_AMOUNT",fromDate,toDate);
							
							printWriter.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'>");
								printWriter.println("<Item Name='Condom' Received='"+condomReceivedQuantity+"' Issued='"+condomIssuedQuantity+"' LostDamaged='"+condomLostDamagedQuantity+"'/>");
								printWriter.println("<Item Name='Pills' Received='"+pillsReceivedQuantity+"' Issued='"+pillsIssuedQuantity+"' LostDamaged='"+pillsLostDamagedQuantity+"'/>");
								printWriter.println("<Item Name='Implant' Received='"+implantReceivedQuantity+"' Issued='"+implantIssuedQuantity+"' LostDamaged='"+injectableLostDamagedQuantity+"'/>");
								printWriter.println("<Item Name='Injectable' Received='"+injectableReceivedQuantity+"' Issued='"+injectableIssuedQuantity+"' LostDamaged='"+implantLostDamagedQuantity+"'/>");
							printWriter.println("</HealthPost>");
						}//end while loop
					printWriter.println("</Report>");
					
				printWriter.println("</Reports>");
				System.out.println("</Reports>");
				printWriter.flush();
				printWriter.close();
				///now read the contents of the xml file to the jsp
				////////////////////here i need to display the content of the xml file
				FileReader fileReader  = new FileReader(reportFile);					
				BufferedReader bufReader = new BufferedReader(fileReader);
				String line = null;
				StringBuffer buffer = new StringBuffer();
				//OutputStream o = response.getOutputStream();
				response.setContentType("application/text");					
				while((line = bufReader.readLine()) != null){
					out.println(line);
					System.out.println("mac : "+line);
				}//end while loop
				response.flushBuffer();		
				bufReader.close();						
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//printWriter.flush();
				printWriter.close();						
			}
			///////////////////end here/////////////////////////
		}
	}else{
		%>
		<p class="msg error">This ODK user is not related to inventory user</p>
		<%
	}
%>
