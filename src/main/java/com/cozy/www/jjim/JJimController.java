package com.cozy.www.jjim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jjim")
public class JJimController {
	@Autowired
	private JJimService jjimService;

	// 찜 목록
	@RequestMapping("list")
	public String jjimList(JJimVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		model.addAttribute("jjimList", jjimService.jjimList(vo));
		return "jjim/jjimList";
	}

	// 찜!
	@RequestMapping("{no}")
	public String insertJJim(@PathVariable int no, JJimVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}

		int result = jjimService.searchJJim(vo);
		System.out.println(" [[[[찜 중복 확인]]]]:" + result);
		if (result == 0) {
			jjimService.insertJJim(vo);
		} else {
			jjimService.noJJim(vo);

		}
		vo.setJjim(1);
		model.addAttribute("jjimList", jjimService.jjimList(vo));
		return "redirect:/product/productDetail/{no}";
	}


	// 찜 해제
	@RequestMapping("noJJim")
	public String noJJim(JJimVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		model.addAttribute("cartList", jjimService.noJJim(vo));
		return "redirect:/product/productDetail/{no}";
	}

	// 찜 목록에서 삭제
	@RequestMapping("delete/{jjim_no}")
	public String deleteJJim(@PathVariable int jjim_no, JJimVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("uid") != null) {
			vo.setUid((String) session.getAttribute("uid"));
		}else if(session.getAttribute("uid") == null && session.getAttribute("fid") != null){
			vo.setUid((String) session.getAttribute("fid"));
		}
		vo.setJjim_no(jjim_no);
		System.out.println("찜목록 번호 불러오니" + jjim_no);
		vo.setJjim(0);
		System.out.println("찜 0으로 " + vo.getJjim());
		model.addAttribute("jjimList", jjimService.deleteJJim(vo));
		return "redirect:/jjim/list";
	}

}
