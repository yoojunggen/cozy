package com.cozy.www.jjim;

public class JJimVO {
	private int jjim_no; //찜 번호
	private int jjim; // 찜 여부 찜=1 찜해제=0
	private int no; // 상품 번호
	private String p_name; //상품 이름
	private int price; //상품 가격
	private String p_file; // 상품 이미지 파일
	private String uid; //회원 ID
	
	
	public int getJjim_no() {
		return jjim_no;
	}
	public void setJjim_no(int jjim_no) {
		this.jjim_no = jjim_no;
	}
	public int getJjim() {
		return jjim;
	}
	public void setJjim(int jjim) {
		this.jjim = jjim;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}

	

}
