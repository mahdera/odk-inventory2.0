<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>

<%
            String username = request.getParameter("txtusername");
            String password = request.getParameter("txtpassword");
                        
            Account account = Account.getAccount(username,password);
                        
            if (account != null)
            {
            		System.out.println(account);
                session.setMaxInactiveInterval(3600);                               
                session.setAttribute("account",account);
                
                System.out.println("there is an account mahder");
                %>
                		<script type="text/javascript">
	                		document.location.href = "userhome.jsp";
	                </script>
                <%
            }
            else
            {
%>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="<font color='red'><strong>Wrong username or password!<br/>Try again...</strong></font>"/>
                </jsp:forward>
<%
            }
%>