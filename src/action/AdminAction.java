package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import comm.CommonUtil;
import dao.BaseDao;
import entity.Admin;

public class AdminAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond; 
	private String name; 
	private String username;
	private String password;
	private String repassword;
	private Admin admin;
	
	private List<Map<String, Object>> adminList = new ArrayList<Map<String, Object>>();
	
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

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Map<String, Object>> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Map<String, Object>> adminList) {
		this.adminList = adminList;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String login() {
		String sql = "select a.*  from admin a  where 1=1  and a.username = ? order by adminid desc ";
		Object param[] = { this.username };
		System.out.println(sql); 
		
		this.adminList = BaseDao.selectByParam(sql, param);
		if (this.adminList.size() == 0) {
			this.session.put("message", "用户名不存在");
			return "noLogin";
		} else {
			String pwd = (String) this.adminList.get(0).get("password");
			if (password.equals(pwd)) {
				this.session.put("adminid", (String) this.adminList.get(0).get("adminid"));
				this.session.put("adminname", this.username);
				return SUCCESS;
			} else {
				this.session.put("message", "密码错误");
				return "noLogin";
			}
		}
	}

	
	public String exit() {
		this.session.remove("adminid");
		this.session.remove("adminname");
		return "noLogin";
	}

	
	public String createAdmin() {
		return SUCCESS;
	}

	public String addAdmin() { 
		String sql = "insert into admin( adminid , username , password , realname) " + "values( ? ,  ? ,  ? ,  ? )"; // 插入SQL语句
		Object param[] = { CommonUtil.getStringID("A"), admin.getUsername(), admin.getPassword(), admin.getRealname() }; // 对应通配符'?'的数组
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deleteAdmin() {
		String sql = "delete from admin where adminid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllAdmin() {
		String sql = "select a.*  from admin a  where 1=1  order by adminid desc ";
		System.out.println(sql); 
		
		this.adminList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

}
