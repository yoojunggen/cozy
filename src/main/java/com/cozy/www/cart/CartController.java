package com.cozy.www.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartService cartService;

	// 장바구니 목록
	@RequestMapping("list")
	public String getCartList(CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		model.addAttribute("cartList", cartService.getCartList(vo));
		return "cart/getCartList";
	}

	// 장바구니 담기
	@RequestMapping("{no}")
	public String insertCart(@PathVariable int no, CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("CartController에서 세션(id) 가져오기 : " + session.getAttribute("uid"));
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}

		int result = cartService.searchCart(vo); //장바구니안에 상품 검색
		System.out.println(" [[[[중복 확인]]]]:" + result);
		if (result == 0) {
			cartService.insertCart(vo); //장바구니에 없는 상품이면 담기
		} else {
			cartService.modifyCart(vo); //장바구니에 있는 상품이면 수량업데이트

		}
		return "redirect:/cart/list";
	}

	// 장바구니 선택 삭제
	@RequestMapping("delete/{cart_num}")
	public String deleteCart(@PathVariable int cart_num, CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setUid((String) session.getAttribute("uid"));
		vo.setCart_num(cart_num);
		model.addAttribute("cartList", cartService.deleteCart(vo));
		return "redirect:/cart/list";
	}

	// 장바구니 전체 삭제
	@RequestMapping("deleteAll")
	public String deleteAllCart(CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		model.addAttribute("cartList", cartService.deleteAllCart(vo));
		return "redirect:/cart/list";
	}

	// 장바구니 수량 변경
	@RequestMapping("update/{cart_num}")
	public String updateCart(@PathVariable int cart_num, CartVO vo, Model model, HttpServletRequest request) {
		System.out.println("수량 잘 나오고 있는지 확인:" + vo.getQty());
		System.out.println("수량 잘 나오고 있는지 확인:" + vo.getCart_num());
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		vo.setCart_num(cart_num);
		model.addAttribute("cartList", cartService.updateCart(vo));
		return "redirect:/cart/list";
	}

}
