package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import comm.CommonUtil;
import dao.BaseDao;
import entity.Cart;
import entity.Items;
import entity.Orders;
import entity.Sorts;
import entity.Users;

@SuppressWarnings("serial")
public class IndexAction extends ActionSupport implements SessionAware, RequestAware {

	private String id; 
	private String cond; 
	private String name; 
	private String msg;
	private String username;
	private String password;
	private String repassword;
	private String newpassword;
	private String title = "mancity";
	private Users users;
	private Cart cart;
	
	private Map<String, Object> map = new HashMap<String, Object>();
	private Map<String, Object> session;
	private Map<String, Object> request;

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

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public IndexAction() {
		String sql = "select a.*  from sorts a  where 1=1  order by sortsid desc ";
		System.out.println(sql); 
		
		List<Map<String, Object>> cateList = BaseDao.selectByParam(sql, null);
		this.map.put("cateList", cateList);
		
		String sql1 = "select rownum, a.* , b.sortsname  from books a , sorts b  "
				+ "where 1=1 and a.sortsid = b.sortsid and rownum < 6 order by booksid desc  ";
		System.out.println(sql); 
		
		List<Map<String, Object>> hotList = BaseDao.selectByParam(sql1, null);
		this.map.put("hotList", hotList);

	}

	public String index() {
		String sql = " select rownum , a.* from sorts a where rownum < 4 order by sortsid asc ";
		System.out.println(sql);
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, null);
		List<Sorts> frontList = new ArrayList<Sorts>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> m = list.get(i);
			Sorts sorts = new Sorts();
			sorts.setSortsid("" + m.get("sortsid"));
			sorts.setSortsname("" + m.get("sortsname"));
			String sql1 = "select rownum, a.* , b.sortsname  from books a , sorts b  "
					+ "where 1=1 and a.sortsid = b.sortsid and a.sortsid = ? and rownum < 6 order by booksid desc ";
			Object param1[] = { sorts.getSortsid() }; 
			System.out.println(sql1); 
			List<Map<String, Object>> booksList = BaseDao.selectByParam(sql1, param1);
			sorts.setBooksList(booksList);
			frontList.add(sorts);
		}
		this.map.put("frontList", frontList);
		String sql2 = "select a.*  from article a  where 1=1  order by articleid desc ";
		System.out.println(sql2); 
	
		List<Map<String, Object>> articleList = BaseDao.selectByParam(sql2, null);
		this.map.put("articleList", articleList);
		return SUCCESS;
	}

	public String special() {
	
		String sql = "select a.* , b.sortsname  from books a , sorts b "
				+ " where 1=1 and a.sortsid = b.sortsid  and a.special = ? order by booksid desc ";
		Object param[] = { "是" }; 
		System.out.println(sql); 
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, param);
		this.map.put("booksList", booksList);
		return SUCCESS;
	}

	public String recommend() {
		
		String sql = "select a.* , b.sortsname  from books a , sorts b "
				+ " where 1=1 and a.sortsid = b.sortsid  and a.recommend = ? order by booksid desc ";
		Object param[] = { "是" }; 
		System.out.println(sql); 
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, param);
		this.map.put("booksList", booksList);

		return SUCCESS;
	}

	public String hot() {
	
		String sql = "select rownum, a.* , b.sortsname  from books a , sorts b  "
				+ "where 1=1 and a.sortsid = b.sortsid and rownum < 6 order by booksid desc  ";
		System.out.println(sql);
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, null);
		this.map.put("booksList", booksList);

		return SUCCESS;
	}

	public String cate() {
	
		String sql = "select a.* , b.sortsname  from books a , sorts b "
				+ " where 1=1 and a.sortsid = b.sortsid  and a.sortsid = ? order by booksid desc ";
		Object param[] = { this.id };
		System.out.println(sql); 
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, param);
		this.map.put("booksList", booksList);
		return SUCCESS;
	}

	public String query() {
		
		String sql = "select a.* , b.sortsname  from books a , sorts b "
				+ " where 1=1 and a.sortsid = b.sortsid  and a.booksname like ? order by booksid desc ";
		Object param[] = { "%" + this.name + "%" }; 
		System.out.println(sql); 
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, param);
		this.map.put("booksList", booksList);
		return SUCCESS;
	}

	public String all() {
		String sql = "select a.* , b.sortsname  from books a , sorts b  "
				+ "where 1=1 and a.sortsid = b.sortsid  order by booksid desc ";
		System.out.println(sql);
	
		List<Map<String, Object>> booksList = BaseDao.selectByParam(sql, null);
		this.map.put("booksList", booksList);
		return SUCCESS;
	}

	public String article() {
		String sql = "select a.*  from article a  where 1=1  order by articleid desc ";
		System.out.println(sql); 
		
		List<Map<String, Object>> articleList = BaseDao.selectByParam(sql, null);
		this.map.put("articleList", articleList);
		return SUCCESS;
	}

	public String read() {
		String sql = "select a.*  from article a  where 1=1  and a.articleid = ? ";
		Object param[] = { this.id }; 
		
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
		this.map.put("article", list.get(0));
		return SUCCESS;
	}

	public String detail() {
		String sql = "select a.* , b.sortsname  from books a , sorts b  "
				+ "where 1=1 and a.sortsid = b.sortsid  and a.booksid = ? ";
		Object param[] = { this.id }; 
		
		List<Map<String, Object>> list = BaseDao.selectByParam(sql, param);
		this.map.put("detail", list.get(0));
		return SUCCESS;
	}

	public String preRegist() {
		return SUCCESS;
	}

	public String regist() {
		String sql = "select a.*  from users a  where 1=1  and a.username = ? order by usersid desc ";
		Object param[] = { this.users.getUsername() }; 
		System.out.println(sql);
		
		List<Map<String, Object>> userList = BaseDao.selectByParam(sql, param);
		if (userList.size() == 0) {
			this.users.setAddtime(CommonUtil.getTime());
			String sql1 = "insert into users( usersid , username , password , realname , contact , address , addtime) "
					+ "values( ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? )";
			Object param1[] = { CommonUtil.getStringID("U"), users.getUsername(), users.getPassword(),
					users.getRealname(), users.getContact(), users.getAddress(), users.getAddtime() };
			System.out.println(sql1); 
			BaseDao.updateByParam(sql1, param1);
			this.request.put("message", "注册成功");
		} else {
			this.request.put("message", "用户名已存在");
			return "input";
		}
		return SUCCESS;
	}

	public String preLogin() {
		return SUCCESS;
	}

	public String login() {
		String sql = "select a.*  from users a  where 1=1  and a.username = ? order by usersid desc ";
		Object param[] = { this.username }; 
		System.out.println(sql); 
	
		List<Map<String, Object>> userList = BaseDao.selectByParam(sql, param);
		if (userList.size() == 0) {
			this.request.put("message", "用户名不存在");
			return "usernoLogin";
		} else {
			
			String userid = "" + userList.get(0).get("usersid");
			if (this.password.equals("" + userList.get(0).get("password"))) {
				this.getSession().put("userid", userid);
				this.getSession().put("username", "" + userList.get(0).get("username"));
				this.getSession().put("users", userList.get(0));
			} else {
				this.request.put("message", "密码错误");
				return "usernoLogin";
			}
		}
		return SUCCESS;
	}

	public String showcart() {
		String userid = (String) this.session.get("userid");
		String sql = "select a.* , b.username , c.booksname , c.image from cart a , users b , books c  "
				+ "where 1=1 and a.usersid = b.usersid and a.booksid = c.booksid  and a.usersid = ? order by cartid desc ";
		Object param[] = { userid }; 
		System.out.println(sql); 
		List<Map<String, Object>> cartList = BaseDao.selectByParam(sql, param);
		this.map = new HashMap<String, Object>();
		this.map.put("cartList", cartList);
		double total = 0;
		int num = 0;
		for (Map<String, Object> x : cartList) {
			total += Double.parseDouble("" + x.get("num")) * Double.parseDouble("" + x.get("price"));
			num += Integer.parseInt("" + x.get("num"));
		}
		this.map.put("total", total);
		this.map.put("num", num);
		return SUCCESS;
	}

	public String addcart() {
		String userid = (String) this.session.get("userid");
		this.cart.setUsersid(userid);
		String sql = "insert into cart( cartid , usersid , booksid , price , num) values( ? ,  ? ,  ? ,  ? ,  ? )"; 
		Object param[] = { CommonUtil.getStringID("C"), cart.getUsersid(), cart.getBooksid(), cart.getPrice(),
				cart.getNum() }; 
		System.out.println(sql);
		BaseDao.updateByParam(sql, param);
		return SUCCESS;
	}

	public String deletecart() {
		String sql = "delete from cart where cartid = ? ";
		Object param[] = { this.id }; 
		System.out.println(sql); 
		BaseDao.updateByParam(sql, param);
		return SUCCESS;
	}

	public String preCheckout() {
		String userid = (String) this.session.get("userid");
		String sql = "select a.* , b.username , c.booksname , c.image from cart a , users b , books c  "
				+ "where 1=1 and a.usersid = b.usersid and a.booksid = c.booksid  and a.usersid = ? order by cartid desc ";
		Object param[] = { userid }; 
		System.out.println(sql); 
		List<Map<String, Object>> cartList = BaseDao.selectByParam(sql, param);
		if (cartList.size() == 0) {
			return "input";
		} else {
			double total = 0;
			for (int i = 0; i < cartList.size(); i++) {
				total += Double.parseDouble("" + cartList.get(i).get("num"))
						* Double.parseDouble("" + cartList.get(i).get("price"));
			}
			this.map.put("total", total);
			this.map.put("cartList", cartList);
		}
		return SUCCESS;
	}

	public String checkout() {
		String userid = (String) this.session.get("userid");
		String sql = "select a.* , b.username , c.booksname , c.image from cart a , users b , books c  "
				+ "where 1=1 and a.usersid = b.usersid and a.booksid = c.booksid  and a.usersid = ? order by cartid desc ";
		Object param[] = { userid }; 
		System.out.println(sql);
		List<Map<String, Object>> cartList = BaseDao.selectByParam(sql, param);
		String ordersid = CommonUtil.getStringTime();
		double total = 0;
		for (int i = 0; i < cartList.size(); i++) {
			total += Double.parseDouble("" + cartList.get(i).get("num"))
					* Double.parseDouble("" + cartList.get(i).get("price"));
			Items items = new Items();
			items.setBooksid("" + cartList.get(i).get("booksid"));
			items.setNum("" + cartList.get(i).get("num"));
			items.setOrdercode(ordersid);
			items.setPrice("" + cartList.get(i).get("price"));
			String sql1 = "insert into items( itemsid , ordercode , booksid , price , num) values( ? ,  ? ,  ? ,  ? ,  ? )"; // 插入SQL语句
			Object param1[] = { CommonUtil.getStringID("I"), items.getOrdercode(), items.getBooksid(), items.getPrice(),
					items.getNum() };
			System.out.println(sql1); 
			BaseDao.updateByParam(sql1, param1);
			String sql2 = "delete from cart where cartid = ? ";
			Object param2[] = { cartList.get(i).get("cartid") };
			System.out.println(sql2); 
			BaseDao.updateByParam(sql2, param2); 
		}
		Orders orders = new Orders();
		orders.setOrdersid(ordersid);
		orders.setOrdercode(ordersid);
		orders.setAddress(this.cond);
		orders.setAddtime(CommonUtil.getTime());
		orders.setOrdersid(ordersid);
		orders.setReceiver(this.name);
		orders.setContact(this.msg);
		orders.setTotal("" + total);
		orders.setUsersid(userid);
		String sql4 = "insert into orders( ordersid , ordercode , usersid , total , addtime , receiver , contact , address) "
				+ "values( ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? ,  ? )"; 
		Object param4[] = { CommonUtil.getStringID("O"), orders.getOrdercode(), orders.getUsersid(), orders.getTotal(),
				orders.getAddtime(), orders.getReceiver(), orders.getContact(), orders.getAddress() }; 
		System.out.println(sql4); 
		BaseDao.updateByParam(sql4, param4); 
		return SUCCESS;
	}

	public String showorder() {
		String userid = (String) this.session.get("userid");
		
		String sql = "select a.* , b.username  from orders a , users b  "
				+ "where 1=1 and a.usersid = b.usersid  and a.usersid = ? order by ordersid desc ";
		Object param[] = { userid };
		System.out.println(sql);
		
		List<Map<String, Object>> ordersList = BaseDao.selectByParam(sql, param);
		this.map.put("ordersList", ordersList);
		return SUCCESS;
	}

	public String orderdetail() {
		
		String sql = "select a.* , b.booksname  from items a , books b "
				+ " where 1=1 and a.booksid = b.booksid  and a.ordercode = ? order by itemsid desc ";
		Object param[] = { this.id }; 
		System.out.println(sql);
		
		List<Map<String, Object>> itemsList = BaseDao.selectByParam(sql, param);
		this.map.put("itemsList", itemsList);

		return SUCCESS;
	}

	public String usercenter() {
		return SUCCESS;
	}

	public String exit() {
		this.session.remove("userid");
		this.session.remove("username");
		this.session.remove("userid");
		return SUCCESS;
	}

}
