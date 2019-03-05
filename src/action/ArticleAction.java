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
import entity.Article;

public class ArticleAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond; 
	private String name; 
	private Article article;
	
	private List<Map<String, Object>> articleList = new ArrayList<Map<String, Object>>();
	
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

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public List<Map<String, Object>> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<Map<String, Object>> articleList) {
		this.articleList = articleList;
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

	
	public String createArticle() {
		return SUCCESS;
	}

	public String addArticle() { 
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
			this.article.setImage("upfiles/" + this.getImageFileName());
		}
		this.article.setAddtime(CommonUtil.getTime());
		String sql = "insert into article( articleid , title , image , comments , addtime) values( ? ,  ? ,  ? ,  ? ,  ? )"; // 插入SQL语句
		Object param[] = { CommonUtil.getStringID("A"), article.getTitle(), article.getImage(), article.getComments(),
				article.getAddtime() }; 
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deleteArticle() {
		String sql = "delete from article where articleid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql); 
	
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String updateArticle() {
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
			this.article.setImage("upfiles/" + this.getImageFileName());
		} else {
			String sql = "select a.*  from article a  where 1=1  and a.articleid = ? ";
			Object param[] = { this.article.getArticleid() }; 
			
			List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
			Map<String, Object> m = list.get(0);
			this.article.setImage("" + m.get("image"));
		}
		String sql = "update article set title = ? , image = ? , comments = ? , addtime = ? where articleid = ?"; 
		Object param[] = { article.getTitle(), article.getImage(), article.getComments(), article.getAddtime(),
				article.getArticleid() }; 
		System.out.println(sql);
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllArticle() {
		String sql = "select a.*  from article a  where 1=1  order by articleid desc ";
		System.out.println(sql); 
		
		this.articleList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

	public String getArticleById() { 
		String sql = "select a.*  from article a  where 1=1  and a.articleid = ? ";
		Object param[] = { this.id }; 
	
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
		
		Map<String, Object> m = list.get(0);
		this.map.put("article", m);
		return SUCCESS;
	}

}
