package com.cozy.www.jjim;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class JJimDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//찜 목록
	public List<JJimVO> jjimList(JJimVO vo) {
		return mybatis.selectList("JJimDAO.jjimList", vo);
	}
	
	//찜 중복체크
	public int searchJJim(JJimVO vo) {
		return mybatis.selectOne("JJimDAO.searchJJim", vo);
	}
	
	//찜!
	public int insertJJim(JJimVO vo) {
		return mybatis.insert("JJimDAO.insertJJim", vo);
	}
	
	//찜!
		public int insertListJJim(JJimVO vo) {
			return mybatis.insert("JJimDAO.insertListJJim", vo);
		}
		
		
	//찜 목록에서 삭제
	public int deleteJJim(JJimVO vo) {
		return mybatis.delete("JJimDAO.deleteJJim", vo);
	}
	
	//찜 해제
	public int noJJim(JJimVO vo) {
		return mybatis.delete("JJimDAO.noJJim", vo);
	}
	
	
	
}
