<%@page import="java.io.*" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>

<%
	long id = Long.parseLong(request.getParameter("id"));
	Downloads downloads = Downloads.getDownloads(id);
	byte[] byteArray = null;
	
	InputStream sImage = downloads.getIns();
	OutputStream o = response.getOutputStream();
	
	//System.out.println("inside showimage.jsp: "+sImage);
	int size = 0;
	//System.out.println("the size is available : "+sImage.available());
	
	if(sImage != null){
		try{
			System.out.println("inside try block of showimage.jsp mahder...");
			byteArray = new byte[sImage.available()];		
						response.reset();
			while((size = sImage.read(byteArray))!= -1 ){				
				o.write(byteArray,0,size);				
			}//end while loop
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			byteArray = null;
		}
	}else{
		// dont forget to put a no image available picture here!
		out.print("No item found!!");
	}
		
%>
