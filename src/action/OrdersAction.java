package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;
import entity.Orders;

public class OrdersAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String id;
	private String cond; 
	private String name;
	private Orders orders;
	
	private List<Map<String, Object>> ordersList = new ArrayList<Map<String, Object>>();
	
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

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public List<Map<String, Object>> getOrdersList() {
		return ordersList;
	}

	public void setOrdersList(List<Map<String, Object>> ordersList) {
		this.ordersList = ordersList;
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

	public String deleteOrders() {
		String sql = "delete from orders where ordersid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql);
		
		if (BaseDao.updateByParam(sql, param)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	
	public String getAllOrders() {
		String sql = "select a.* , b.username  from orders a , users b  "
				+ "where 1=1 and a.usersid = b.usersid  order by ordersid desc ";
		System.out.println(sql); 
		
		this.ordersList = BaseDao.selectByParam(sql, null);
		return SUCCESS;
	}

}
