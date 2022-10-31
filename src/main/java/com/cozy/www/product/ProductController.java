package com.cozy.www.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping(value="list/{div1}",method=RequestMethod.POST)
	public @ResponseBody List<ProductVO> AjaxView(@PathVariable String div1,@RequestParam(required=false, defaultValue="") String searchKeyword, @RequestParam(required=false, defaultValue="1") int offset, Paging paging) {
		int page = 0;
		if(offset == 1) {
			paging.setOffset(1);
		}
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		paging.setSearchKeyword(searchKeyword);
		System.out.println(paging.getSearchKeyword());
		int count = productService.getDivCount(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		paging.setMaxPage(maxPage);
		System.out.println("페이징 VO 안에 offset 잘 담겼는지 확인 : "+paging.getOffset());
		List<ProductVO> vo = productService.getProductListPage(paging);
		System.out.println("ajax 타고 잘 들어오는지 확인");
		return vo;
	}
	
	
	@RequestMapping(value="list/{div1}",method=RequestMethod.GET)
	public String getBoardList(@PathVariable String div1, @RequestParam(required=false, defaultValue="1") int offset, Paging paging,  Model model) {
		int page = 0;
		if(offset == 1) {
			paging.setOffset(1);
		}
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		int count = productService.getDivCount(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("productList", productService.getProductListPage(paging));
		return "product/getProductList";
	}
	@RequestMapping(value="list/{div1}/{div2}",method=RequestMethod.POST)
	public @ResponseBody List<ProductVO> AjaxViewDiv2(@PathVariable String div1,@RequestParam(required=false, defaultValue="") String searchKeyword, @RequestParam(required=false, defaultValue="1") int offset, Paging paging) {

		int page = 0;
		if(offset == 1) {
			paging.setOffset(1);
		}
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		int count = productService.getDiv2Count(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		paging.setMaxPage(maxPage);
		System.out.println("페이징 VO 안에 offset 잘 담겼는지 확인 : "+paging.getOffset());
		List<ProductVO> vo = productService.getBoardListDiv2(paging);
		System.out.println("ajax 타고 잘 들어오는지 확인");
		return vo;
	}
	@RequestMapping(value="list/{div1}/{div2}",method=RequestMethod.GET)
	public String getBoardListDiv2(@PathVariable String div1, @PathVariable String div2, @RequestParam(required=false, defaultValue="1") int offset, Paging paging,  Model model) {
		int page = 0;
		if(offset == 1) {
			paging.setOffset(1);
		}
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		int count = productService.getDiv2Count(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("productList", productService.getBoardListDiv2(paging));
		return "product/getProductList";
	}
	@RequestMapping("search/{offset}")
	public String getSearchList(@RequestParam(required=false, defaultValue="") String searchKeyword, @PathVariable int offset, Paging paging, Model model) {
		int page = 0;
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		int count = productService.getSearchCount(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("productList", productService.getSearchList(paging));
		return "product/getProductList";
	}
	
	@RequestMapping("productDetail/{no}")
	public String detail(Model model, @PathVariable("no") int no) {
		model.addAttribute("productDetail", productService.detail(no));
		return "product/productDetail";
	}

	
	// ---------------------------------------------------------admin
	// 상품 전체조회
	@RequestMapping("admin/list/{offset}")
	public String getList(ProductVO vo, @PathVariable int offset, Paging paging, Model model) {
		System.out.println("product/{offset} : " + offset);
		int page = 0;
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(10*(paging.getOffset()-1));
		int count = productService.getListCount(paging);
		int maxPage = 0;
		if(count % 10 == 0) {
			maxPage = count / 10; 
		}else {
			maxPage = count / 10 + 1; 
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("productList", productService.getAdminProductListPage(paging));
		return "product/adminGetProductList";
	}

	// 상품 등록 폼
	@RequestMapping(value = "admin/productinsert", method = RequestMethod.GET)
	public String insertProductForm(ProductVO vo) {
		System.out.println("상품 등록 폼 실행");
		return "product/adminInsertProductForm";
	}

	// 상품 등록하기
	@RequestMapping(value = "admin/productinsert", method = RequestMethod.POST)
	public String insert(ProductVO vo, @RequestParam("img") List<MultipartFile> multiFileList,
			@RequestParam("thumbimg") MultipartFile thumbimg, HttpServletResponse response, Model model,
			HttpServletRequest request,Paging paging) throws Exception {

		System.out.println("인서트");
		System.out.println("multiFileList : " + multiFileList);
		String thumbfileRealName = thumbimg.getOriginalFilename(); // 썸네일 파일명을 얻어낼 수 있는 메서드
		long size = thumbimg.getSize();// 파일 사이즈
		System.out.println("용량크기(byte) : " + size);

		// 여러개 파일명 얻어서 fileList에 map형식으로 저장
		List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();

		for (int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			Map<String, String> map = new HashMap<String, String>();
			map.put("changeFile", changeFile);
			fileList.add(map);
		}

		// set 상세 파일명 넣기
		List<String> list = new ArrayList<String>();

		for (int i = 0; i < fileList.size(); i++) {
			String fname = fileList.get(i).values().toString();
			String midfname = fname.substring(1, fname.length() - 1);
			list.add(midfname);
			String addCommaString = StringUtils.join(list, ",");// StringUtils 문자열 결합 라이브러리 필요
			System.out.println(addCommaString);
			vo.setP_file(addCommaString);
		}
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		thumbfileRealName = uuid.toString() + "_" + thumbfileRealName;
		System.out.println("파일명 : " + thumbfileRealName);

		String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);

		try {
			File thumbFile = new File(absolutePath + "/" + thumbfileRealName); // 썸네일적용
			thumbimg.transferTo(thumbFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

			for (int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(absolutePath + "/" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
			}
			System.out.println("다중 파일 업로드 성공!");
		} catch (IllegalStateException e) {

			System.out.println("다중 파일 업로드 실패 ㅠㅠ");
			// 만약 업로드 실패하면 파일 삭제
			for (int i = 0; i < multiFileList.size(); i++) {
				new File(absolutePath + "/" + fileList.get(i).get("changeFile")).delete();
			}
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(fileList);
		vo.setThumbfile(thumbfileRealName); // ----------여기까지 썸네일 파일명 저장
		int result = productService.adminproductinsert(vo);
		System.out.println(result);
		model.addAttribute("productList", productService.getAdminProductListPage(paging));
		return "redirect:/product/admin/list/1";
	}

	// 상품상세정보가기
	@RequestMapping(value = "admin/productdetail/{no}", method = RequestMethod.GET)
	public String productdetail(@PathVariable("no") int no, Model model) {
		System.out.println("상품 상세 정보");
		model.addAttribute("productDetail", productService.adminproductdetail(no));
		return "product/adminDetailProduct";
	}

	// 상품상세들어가서삭제
	@RequestMapping(value = "admin/productdelete/{no}", method = RequestMethod.POST)
	public String delete(@PathVariable int no, @RequestParam("p_file") String p_file,
	@RequestParam("thumbfile") String thumbfile, ProductVO vo, Model model, HttpServletRequest request, Paging paging) {
		// HttpSession session = request.getSession();
		// vo.setUid((String) session.getAttribute("uid"));
		System.out.println("상품 삭제");
		vo.setNo(no);
		int result = productService.adminproductdelete(no);
		System.out.println(result);
		String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);
		File delthFile = new File(absolutePath + "/" + thumbfile);// 썸네일 파일 삭제
		delthFile.delete();

		String[] sansefile = p_file.split(",");

		for (int i = 0; i < sansefile.length; i++) {
			File delsanseFile = new File(absolutePath + "/" + sansefile[i]); // 추가이미지 파일 삭제
			delsanseFile.delete();
		}
		model.addAttribute("productList", productService.getAdminProductListPage(paging));
		return "redirect:/product/admin/list/1";
	}
	
	// 상품 체크 다중선택 삭제
	@RequestMapping("admin/checkdelete")
	public String checkdelete(@RequestParam(value = "select", required = false) int[] checks,
		@RequestParam("nowPage") int nowPage, @RequestParam("p_file") String p_file, @RequestParam("thumbfile") String thumbfile, ProductVO vo,
			Model model, HttpServletRequest request, Paging paging) {
		System.out.println(thumbfile); //사진 잘 가져오는지 확인
	    System.out.println("상품다중삭제");
	    //System.out.println(paging.getPage());
	    // HttpSession session = request.getSession();
		// vo.setUid((String) session.getAttribute("uid"));
		String checkList = "";
		for(int select : checks) {
			if(checkList.equals("")) {checkList += select;}else {checkList += ","+select;	}
		}
		List<String> items = Arrays.asList(checkList.split(","));
		productService.admincheckdelete(items);
		
	    String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);
		
		 String[] thumbfiles = thumbfile.split(",");
		 String[] sansefile = p_file.split(",");
		 
		 for (int i = 0; i < thumbfiles.length; i++) {
				File delthFile = new File(absolutePath + "/" + thumbfiles[i]); // 추가이미지 파일 삭제
				delthFile.delete();
			}

		for (int i = 0; i < sansefile.length; i++) {
			File delsanseFile = new File(absolutePath + "/" + sansefile[i]); // 추가이미지 파일 삭제
			delsanseFile.delete();
		}
		return "redirect:/product/admin/list/"+ nowPage;
	}
	
	//검색
	@RequestMapping("admin/search/{offset}")
	public String getAdminSearchList(@RequestParam(required=false, defaultValue="") String searchKeyword, @PathVariable int offset, Paging paging, Model model) {
		System.out.println(offset);
		int page = 0;
		if(offset % 5 == 0) {
			page = (int)Math.floor((offset/6));
		}else {
			page = (int)Math.floor((offset/5));
		}
		paging.setPage(page);
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		int count = productService.getAdminSearchCount(paging);
		int maxPage = 0;
		if(count % 6 == 0) {
			maxPage = count / 6; 
		}else {
			maxPage = count / 6 + 1; 
		}
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("productList", productService.getAdminSearchList(paging));
		return "product/adminGetProductList";
	}

	// 상품 수정 폼
	@RequestMapping(value = "admin/productupdate/{no}", method = RequestMethod.GET)
	public String updateProductForm(@PathVariable int no, Model model) {
		System.out.println("상품 수정 폼 실행");
		model.addAttribute("productDetail", productService.adminproductdetail(no));
		return "product/adminUpdateProductForm";
	}

	// 상품 상세 수정
	@RequestMapping(value = "admin/dproductupdate/{no}", method = RequestMethod.POST)
	public String dupdateProduct(@PathVariable int no, @RequestParam("p_file") String p_file,
			@RequestParam("img") MultipartFile img, ProductVO vo, Model model, HttpServletRequest request) {

		System.out.println("상품 상세 수정 실행");

		String fileRealName = img.getOriginalFilename();// 파일명을 얻어낼 수 있는 메서드
		long size = img.getSize();// 파일 사이즈
		System.out.println("용량크기(byte) : " + size);

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		fileRealName = uuid.toString() + "_" + fileRealName;
		System.out.println("파일명 : " + fileRealName);

		String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);

		// 실제 디렉토리에서 기존 파일 삭제
		File delFile = new File(absolutePath + "/" + p_file);
		delFile.delete();

		File saveFile = new File(absolutePath + "/" + fileRealName); // 적용 후
		try {
			img.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		vo.setP_file(fileRealName);

		int result = productService.adminproductupdate(vo);
		System.out.println(result);
		System.out.println("상품 상세 수정 성공");
		model.addAttribute("productDetail", productService.adminproductdetail(no));
		return "product/adminDetailProduct";
	}
		
}
