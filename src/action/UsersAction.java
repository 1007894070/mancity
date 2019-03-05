package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;
import entity.Users;

public class UsersAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond;
	private String name;
	private Users users;
	
	private List<Map<String, Object>> usersList = new ArrayList<Map<String, Object>>();
	
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

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public List<Map<String, Object>> getUsersList() {
		return usersList;
	}

	public void setUsersList(List<Map<String, Object>> usersList) {
		this.usersList = usersList;
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

	public String deleteUsers() {
		String sql = "delete from users where usersid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllUsers() {
		String sql = "select a.*  from users a  where 1=1  order by usersid desc ";
		System.out.println(sql); 
		
		this.usersList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

}
