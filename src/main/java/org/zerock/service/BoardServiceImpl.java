package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.boardVO;
import org.zerock.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public List<boardVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	public int totalCount(Criteria cri) throws Exception{
		return dao.totalCount(cri);
	}
	
	
	public boardVO read(int bno) throws Exception{
		return dao.read(bno);
	}
	
	public void remove(int bno) throws Exception{
		dao.remove(bno);
	}
	
	
	public void addBoard(boardVO vo) throws Exception{
		dao.addBoard(vo);
	}
	
	public List<boardVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearchCriteria(cri);
	}
	
	public int totalSearchCount(SearchCriteria cri) throws Exception{
		return dao.totalSearchCount(cri);
	}
}
