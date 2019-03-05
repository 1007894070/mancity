package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseDao {
	
	static List<Connection> list = new ArrayList<Connection>();

	
	public synchronized static Connection getConnection() throws Exception {
		
		if (list.size() > 0) {
			return list.remove(0);
		} else {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			for (int i = 0; i < 20; i++) {
				Connection conn = null;
				conn = DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl", "root", "root");
				list.add(conn);
			}

			return list.remove(0);
		}

	}

	
	public static void close(Connection conn, PreparedStatement ps, ResultSet set) throws Exception {
		if (set != null) {
			set.close();
		}
		if (ps != null) {
			ps.close();
		}
		if (conn != null) {
			list.add(conn);
		}

	}

	
	public static boolean updateByParam(String sql, Object[] param) {
		boolean f = false;
		
		try {
			
			Connection con = BaseDao.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			
			if (param != null) {
				
				for (int i = 0; i < param.length; i++) {
					if (param[i] == null) {
						param[i] = "";
					}
					ps.setObject(i + 1, param[i]);
				}
			}
			
			int n = ps.executeUpdate();
			if (n > 0) {
				f = true;
			}
			
			BaseDao.close(con, ps, null);

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return f;

	}

	public static List<Map<String, Object>> selectByParam(String sql, Object[] param) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			Connection con = BaseDao.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setObject(i + 1, param[i]);
				}
			}
			
			ResultSet set = ps.executeQuery();
			
			ResultSetMetaData rsmd = set.getMetaData();
			
			int n = rsmd.getColumnCount();
			
			while (set.next()) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				for (int i = 1; i <= n; i++) {
					String key = rsmd.getColumnName(i).toLowerCase();
					Object v = set.getObject(i);
					map.put(key, v);
				}
				list.add(map);
			}
			BaseDao.close(con, ps, set);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

}
