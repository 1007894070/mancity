package entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Sorts {
	private String sortsid;
	private String sortsname;
	private String memo;
	private String addtime;
	private List<Map<String, Object>> booksList = new ArrayList<Map<String, Object>>();

	public List<Map<String, Object>> getBooksList() {
		return booksList;
	}

	public void setBooksList(List<Map<String, Object>> booksList) {
		this.booksList = booksList;
	}

	public String getSortsid() {
		return sortsid;
	}

	public void setSortsid(String sortsid) {
		this.sortsid = sortsid;
	}

	public String getSortsname() {
		return this.sortsname;
	}

	public void setSortsname(String sortsname) {
		this.sortsname = sortsname;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
}
