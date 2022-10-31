package com.cozy.www.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cozy.www.cart.CartVO;

@Service("userService")
public class UserServiceImpl implements UserService {
   @Autowired
   private UserDAO userDAO;
   
   @Override
   public List<UserVO> list(Paging paging) {
      return userDAO.list(paging);
   }
   
   @Override
   public List<UserVO> replyList(Paging paging) {
      return userDAO.replyList(paging);
   }
   @Override
   public int getListCount(UserVO vo) {
      return userDAO.getListCount(vo);
   }
   @Override
   public int selectCategory(UserVO vo) {
      return userDAO.selectCategory(vo);
   }
   
   @Override
   public int dogCategory(UserVO vo) {
      return userDAO.dogCategory(vo);
   }
   @Override
   public int otherCategory(UserVO vo) {
      return userDAO.otherCategory(vo);
   }
   
   @Override
   public int joinToday(UserVO vo) {
      return userDAO.joinToday(vo);
   }
   @Override
   public int totalToday(UserVO vo) {
      return userDAO.totalToday(vo);
   }
   @Override
   public int orderCount(UserVO vo) {
      return userDAO.orderCount(vo);
   }
   @Override
   public int productCount(UserVO vo) {
      return userDAO.productCount(vo);
   }
   @Override
   public int getSearchCount(Paging paging) {
      return userDAO.getSearchCount(paging);
   }

   @Override
   public int insert(UserVO vo) {
      return userDAO.insert(vo);
   }
   
   @Override
    public int login(UserVO vo) 
          throws Exception {
       return userDAO.login(vo);
   }
   
   @Override
   public List<UserVO> myInfo(UserVO vo) {
      return userDAO.myInfo(vo);
   }
   
   @Override
   public List<CartVO> getCartList(CartVO cvo) {
      return userDAO.getCartList(cvo);
   }
   
   @Override
   public int idChk(UserVO vo) throws Exception{
      return userDAO.idChk(vo);
   }
   
   @Override
   public int update(UserVO vo) {
      return userDAO.update(vo);
   }
   
   @Override
   public List<UserVO> adupdateForm(String uid) {
      return userDAO.adupdateForm(uid);
   }
   
   @Override
   public int adupdate(UserVO vo) {
      return userDAO.adupdate(vo);
   }
   
   @Override
   public int aduserDelete(String uid) {
      return userDAO.aduserDelete(uid);
   }
   
   @Override
   public int userPwd(UserVO vo) {
      return userDAO.userPwd(vo);
   }
   
   @Override
   public int userDeleteForm(UserVO vo) {
      return userDAO.userDeleteForm(vo);
   }
   
   @Override
   public int userDelete(UserVO vo) {
      return userDAO.userDelete(vo);
   }
   
   @Override
      public int selectYear(UserVO vo) {
         return userDAO.selectYear(vo);
      }
   
   @Override
    public int findpwd(UserVO vo) 
          throws Exception {
       return userDAO.findpwd(vo);
   }
   
   @Override
   public int pwdUpdate(UserVO vo) {
      return userDAO.pwdUpdate(vo);
   }
   
   @Override
   public String findid(UserVO vo) throws Exception{
      return userDAO.findid(vo);
   }
   
}