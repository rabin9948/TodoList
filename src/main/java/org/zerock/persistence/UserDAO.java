package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.NewUserVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.boardVO;

public interface UserDAO {
	public void newUser(NewUserVO vo) throws Exception;
	public UserVO login(UserVO vo) throws Exception;
	public String checkUser(NewUserVO vo) throws Exception;
	
	public int checkID(String uid) throws Exception;
	
	public List<boardVO> boardList() throws Exception;
}
