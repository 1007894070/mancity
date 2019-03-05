package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import comm.CommonUtil;
import dao.BaseDao;
import entity.Sorts;

public class SortsAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond; 
	private String name; 
	private Sorts sorts;
	
	private List<Map<String, Object>> sortsList = new ArrayList<Map<String, Object>>();
	
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

	public Sorts getSorts() {
		return sorts;
	}

	public void setSorts(Sorts sorts) {
		this.sorts = sorts;
	}

	public List<Map<String, Object>> getSortsList() {
		return sortsList;
	}

	public void setSortsList(List<Map<String, Object>> sortsList) {
		this.sortsList = sortsList;
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

	
	public String createSorts() {
		return SUCCESS;
	}

	public String addSorts() {
		this.sorts.setAddtime(CommonUtil.getTime());
		String sql = "insert into sorts( sortsid , sortsname , memo , addtime) values( ? ,  ? ,  ? ,  ? )"; 
		Object param[] = { CommonUtil.getStringID("S"), sorts.getSortsname(), sorts.getMemo(), sorts.getAddtime() };
		System.out.println(sql); 
	
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deleteSorts() {
		String sql = "delete from sorts where sortsid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String updateSorts() {
		String sql = "update sorts set sortsname = ? , memo = ? , addtime = ? where sortsid = ?";
		Object param[] = { sorts.getSortsname(), sorts.getMemo(), sorts.getAddtime(), sorts.getSortsid() };
		System.out.println(sql); 
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllSorts() {
		String sql = "select a.*  from sorts a  where 1=1  order by sortsid desc ";
		System.out.println(sql); 
		
		this.sortsList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

	public String getSortsById() { 
		String sql = "select a.*  from sorts a  where 1=1  and a.sortsid = ? ";
		Object param[] = { this.id }; 
		
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
		
		Map<String, Object> m = list.get(0);
		this.map.put("sorts", m);
		return SUCCESS;
	}

}
