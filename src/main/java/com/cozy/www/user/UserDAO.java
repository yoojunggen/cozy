package com.cozy.www.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cozy.www.cart.CartVO;

@Repository
public class UserDAO {
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   public List<UserVO> list(Paging paging) {
      return sqlSessionTemplate.selectList("UserDAO.list", paging);
   }
   public List<UserVO> replyList(Paging paging) {
      return sqlSessionTemplate.selectList("UserDAO.replyList", paging);
   }
   
   public int getListCount(UserVO vo) {
        return sqlSessionTemplate.selectOne("UserDAO.getListCount", vo);
    }
   public int getSearchCount(Paging paging) {
        return sqlSessionTemplate.selectOne("UserDAO.getSearchCount", paging);
    }
   
   public int insert(UserVO vo) {
      return sqlSessionTemplate.insert("UserDAO.insert", vo);
   }
   
   public int login(UserVO vo) throws Exception {
        return sqlSessionTemplate.selectOne("UserDAO.login", vo);
    }
   
   public List<UserVO> myInfo(UserVO vo) {
      return sqlSessionTemplate.selectList("UserDAO.myInfo", vo);
   }
   
   public List<CartVO> getCartList(CartVO cvo) {
      return sqlSessionTemplate.selectList("UserDAO.getCartList", cvo);
   }
   
   public int idChk(UserVO vo) throws Exception{
      return sqlSessionTemplate.selectOne("UserDAO.idChk", vo);
   }
   
   public int update(UserVO vo) {
      return sqlSessionTemplate.update("UserDAO.update", vo);
   }
   
   public List<UserVO> adupdateForm(String uid) {
      return sqlSessionTemplate.selectList("UserDAO.adupdateForm", uid);
   }
   
   public int adupdate(UserVO vo) {
      return sqlSessionTemplate.update("UserDAO.adupdate", vo);
   }
   
   public int aduserDelete(String uid) {
      return sqlSessionTemplate.delete("UserDAO.aduserDelete", uid);
   }
   
   public int userPwd(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.userPwd", vo);
   }
   
   public int userDeleteForm(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.userDeleteForm", vo);
   }
   
   public int userDelete(UserVO vo) {
      return sqlSessionTemplate.delete("UserDAO.userDelete", vo);
   }
   
   public int selectYear(UserVO vo) {
       return sqlSessionTemplate.selectOne("UserDAO.selectYear", vo);
   }
   
   public int selectCategory(UserVO vo) {
       return sqlSessionTemplate.selectOne("UserDAO.selectCategory", vo);
   }
   
   public int dogCategory(UserVO vo) {
         return sqlSessionTemplate.selectOne("UserDAO.dogCategory", vo);
   }
   
   public int otherCategory(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.otherCategory", vo);
   }
   
   public int joinToday(UserVO vo) {
       return sqlSessionTemplate.selectOne("UserDAO.joinToday", vo);
   }
   
   public int totalToday(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.totalToday", vo);
   }
   
   public int orderCount(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.orderCount", vo);
   }
   
   public int productCount(UserVO vo) {
      return sqlSessionTemplate.selectOne("UserDAO.productCount", vo);
   }
   
   public int findpwd(UserVO vo) throws Exception {
        return sqlSessionTemplate.selectOne("UserDAO.findpwd", vo);
   }
   
   public int pwdUpdate(UserVO vo) {
      return sqlSessionTemplate.update("UserDAO.pwdUpdate", vo);
   }
   
   public String findid(UserVO vo) throws Exception{
      return sqlSessionTemplate.selectOne("UserDAO.findid", vo);
   }
   
   
}