<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.Blob" %>
<%@page import="javax.sql.rowset.serial.SerialBlob" %>

<%
	//now instade of reading the parameter values from the Ajax call, do it the	
	//usual way, i.e, reading it directly from the caller .jsp file!!
	//get the form values from the caller jsp file!!!!!!!
	String optionalFileName = "";
    String fileName = "";
    String status = "";

    FileItem fileItem = null;
	String itemName = null;
    

    String title = null;
	String description = null;
	Date dateUploaded = null;
	
	byte[] byteArray = null;
	Blob blob = null;
	File fileToSend = null;
	FileInputStream fis = null;	
	String location = null;	
    
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
	if (!isMultipart){
		out.print("Form is not multipart!");
		
	} else {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if (item.isFormField()) {
				String name = item.getFieldName();
				//String value = item.getString();
				if (name.equals("txttitle")) {
					title = item.getString();					
				}
				if (name.equals("txtdateuploaded")) {
					dateUploaded = Date.valueOf(item.getString());					
				}
				if (name.equals("textareadescription")) {
					description = item.getString();					
				}				
			} else {
				try {
					itemName = item.getName();
					if(itemName != ""){//if the user added a new picture					
						File savedFile = new File(config.getServletContext().getRealPath("/")
								+ "/downloads_item/" + itemName);						
						item.write(savedFile);
						fis = new FileInputStream(savedFile);
						System.out.println(fis);
						System.out.println("location is : "+savedFile.getAbsolutePath());
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}//end while loop
		
		Downloads downloads = new Downloads(title, dateUploaded, description,fis);
		downloads.addDownloads();	
		
	}//end bigger else body!!    
%>
<%@include file="userhome.jsp" %>




