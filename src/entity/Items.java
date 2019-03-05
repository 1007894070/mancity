package entity;

public class Items {
	private String itemsid;
	private String ordercode;
	private String booksid;
	private String price;
	private String num;

	public String getItemsid() {
		return itemsid;
	}

	public void setItemsid(String itemsid) {
		this.itemsid = itemsid;
	}

	public String getOrdercode() {
		return this.ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getBooksid() {
		return this.booksid;
	}

	public void setBooksid(String booksid) {
		this.booksid = booksid;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}
}
