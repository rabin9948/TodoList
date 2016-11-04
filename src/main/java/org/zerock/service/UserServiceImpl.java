package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.NewUserVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.boardVO;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;
	
	@Override
	public void newUser(NewUserVO vo)throws Exception{
		dao.newUser(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return dao.login(vo);
	}
	
	@Override
	public String checkUser(NewUserVO vo) throws Exception{
		return dao.checkUser(vo);
	}
	
	@Override
	public int checkID(String uid) throws Exception{
		return dao.checkID(uid);
	}
	
	@Override
	public List<boardVO> boardList() throws Exception{
		return dao.boardList();
	}
}
