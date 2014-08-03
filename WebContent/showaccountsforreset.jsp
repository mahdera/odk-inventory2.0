<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<form>
<%
	Account account = (Account) session.getAttribute("account");
	User user = User.getUser(account.getUserId());
	if(true){//user.getUserType().equals("Administrator")){
%>
<%
	List<User> userList = User.getAllUsers();
	Iterator<User> userItr = userList.iterator();
	
	out.print("<table width='100%'>");
		out.print("<tr>");
			out.print("<th>Ser.No</th>");
			out.print("<th>System User Name</th>");
			out.print("<th>Account created on</th>");
			out.print("<th>Member Type</th>");
			out.print("<th>Username</th>");
			out.print("<th>Reset</th>");
		out.print("</tr>");
		int ctr = 1;
		while(userItr.hasNext()){
			User u = userItr.next();
			Account acct = Account.getAccountForUser(u.getId());
			out.print("<tr>");
				out.print("<td>");
					out.print(ctr);
				out.print("</td>");
				out.print("<td>");
					out.print(u.getFirstName()+" "+u.getMiddleName()+" "+u.getLastName());
				out.print("</td>");
				out.print("<td>");
					out.print(acct.getAccountCreationDate());
				out.print("</td>");
				out.print("<td>");
					out.print(u.getUserType());
				out.print("</td>");
				out.print("<td>");
					out.print(acct.getUsername());
				out.print("</td>");
				out.print("<td>");
					%>
						<a href="#.jsp" onclick="showResetFormForThisAccount(<%=acct.getAccountId()%>);"><img src="design/reset.gif" border="0"/></a>
					<%
				out.print("</td>");
			out.print("</tr>");
			ctr++;
		}//end while loop
	out.print("</table>");
%>
<%
	}
	else{	
%>
	<p class="msg error">You do not have sufficient privileged to perform this operation!</p>
<%
	}
%>
<div id="accountResetDiv"></div>
</form>