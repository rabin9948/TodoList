package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.boardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.UserMapper";
	
	public List<boardVO> listPage(int page)throws Exception{
		if(page <= 0){
			page = 1;
		}
		
		page = (page-1) * 10;
		return session.selectList(namespace+".listPage", page);
	}
	
	
	public List<boardVO> listCriteria(Criteria cri) throws Exception{
		
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	public int totalCount(Criteria cri) throws Exception{
		return session.selectOne(namespace+".totalCount", cri);
	}
	
	public boardVO read(int bno) throws Exception{
		return session.selectOne(namespace+".read", bno);
	}
	
	public void remove(int bno) throws Exception{
		session.delete(namespace+".remove", bno);
	}
	
	public void addBoard(boardVO vo) throws Exception{
		session.insert(namespace+".addBoard", vo);
	}
	
	public List<boardVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return session.selectList(namespace+".listSearchCriteria", cri);
	}
	
	public int totalSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace+".totalSearchCount", cri);
	}
}
