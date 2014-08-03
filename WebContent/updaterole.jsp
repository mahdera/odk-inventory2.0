<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
    int roleIdPara = Integer.parseInt(request.getParameter("roleId"));
    int accountIdPara = Integer.parseInt(request.getParameter("accountId"));
    int functionalityId = Integer.parseInt(request.getParameter("functionalityId"));
    boolean hasReadAccess = Boolean.parseBoolean(request.getParameter("hasReadAccess"));
    boolean hasWriteAccess = Boolean.parseBoolean(request.getParameter("hasWriteAccess"));
    boolean hasUpdateAccess = Boolean.parseBoolean(request.getParameter("hasUpdateAccess"));
    boolean hasDeleteAccess = Boolean.parseBoolean(request.getParameter("hasDeleteAccess"));

    ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
    
    Role roleUpdate = (Role) appContext.getBean("role");
    roleUpdate.setId(roleIdPara);
    roleUpdate.setAccountId(accountIdPara);
    roleUpdate.setReadable(hasReadAccess);
    roleUpdate.setWritable(hasWriteAccess);
    roleUpdate.setUpdateable(hasUpdateAccess);
    roleUpdate.setDeletable(hasDeleteAccess);
    roleUpdate.setFunctionalityId(functionalityId);
    	
    Role.updateRole(roleUpdate);
%>
<p class="msg done">Role Updated!</p>