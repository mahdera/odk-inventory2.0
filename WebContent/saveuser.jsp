<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	//int branchId = Integer.parseInt(request.getParameter("branchId"));
	String firstName = request.getParameter("firstName");
	String middleName = request.getParameter("middleName");
	String lastName = request.getParameter("lastName");
	String userType = request.getParameter("userType");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int healthInistituteId = Integer.parseInt(request.getParameter("healthInistituteId"));
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	
	User user = (User) appContext.getBean("user");
	user.setFirstName(firstName);
	user.setMiddleName(middleName);
	user.setLastName(lastName);
	user.setUserType(userType);
	
	user.addUser();
	
	User fetchedUser = User.getUserWith(firstName,middleName,lastName,userType);
	Account account = (Account) appContext.getBean("account");
	account.setUserId(fetchedUser.getId());
	account.setUsername(username);
	account.setPassword(password);
	
	account.addAccount();
	int getMaxRecentAccount = Account.getMaxAccountIdValue();
	Role.createBlankRoleUponUserCreation(getMaxRecentAccount);
	//now save the hewmanages health post information to the database...
	if(userType.equalsIgnoreCase("HEW")){
		HEWManagesHealthPost hewManagesHealthPost = (HEWManagesHealthPost) appContext.getBean("hewManagesHealthPost");
		hewManagesHealthPost.setUserId(fetchedUser.getId());
		hewManagesHealthPost.setHealthPostId(healthInistituteId);		
		hewManagesHealthPost.addHEWManagesHealthPost();
	}else if(userType.equalsIgnoreCase("HEW Supervisor")){
		NurseManagesHealthCenter nurseManagesHealthCenter = (NurseManagesHealthCenter) appContext.getBean("nurseManagesHealthCenter");
		nurseManagesHealthCenter.setUserId(fetchedUser.getId());
		nurseManagesHealthCenter.setHealthCenterId(healthInistituteId);		
		nurseManagesHealthCenter.addNurseManagesHealthCenter();
	}
%>
<p class="msg done">User saved successfully!</p>