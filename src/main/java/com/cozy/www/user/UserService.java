package com.cozy.www.user;

import java.util.List;

import com.cozy.www.cart.CartVO;

public interface UserService {
   public List<UserVO> list(Paging paging);
   public List<UserVO> replyList(Paging paging);
   public int getListCount(UserVO vo);
   public int getSearchCount(Paging paging);
   public int selectCategory(UserVO vo);
   public int dogCategory(UserVO vo);
   public int otherCategory(UserVO vo);      
   public int joinToday(UserVO vo);
   public int totalToday(UserVO vo);
   public int orderCount(UserVO vo);
   public int productCount(UserVO vo);
   public int insert(UserVO vo);
   public int login(UserVO vo) throws Exception;
   public List<UserVO> myInfo(UserVO vo);
   public List<CartVO> getCartList(CartVO cvo);
   public int idChk(UserVO vo) throws Exception;
   public int update(UserVO vo);
   public List<UserVO> adupdateForm(String uid);
   public int adupdate(UserVO vo);
   public int aduserDelete(String uid);
   public int userPwd(UserVO vo);
   public int userDeleteForm(UserVO vo);
   public int userDelete(UserVO vo);
   public int selectYear(UserVO vo);
   public int findpwd(UserVO vo) throws Exception;
   public int pwdUpdate(UserVO vo);
   public String findid(UserVO vo) throws Exception;
}