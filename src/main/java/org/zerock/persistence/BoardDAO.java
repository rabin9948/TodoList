package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.boardVO;

public interface BoardDAO {
	public List<boardVO> listPage(int page)throws Exception;
	
	public List<boardVO> listCriteria(Criteria cri) throws Exception;
	
	
	public int totalCount(Criteria cri) throws Exception;
	public boardVO read(int bno) throws Exception;
	public void remove(int bno) throws Exception;
	public void addBoard(boardVO vo) throws Exception;
	
	public List<boardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int totalSearchCount(SearchCriteria cri) throws Exception;
	
}
