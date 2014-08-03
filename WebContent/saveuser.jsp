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
	
	//User user = new User(branchId,firstName,middleName,lastName,userType);
	User user = new User(firstName,middleName,lastName,userType);
	user.addUser();
	User fetchedUser = User.getUserWith(firstName,middleName,lastName,userType);
	Account account = new Account(fetchedUser.getId(),username,password);
	account.addAccount();
	int getMaxRecentAccount = Account.getMaxAccountIdValue();
	Role.createBlankRoleUponUserCreation(getMaxRecentAccount);
	//now save the hewmanages health post information to the database...
	if(userType.equalsIgnoreCase("HEW")){
		HEWManagesHealthPost hewManagesHealthPost = new HEWManagesHealthPost(fetchedUser.getId(),healthInistituteId);
		hewManagesHealthPost.addHEWManagesHealthPost();
	}else if(userType.equalsIgnoreCase("HEW Supervisor")){
		NurseManagesHealthCenter nurseManagesHealthCenter = new NurseManagesHealthCenter(fetchedUser.getId(),healthInistituteId);
		nurseManagesHealthCenter.addNurseManagesHealthCenter();
	}
%>
<p class="msg done">User saved successfully!</p>