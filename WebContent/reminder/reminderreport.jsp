<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%
	String localUsername = request.getParameter("txtusername");
	//now get _uri from _registered_users table of odk software...
	RegisteredUsers registeredUsers = RegisteredUsers.getRegisteredUserUsingLocalUsername(localUsername);
	
	if(registeredUsers != null){
		String username = registeredUsers.get_URI();
		
		java.util.Date d = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String currentDate = dateFormat.format(cal.getTime());
		System.out.println(currentDate);
		java.sql.Date sentDate = java.sql.Date.valueOf(currentDate);
		
		RelateODKUserWithInventoryUser relatedUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserUsingODKUsername(username);
		if(relatedUser != null){
			int invUserId = relatedUser.getUserId();
			User inventoryUser = User.getUser(invUserId);
			if(inventoryUser.getUserType().equalsIgnoreCase("HEW Supervisor")){
				System.out.println("got here mahder...");
				//now find all the health posts managed under this HEW Supervisor...
				//first i need to find all the health centers by this hew supervisor...
				String fileName = "reminderReport"+inventoryUser.getId()+".xml";
				File reportFile = new File(application.getRealPath("/")+ "reminder/"+fileName);
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
						//first get all stocks in the database...					
						
						
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						try{
							printWriter.println("<ReminderReport>");
							while(healthPostItr.hasNext()){							
								HealthPost healthPost = healthPostItr.next();
								Stock stock = Stock.getStockOfThisHealthPost(healthPost.getId());
								HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostsForThisHealthPost(healthPost.getId());
								if(hewManagesHealthPost != null){
									User user = User.getUser(hewManagesHealthPost.getUserId());
									RelateODKUserWithInventoryUser userRelated = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserForInventoryUser(user.getId());
									if(userRelated != null){
										String creatorUser = userRelated.get_uri();
										
										printWriter.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'>");
										//next find the stock of this particular health post...
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
										//now get the item reorder level of this particular stock item
										ItemReorderLevel condomReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "CONDOM");
										ItemReorderLevel pillsReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "PILLS");
										ItemReorderLevel injectableReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "INJECTABLE");
										ItemReorderLevel implantReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "IMPLANT");
										//now check if the reorder levels are below the limit define for this particular health post
										if(condomReorderLevel != null){
											if(condomCurrentQuantity <= condomReorderLevel.getReorderLevel()){											
												printWriter.println("<Item Name='Condom' ReorderLevel='"+condomReorderLevel.getReorderLevel()+"' CurrentQuantity='"+condomCurrentQuantity+"'/>");												
											}
										}
										
										if(pillsReorderLevel != null){
											if(pillsCurrentQuantity <= pillsReorderLevel.getReorderLevel()){											
													printWriter.println("<Item Name='Pills' ReorderLevel='"+pillsReorderLevel.getReorderLevel()+"' CurrentQuantity='"+pillsCurrentQuantity+"'/>");
											}
										}
										
										if(injectableReorderLevel != null){
											if(injectableCurrentQuantity <= injectableReorderLevel.getReorderLevel()){
												
													printWriter.println("<Item Name='Injectable' ReorderLevel='"+injectableReorderLevel.getReorderLevel()+"' CurrentQuantity='"+injectableCurrentQuantity+"'/>");
												
											}
										}
										
										if(implantReorderLevel != null){
											if(implantCurrentQuantity <= implantReorderLevel.getReorderLevel()){
												
													printWriter.println("<Item Name='Implant' ReorderLevel='"+implantReorderLevel.getReorderLevel()+"' CurrentQuantity='"+implantCurrentQuantity+"'/>");
												
											}
										}	
									}//end if userRelated != null
								}//end if hewManagesHealthPost != null
								printWriter.println("</HealthPost>");
							}//end while loop
							printWriter.println("</ReminderReport>");
							printWriter.flush();
							////display content to jsp file/text file
							FileReader fileReader  = new FileReader(reportFile);					
							BufferedReader bufReader = new BufferedReader(fileReader);
							String line = null;
							StringBuffer buffer = new StringBuffer();
							//OutputStream o = response.getOutputStream();
							response.setContentType("application/text");					
							while((line = bufReader.readLine()) != null){
								out.println(line);
							}//end while loop
							response.flushBuffer();		
							bufReader.close();
						}catch(Exception e){
							e.printStackTrace();
						}finally{
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
				//if this reminder is called by the HEW
				String fileName = "reminderReport"+inventoryUser.getId()+".xml";
				File reportFile = new File(application.getRealPath("/")+ "reminder/"+fileName);
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
					
					///find the health post associated with this health extension worker...
					RelateODKUserWithInventoryUser relatedODKUser = RelateODKUserWithInventoryUser.getRelateODKUserWithInventoryUserUsingODKUsername(username);
					if(relatedODKUser != null){
						int userId = relatedODKUser.getUserId();
						String creatorUser = relatedODKUser.get_uri();
						HEWManagesHealthPost hewManagesHealthPost = HEWManagesHealthPost.getHEWManagesHealthPostForThisUser(userId);
						if(hewManagesHealthPost != null){
							HealthPost healthPost = HealthPost.getHealthPost(hewManagesHealthPost.getHealthPostId());
							Stock stock = Stock.getStockOfThisHealthPost(healthPost.getId());
							if(healthPost != null){								
								printWriter.println("<ReminderReport>");
								printWriter.println("<HealthPost Name='"+healthPost.getHealthPostName()+"'>");
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
								//now get the item reorder level of this particular stock item
								ItemReorderLevel condomReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "CONDOM");
								ItemReorderLevel pillsReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "PILLS");
								ItemReorderLevel injectableReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "INJECTABLE");
								ItemReorderLevel implantReorderLevel = ItemReorderLevel.getItemReorderLevelForThisStockAndItem((int)stock.getId(), "IMPLANT");
								//now check if the reorder levels are below the limit define for this particular health post
								if(condomReorderLevel != null){
									if(condomCurrentQuantity <= condomReorderLevel.getReorderLevel()){
										
												printWriter.println("<Item Name='Condom' ReorderLevel='"+condomReorderLevel.getReorderLevel()+"' CurrentQuantity='"+condomCurrentQuantity+"'/>");
										
									}
								}
								
								if(pillsReorderLevel != null){
									if(pillsCurrentQuantity <= pillsReorderLevel.getReorderLevel()){
										
											printWriter.println("<Item Name='Pills' ReorderLevel='"+pillsReorderLevel.getReorderLevel()+"' CurrentQuantity='"+pillsCurrentQuantity+"'/>");
										
									}
								}
								
								if(injectableReorderLevel != null){
									if(injectableCurrentQuantity <= injectableReorderLevel.getReorderLevel()){
										
											printWriter.println("<Item Name='Injectable' ReorderLevel='"+injectableReorderLevel.getReorderLevel()+"' CurrentQuantity='"+injectableCurrentQuantity+"'/>");
										
									}
								}
								
								if(implantReorderLevel != null){
									if(implantCurrentQuantity <= implantReorderLevel.getReorderLevel()){
										
											printWriter.println("<Item Name='Implant' ReorderLevel='"+implantReorderLevel.getReorderLevel()+"' CurrentQuantity='"+implantCurrentQuantity+"'/>");
										
									}
								}	
								printWriter.println("</HealthPost>");
							
								printWriter.println("</ReminderReport>");
								printWriter.flush();
								////////////////////here i need to display the content of the xml file
								FileReader fileReader  = new FileReader(reportFile);					
								BufferedReader bufReader = new BufferedReader(fileReader);
								String line = null;
								StringBuffer buffer = new StringBuffer();
								//OutputStream o = response.getOutputStream();
								response.setContentType("application/text");					
								while((line = bufReader.readLine()) != null){
									out.println(line);
								}//end while loop
								response.flushBuffer();		
								bufReader.close();	
							}//end if hewManagesHealthPost
						}//if relatedODKUser != null
				}else{
					%>
					<p class="msg error">This user is not associated with any health post in the database!/p>
					<%
				}
			}
		}else{
			%>
			<p class="msg error">This ODK user is not related to inventory user</p>
			<%
		}
	}else{
		%>
		<p class="msg error">No such user with the entered local username!</p>
		<%
	}
%>

