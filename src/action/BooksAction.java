package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import comm.CommonUtil;
import dao.BaseDao;
import entity.Books;//导入Books类

public class BooksAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond; 
	private String name; 
	private Books books;
	
	private List<Map<String, Object>> booksList = new ArrayList<Map<String, Object>>();

	private Map<String, Object> map = new HashMap<String, Object>();
	private Map<String, Object> session;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Books getBooks() {
		return books;
	}

	public void setBooks(Books books) {
		this.books = books;
	}

	public List<Map<String, Object>> getBooksList() {
		return booksList;
	}

	public void setBooksList(List<Map<String, Object>> booksList) {
		this.booksList = booksList;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	private File image;
	private String imageContentType;
	private String imageFileName;

	private String getSavePath() throws Exception {
		return ServletActionContext.getServletContext().getRealPath("/upfiles");
	}

	private void close(FileOutputStream fos, FileInputStream fis) {
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {
				System.out.println("FileInputStream关闭失败");
				e.printStackTrace();
			}
		}
		if (fos != null) {
			try {
				fos.close();
			} catch (IOException e) {
				System.out.println("FileOutputStream关闭失败");
				e.printStackTrace();
			}
		}
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public String createBooks() {
		String sql = "select a.*  from sorts a  where 1=1  order by sortsid desc ";
		System.out.println(sql);
		
		List<Map<String, Object>> sortsList = BaseDao.selectByParam(sql, null);
		this.map.put("sortsList", sortsList);
		return SUCCESS;
	}

	public String addBooks() { 
		if (this.image != null) {
			FileOutputStream fos = null;
			FileInputStream fis = null;
			int i = getImageFileName().lastIndexOf(".");
			String name = String.valueOf(CommonUtil.getStringTime());
			String type = getImageFileName().substring(i + 1);
			this.setImageFileName(name + "." + type);
			try {
				
				fos = new FileOutputStream(getSavePath() + "\\" + getImageFileName());
			
				fis = new FileInputStream(this.getImage());
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
			} catch (Exception e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			} finally {
				close(fos, fis);
			}
			this.books.setImage("upfiles/" + this.getImageFileName());
		}
		String sql = "insert into books( booksid , booksname , sortsid , image , marketprice , price , special , recommend , author , publisher , comments) values( ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? )"; // 插入SQL语句
		Object param[] = { CommonUtil.getStringID("B"), books.getBooksname(), books.getSortsid(), books.getImage(),
				books.getMarketprice(), books.getPrice(), books.getSpecial(), books.getRecommend(), books.getAuthor(),
				books.getPublisher(), books.getComments() };
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deleteBooks() {
		String sql = "delete from books where booksid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql);
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String updateBooks() {
		if (this.image != null) {
			FileOutputStream fos = null;
			FileInputStream fis = null;
			int i = getImageFileName().lastIndexOf(".");
			String name = String.valueOf(CommonUtil.getStringTime());
			String type = getImageFileName().substring(i + 1);
			this.setImageFileName(name + "." + type);
			try {
				
				fos = new FileOutputStream(getSavePath() + "\\" + getImageFileName());
				
				fis = new FileInputStream(this.getImage());
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
			} catch (Exception e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			} finally {
				close(fos, fis);
			}
			this.books.setImage("upfiles/" + this.getImageFileName());
		} else {
			String sql = "select a.* , b.sortsname  from books a , sorts b  where 1=1 and a.sortsid = b.sortsid  and a.booksid = ? ";
			Object param[] = { this.books.getBooksid() };
			
			List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
			Map<String, Object> m = list.get(0);
			this.books.setImage("" + m.get("image"));
		}
		String sql = "update books set booksname = ? , sortsid = ? , image = ? , marketprice = ? , price = ? , special = ? , recommend = ? , author = ? , publisher = ? , comments = ? where booksid = ?"; 
		Object param[] = { books.getBooksname(), books.getSortsid(), books.getImage(), books.getMarketprice(),
				books.getPrice(), books.getSpecial(), books.getRecommend(), books.getAuthor(), books.getPublisher(),
				books.getComments(), books.getBooksid() }; 
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllBooks() {
		String sql = "select a.* , b.sortsname  from books a , sorts b  "
				+ "where 1=1 and a.sortsid = b.sortsid  order by booksid desc ";
		System.out.println(sql); 
		
		this.booksList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

	public String getBooksById() {
		String sql = "select a.* , b.sortsname  from books a , sorts b  where 1=1 and a.sortsid = b.sortsid  and a.booksid = ? ";
		Object param[] = { this.id }; 
		
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
		
		Map<String, Object> m = list.get(0);
		this.map.put("books", m);

		String sql1 = "select a.*  from sorts a  where 1=1  order by sortsid desc ";
		System.out.println(sql); 
	
		List<Map<String, Object>> sortsList = BaseDao.selectByParam(sql1, null);
		this.map.put("sortsList", sortsList);

		return SUCCESS;
	}

}
