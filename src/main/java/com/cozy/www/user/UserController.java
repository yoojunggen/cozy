package com.cozy.www.user;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.JsonMappingException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cozy.www.cart.CartVO;
import com.cozy.www.product.ProductService;
import com.cozy.www.product.ProductVO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonParseException;


@Controller

public class UserController {
	@Autowired
	private UserService userService;
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private KakaoService ms;
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "/talk", method = RequestMethod.GET)
    public String talk(Model model){
        
        return "user/talk";
    }
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login(Model model){
        
        return "user/loginForm";
    }
	
	@RequestMapping(value = "/logout", method = {RequestMethod.GET})
	public String logout(Locale locale, Model model) {				
		return "user/logout";
	}
	
	// 인덱스 화면
	@RequestMapping(value = "/", method = {RequestMethod.GET})
	public String home(Locale locale, Model model, ProductVO vo) {	
		model.addAttribute("productList", productService.getPayHot(vo));
		return "user/home";
	}
	@RequestMapping(value = "/", method = {RequestMethod.POST})
	public String home2(String uid, HttpServletRequest request, HttpServletRequest response) {
		return "user/home";
	}
	
	// 관리자 로그인 화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adloginForm(Model model){
        
        return "user/adloginForm";
    }
	
	@RequestMapping(value = "/ad", method = RequestMethod.GET)
    public String adhome(Model model){
        
        return "user/adhome";
    }
	
	
	// 관리자 인덱스 화면 (통계1)
	@RequestMapping(value = "/selectYear/{year}", method = {RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> selectYear(Model model, UserVO vo, @RequestParam(value = "year", required = true) String year) {
		String[] months = {"-01-","-02-","-03-","-04-","-05-","-06-","-07-","-08-","-09-","-10-","-11-","-12-"};
		Map<String, Object> result = new HashMap<String, Object>();
		vo.setYear(year);
		String yearList = "";
		for(int i = 0; i < 12; i++) {
			String month = months[i];		
			vo.setMonth(month);
			if(yearList.equals("")) {
				yearList += userService.selectYear(vo);
             }else {
            	 yearList += ","+userService.selectYear(vo);
             }
			
		}
		result.put("yearList", yearList);
		return result;
	}
	
	// 관리자 인덱스 화면 (통계)
    @RequestMapping(value = "/selectCategory/{category}/{year}", method = {RequestMethod.GET})
     @ResponseBody
     public Map<String, Object> selectCategory(Model model, UserVO vo,
           @RequestParam(value = "category", required = true) String category,
           @RequestParam(value = "year", required = true) String year
           )throws Exception {
        String[] months = {"-01-","-02-","-03-","-04-","-05-","-06-","-07-","-08-","-09-","-10-","-11-","-12-"};
        Map<String, Object> result = new HashMap<String, Object>();
        
        System.out.println(category);
        String ctg = "";
        
       if (category.equals("사료")) {
           ctg = "feed";
        } else if (category.equals("간식")) {
           ctg = "snack";
        } else if (category.equals("건강식품")) {
          ctg = "healthy";
       } else if (category.equals("위생용품")) {
          ctg = "clean";
       } else if (category.equals("생활용품")) {
           ctg = "living";
        }                 
       vo.setYear(year);
       System.out.println(vo.getYear());
       vo.setCtg(ctg);
       System.out.println(vo.getCtg());
       
       
       String monthList = "";
       String dogMonthList = "";
       String otherMonthList = "";
       for(int i = 0; i < 12; i++) {
              String month = months[i];         
              System.out.println(month);              
              vo.setMonth(month);
              if(monthList.equals("")) {
                 monthList += userService.selectCategory(vo);
                 dogMonthList += userService.dogCategory(vo);
                 otherMonthList += userService.otherCategory(vo);
              }else {
                 monthList += ","+userService.selectCategory(vo);
                 dogMonthList += ","+userService.dogCategory(vo);
                 otherMonthList += ","+userService.otherCategory(vo);
              }
              
             
           }
       
       int joinToday = userService.joinToday(vo);
       int totalToday = userService.totalToday(vo);
       int orderCount = userService.orderCount(vo);
       int productCount = userService.productCount(vo);
                         
       result.put("catMonth", monthList);
       result.put("dogMonth", dogMonthList);
       result.put("otherMonth", otherMonthList);
       result.put("joinToday", joinToday);
       result.put("totalToday", totalToday);
       result.put("orderCount", orderCount);
       result.put("productCount", productCount);
       System.out.println(result);
       
       return result;        
     } 
	

	
	// 관리자) 회원 리스트
	@RequestMapping("aduserList")
	public String getUserList(Model model, UserVO vo) {
		return "user/aduserList";
	}
	
	// 로그인 화면
	   @RequestMapping(value = "loginForm", method = RequestMethod.GET)
	   public String getloginForm(Model model, HttpServletRequest request) {
	      String referer = request.getHeader("Referer");
	      request.getSession().setAttribute("redirectURI", referer);      
	      
	      return "user/loginForm";
	   }
	
	// 로그인 성공
	   @RequestMapping(value = "loginSuccess", method = RequestMethod.POST)
	   public String getloginSuccess(@RequestParam("uid") String uid
	            , @RequestParam("upwd") String upwd, HttpServletRequest request, HttpServletResponse response) throws Exception{      
	      
	      String path = "";
	      UserVO vo = new UserVO();
	      vo.setUid(uid);
	        vo.setUpwd(upwd);
	        System.out.println(" 븘 씠 뵒"+uid);
	        System.out.println("鍮꾨 踰덊샇"+upwd);
	        Integer result = userService.login(vo);
	        if(result == 1) {
	             if(uid.equals("admin")) {
	                 path = "redirect:/ad";
	                 HttpSession session = request.getSession();
	                session.setAttribute("uid", uid);
	            } else {               
	                HttpSession session = request.getSession();
	                session.setAttribute("uid", uid);
	                
	                Object redirectURI = session.getAttribute("redirectURI");
	                String redirectUri = (String)redirectURI;
	                System.out.println(redirectUri);
	                return "redirect:"+ redirectUri;
	            }
	        } else {
	            path = "/user/loginForm";
	        }
	      return path;
	   }
	
	// 회원가입 화면
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String getjoinForm(UserVO user) {
		return "user/joinForm";
	}
	
	// 회원가입 ID 유효성 체크
	@ResponseBody
	@RequestMapping(value="idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		 return userService.idChk(vo);	 
	}
	
	//이메일 인증
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String mailCheck(@RequestParam String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			
			return mailService.joinEmail(email);
		}
	
	// 회원가입
	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	   public String insert(Model model, UserVO vo) throws Exception {
			int result = userService.idChk(vo);
			try {
				if (result == 1) {
					System.out.println("중복아이디");
					return "user/joinForm";
				}else if (result == 0) {
					System.out.println("성공");
					userService.insert(vo);
				}				
	   }catch (Exception e) {
		throw new RuntimeException();
	   }return "user/loginForm";
			
	}
	
	// 마이페이지 화면
	@RequestMapping(value = "/myInfo")
	public String getMyInfo(Model model, HttpServletRequest request, UserVO vo, CartVO cvo) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
		String fid = (String)session.getAttribute("fid");
		if(uid != null) {
			vo.setUid(uid);
			cvo.setUid(uid);
		} else {
			vo.setUid(fid);
			cvo.setUid(fid);	
		}
		model.addAttribute("myInfo", userService.myInfo(vo));
		model.addAttribute("cartList", userService.getCartList(cvo));
		return "user/myInfo";
	}
	
	@RequestMapping(value = "/updateForm")
	public String updateForm(Model model, UserVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
		vo.setUid(uid);
		model.addAttribute("myInfo", userService.myInfo(vo));
		return "user/myInfoUpdateForm";
	}
	
	
	// 내 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, UserVO vo) {
		model.addAttribute("update", userService.update(vo));
		return "redirect:myInfo";
	}
	
	// 관리자) 회원 정보 수정 화면
	@RequestMapping(value = "adupdateForm/{uid}")
	public String adupdateForm(Model model, @PathVariable("uid") String uid) {
		model.addAttribute("adupdateForm", userService.adupdateForm(uid));
		return "user/adUserUpdateForm";
	}
	
	/// 관리자) 회원 정보 수정
	@RequestMapping(value = "adupdate")
	public String adupdate(Model model, UserVO vo) {
		model.addAttribute("userList", userService.adupdate(vo));
		return "redirect:userList";
	}
	
	// 관리자) 회원 정보 삭제
	@RequestMapping(value = "aduserDelete/{uid}")
	public String aduserDelete(Model model, UserVO vo, @PathVariable("uid") String uid) {
		model.addAttribute("aduserDelete", userService.aduserDelete(uid));
		return "user/aduserList";
	}
	
	@RequestMapping(value = "/userDeleteForm")
	public String deleteForm(Model model, UserVO vo, HttpServletRequest request) {
		
		return "user/myInfoDelete";
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String userDelete(@RequestParam("upwd") String upwd, HttpServletRequest request, HttpServletResponse response, Model model, UserVO vo) throws IOException {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
		String path = "";
		vo.setUid(uid);
		vo.setUpwd(upwd);
		int result = userService.userPwd(vo);
		if(result == 1) {
			model.addAttribute("userDelete", userService.userDelete(vo));
            path = "user/bye";
        } else {
        	path = "user/stay";
        }
		
		return path;
	}
	
	//구글로그인
		@RequestMapping(value = "/googleloginForm") 
		public String googleloginGo(@RequestParam("credential") String token,GoogleInfoVO vo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
			
			session = request.getSession();
			
			System.out.println("token = " + token);
			
			String[] chunks = token.split("\\.");
			
			Base64.Decoder decoder = Base64.getUrlDecoder();
			//"UTF-8"을 넣어주어야 글자가 깨지지 않음
			String header = new String (decoder.decode(chunks[0]),"UTF-8");
			String payload = new String (decoder.decode(chunks[1]),"UTF-8");

			System.out.println("payload = " + payload );
			
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
			
			vo = mapper.readValue(payload, GoogleInfoVO.class);
			
			GoogleInfoVO info = new GoogleInfoVO();
			
			info.setAud(vo.getAud());
			info.setEmail(vo.getEmail());
			info.setName(vo.getName());
			info.setSub(vo.getSub());
			
			session.setAttribute("info", info);
			session.setAttribute("fid", vo.getName());
			System.out.println("내이름" + vo.getName());
			System.out.println("vo = " + vo);
			
			return "user/home";
		}


		//네이버로그인
		@RequestMapping(value="callback", method=RequestMethod.GET)
		public String callBack(){
			return "user/callback";
		}
		
		@RequestMapping(value="naverSave", method=RequestMethod.POST)
		public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("#############################################");
		System.out.println(n_age);
		System.out.println(n_birthday);
		System.out.println(n_email);
		System.out.println(n_gender);
		System.out.println(n_id);
		System.out.println(n_name);
		System.out.println(n_nickName);
		System.out.println("#############################################");

		NaverDTO naver = new NaverDTO();
		naver.setN_age(n_age);
		naver.setN_birthday(n_birthday);
		naver.setN_email(n_email);
		naver.setN_gender(n_gender);
		naver.setN_id(n_id);
		naver.setN_name(n_name);
		naver.setN_nickName(n_nickName);
	    
		HttpSession session = request.getSession();
	    session.setAttribute("fid", n_name);
		
		// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
		String result = "no";
	    
		if(naver!=null) {
			// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
			result = "ok";
		}

		return result;
	    
		}
		
		
		//카카오로그인
		@RequestMapping(value="/login/oauth_kakao", method=RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("#########" + code);
			
			String access_Token = ms.getAccessToken(code);
			System.out.println("###access_Token#### : " + access_Token);
			
			HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			System.out.println("유저정보:" + userInfo);
			HttpSession session = request.getSession();
	        session.setAttribute("fid", userInfo.get("nickname"));
			return "redirect:/";
		}

		//비밀번호찾기
	      @RequestMapping(value = "findpwd", method = RequestMethod.GET)
	      public String getfindpwd(UserVO user) {
	         return "user/findpwd";
	      }
	      
	      //비밀번호정보받기
	      @RequestMapping(value = "nowfind", method = RequestMethod.POST)
	      public String getnowfind(Model model, @RequestParam("uid") String uid
	               , @RequestParam("uname") String uname, @RequestParam("umail") String umail, @RequestParam("umail2") String umail2, HttpServletResponse response, String msg, String url) throws Exception{
	         String path = "";
	         UserVO vo = new UserVO();
	         vo.setUid(uid);
	           vo.setUname(uname);
	           vo.setUmail(umail+umail2);
	           System.out.println("아이디"+uid);
	           System.out.println("이름"+uname);
	           System.out.println(umail+umail2);
	           Integer result = userService.findpwd(vo);
	           System.out.println("결과값 :"+result);
	           if(result == 1) {
	               path = mailService.pwdEmail(umail,umail2,uid,model,vo,response,msg,url);
	           } else {
	               String ms = "입력하신 정보가 일치하지않거나 존재하지않습니다.";
	                response.setContentType("text/html; charset=utf-8");
	                 PrintWriter w = response.getWriter();
	                 w.write("<script>alert('"+ms+"');location.href=\"findpwd\";</script>");
	                 w.flush();
	                 w.close();
	               path = "/user/findpwd";
	           }
	         return path;
	      }
	      

	      
	      
	      //아이디 찾기
	      @RequestMapping(value = "findid", method = RequestMethod.GET)
	      public String getfindid(UserVO user) {
	            return "user/findid";
	            }
	      
	      //아이디 정보받기
	      @RequestMapping(value = "nowid", method = RequestMethod.POST)
	      public String getnowid(Model model,
	          @RequestParam("uname") String uname, @RequestParam("umail") String umail, @RequestParam("umail2") String umail2, HttpServletResponse response, String msg, String url) throws Exception{
	            String path = "";
	            UserVO vo = new UserVO();
	              vo.setUname(uname);
	              vo.setUmail(umail+umail2);
	              System.out.println("이름"+uname);
	              System.out.println(umail+umail2);
	              String email = umail+umail2;
	              String result = userService.findid(vo);
	              if(result == null) {
	                 String ms = "입력하신 정보가 일치하지않거나 존재하지않습니다.";
	                   response.setContentType("text/html; charset=utf-8");
	                    PrintWriter w = response.getWriter();
	                    w.write("<script>alert('"+ms+"');location.href=\"findid\";</script>");
	                    w.flush();
	                    w.close();
	                  path = "/user/findid";
	              } else {
	                 
	                  path = mailService.idEmail(result,email,model,vo,response,msg,url);   
	              }
	            return path;

	         }            

	      
	      //ajax userList페이징
	      @RequestMapping(value="/userList/{page}/{ch1}/{ch2}",method = {RequestMethod.GET})
	      @ResponseBody
	      public Map<String, Object> getBoardReplyList(Model model, Paging paging, UserVO vo, 
	            @RequestParam(value = "page", defaultValue = "1", required = false) int page,
	            @RequestParam(value = "ch1", required = false) String ch1,
	            @RequestParam(value = "ch2", required = false) String ch2) throws Exception {
	         
	         Map<String, Object> result = new HashMap<String, Object>();
	         int limit = 5;
	         int listcount=0;
	         if(ch1.equals("default")) {
	            listcount = userService.getListCount(vo);
	         } else {
	           
	            paging.setCh1(ch1.replace("'", ""));
	            paging.setCh2(ch2.replace("'", ""));
	            
	            listcount = userService.getSearchCount(paging);
	         }
	         
	         // 총 페이지수
	         int maxpage = (listcount + limit - 1) / limit; // (13 + 9) / 10
	         // 시작 페이지수
	         int startpage = (( page - 1 ) / limit) * limit + 1;
	         // 마지막 페이지수
	         int endpage = startpage + limit - 1;

	         if (endpage > maxpage)
	            endpage = maxpage;
	         
	         int offset = (page - 1) * limit;
	         
	         
	         paging.setLimit(limit);
	         paging.setPage(page);
	         paging.setOffset(offset);
	         paging.setStartpage(startpage);
	         paging.setEndpage(endpage);
	         paging.setMaxpage(maxpage);
	        
	         
	         System.out.println(page);
	         System.out.println(startpage);
	         System.out.println(endpage);
	         System.out.println("pagingch1:"+paging.getCh1());
	         System.out.println(paging.getCh2());
	         
	         if(ch1.equals("default")) {
	            System.out.println("Hi");
	            List<UserVO> userList = userService.replyList(paging);
	            result.put("userList",  userList);
	            result.put("page",  page);
	            result.put("startpage",  startpage);
	            result.put("endpage",  endpage);
	            result.put("maxpage",  maxpage);
	            result.put("limit",  limit);
	            result.put("ListCount", listcount);
	            
	         } else {
	            List<UserVO> userList = userService.replyList(paging);
	            System.out.println(userList.get(0));
	            result.put("userList",  userList);
	            result.put("page",  page);
	            result.put("startpage",  startpage);
	            result.put("endpage",  endpage);
	            result.put("maxpage",  maxpage);
	            result.put("limit",  limit);
	            result.put("ListCount", listcount);
	         }         
	         
	         return result;
	      }

}
