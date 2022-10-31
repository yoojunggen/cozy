package com.cozy.www.jjim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cozy.www.cart.CartVO;

@Service("jjimService")
public class JJimServiceImpl implements JJimService{
	@Autowired
	private JJimDAO jjimDAO;
	
	//찜 목록
	@Override
	public List<JJimVO> jjimList(JJimVO vo) {
		return jjimDAO.jjimList(vo);
	}
	
	//찜 중복체크
	@Override
	public int searchJJim(JJimVO vo) {
		return jjimDAO.searchJJim(vo);
	}
	
	//찜!
	@Override
	public int insertJJim(JJimVO vo) {
		return jjimDAO.insertJJim(vo);
	}
	
	@Override
	public int insertListJJim(JJimVO vo) {
		return jjimDAO.insertListJJim(vo);
	}
	
	//찜 목록에서 삭제
	@Override
	public int deleteJJim(JJimVO vo) {
		return jjimDAO.deleteJJim(vo);
	}
	
	//찜 해제
	@Override
	public int noJJim(JJimVO vo) {
		return jjimDAO.noJJim(vo);
	}

}
