package com.cozy.www.jjim;

import java.util.List;


public interface JJimService {
	
	
	List<JJimVO> jjimList(JJimVO vo); //찜 목록
	
	int searchJJim (JJimVO vo); //찜 중복체크
	
	int insertJJim(JJimVO vo); //찜!
	
	int insertListJJim(JJimVO vo); //찜!
	
	int deleteJJim(JJimVO vo); //찜 목록에서 삭제
	
	int noJJim(JJimVO vo); //찜 해제

}
