/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



/**
 * @author Mahder on macbook Pro
 * 
 */
public class Downloads {
	private long id;
	private String title;
	private Date dateUploaded;
	private String description;
	private FileInputStream fis;
	private InputStream ins;

	/**
	 * @param title
	 * @param dateUploaded
	 * @param description
	 * @param fis
	 */
	public Downloads(String title, Date dateUploaded, String description,
			FileInputStream fis) {
		this.title = title;
		this.dateUploaded = dateUploaded;
		this.description = description;
		this.fis = fis;
	}

	/**
	 * @param id
	 * @param title
	 * @param dateUploaded
	 * @param description
	 * @param ins
	 */
	public Downloads(long id, String title, Date dateUploaded,
			String description, InputStream ins) {
		this.id = id;
		this.title = title;
		this.dateUploaded = dateUploaded;
		this.description = description;
		this.ins = ins;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the dateUploaded
	 */
	public Date getDateUploaded() {
		return dateUploaded;
	}

	/**
	 * @param dateUploaded
	 *            the dateUploaded to set
	 */
	public void setDateUploaded(Date dateUploaded) {
		this.dateUploaded = dateUploaded;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the fis
	 */
	public FileInputStream getFis() {
		return fis;
	}

	/**
	 * @param fis
	 *            the fis to set
	 */
	public void setFis(FileInputStream fis) {
		this.fis = fis;
	}

	/**
	 * @return the ins
	 */
	public InputStream getIns() {
		return ins;
	}

	/**
	 * @param ins
	 *            the ins to set
	 */
	public void setIns(InputStream ins) {
		this.ins = ins;
	}

	public void addDownloads() {
		try {
			java.sql.Connection connection = DBConnection
					.getDatabaseConnection();
			java.sql.PreparedStatement pst = connection
					.prepareStatement("INSERT INTO tbl_downloads VALUES(?,?,?,?,?)");
			pst.setLong(1, 0);
			pst.setString(2, this.getTitle());
			pst.setDate(3, this.getDateUploaded());
			pst.setString(4, this.getDescription());		
			
			if(getFis() == null){				
				pst.setBinaryStream(5, (InputStream) null,(long) (0));
			}else
				pst.setBinaryStream(5, (InputStream) getFis(),(long) (getFis().available()));			
			
			int sucess = pst.executeUpdate();
			if (sucess != 0)
				System.out.println("hurray mahder");
			else
				System.out.println("shoke mahder");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}		
	}

	public static void updateDownloads(long id,String title,Date dateUploaded,
			String description,FileInputStream fis) {
		try {
			java.sql.Connection connection = DBConnection
					.getDatabaseConnection();
			java.sql.PreparedStatement pst = connection
					.prepareStatement("update tbl_downloads set title=?, date_uploaded=?,description=?,uploaded_item=? where id = ?");
			
			pst.setString(1, title);
			pst.setDate(2, dateUploaded);
			pst.setString(3, description);		
			
			if(fis == null){				
				//pst.setBinaryStream(4, (InputStream) null,(long) (0));
			}else
				pst.setBinaryStream(4, (InputStream) fis,(long) (fis.available()));			
			
			int sucess = pst.executeUpdate();
			if (sucess != 0)
				System.out.println("hurray mahder");
			else
				System.out.println("shoke mahder");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteDownloads(long id) {
		try {
			String command = "delete from tbl_downloads where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Downloads> getAllDownloads() {
		List<Downloads> list = new ArrayList<Downloads>();
		Downloads d = null;
		try {
			String query = "select * from tbl_downloads order by date_uploaded desc, title asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				d = new Downloads(rSet.getLong("id"), rSet.getString("title"), 
						rSet.getDate("date_uploaded"), rSet.getString("description"), 
						rSet.getBinaryStream("uploaded_item"));
				list.add(d);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Downloads getDownloads(long id) {
		Downloads d = null;
		try {
			String query = "select * from tbl_downloads where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				d = new Downloads(rSet.getLong("id"), rSet.getString("title"), 
						rSet.getDate("date_uploaded"), rSet.getString("description"), 
						rSet.getBinaryStream("uploaded_item"));				
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return d;
	}
}// end class
