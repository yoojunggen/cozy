package com.cozy.www.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 목록
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("CartDAO.getCartList", vo);
	}

	// 장바구니 조회
	public int searchCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.searchCart", vo);
	}

	// 장바구니 담기
	public int insertCart(CartVO vo) {
		return mybatis.insert("CartDAO.insertCart", vo);
	}

	// 장바구니 개별 삭제
	public int deleteCart(CartVO vo) {
		return mybatis.delete("CartDAO.deleteCart", vo);
	}

	// 장바구니 전체 삭제
	public int deleteAllCart(CartVO vo) {
		return mybatis.delete("CartDAO.deleteAllCart", vo);
	}

	// 장바구니에서 수량 변경
	public int updateCart(CartVO vo) {
		return mybatis.update("CartDAO.updateCart", vo);
	}

	// 장바구니 중복상품 수량 업데이트
	public int modifyCart(CartVO vo) {
		return mybatis.update("CartDAO.modifyCart", vo);
	}

}
