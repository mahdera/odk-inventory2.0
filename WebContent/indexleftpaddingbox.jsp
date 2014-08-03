<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>

<div class="padding box">

	<!-- Logo (Max. width = 200px) -->
	<p id="logo">
		
			<img src="images/favicon.ico" border="0"/>
		
	</p>
	
	<!-- Create a new project 
	<p id="btn-create" class="box">
		<a href="#.jsp">		
			<span>Create a new project</span>
		</a>		
	</p>-->

	<p class="box" >
		<form name="frmlogin" method="post" action="validateuser.jsp" onsubmit="return isLoginFormBlank(document.getElementById('txtusername').value,
				document.getElementById('txtpassword').value,document.getElementById('slctlanguage').value);">
				<fieldset>
					<legend><strong>User's Login</strong></legend>
					<table border="1" width="80%">
							<tr>
								<td colspan="2">
									<div id="loginErrorDiv" align="center" style="color:red">
										<%
											if (request.getParameter("msg") != null) {
												out.print(request.getParameter("msg"));
											}
										%>
									</div></td>
							</tr>
							<tr>
								<td style="width: 70px;">Username:</td>
								<td><input type="text" size="15" name="txtusername" id="txtusername" class="input-text"/>
								</td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="password" size="15" name="txtpassword" id="txtpassword" class="input-text" />
								</td>
							</tr>							
							<tr>
								<td></td>
								<td colspan="1" align="center">
									<input type="submit" value="Login"/>									
									<input type="reset"  value="Clear" />
								</td>
							</tr>
						</table>	
						</fieldset>				
					</form>
	</p>
	

</div>
<!-- /padding -->
