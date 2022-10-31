package com.cozy.www.cart;

import java.util.Date;

public class CartVO {
	private int cart_num; //장바구니 번호
	private String uid; //회원 ID
	private int no; //상품 번호
	private String p_name; //상품 이름
	private int price; //상품 가격
	private int qty; //상품 수량
	private String p_file; // 상품 이미지 파일
	private Date cart_date; // 장바구니 담은 날짜
	
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getP_file() {
		return p_file;
	}

	public void setP_file(String p_file) {
		this.p_file = p_file;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}

	@Override
	public String toString() {
		return "CartVO [cart_num=" + cart_num + ", uid=" + uid + ", no=" + no + ", p_name=" + p_name + ", price="
				+ price + ", qty=" + qty + ", p_file=" + p_file + ", cart_date=" + cart_date + "]";
	}


}
