package org.zerock.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.NewUserVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.boardVO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.UserMapper";
	
	@Override
	public void newUser(NewUserVO vo) throws SQLException{
		session.insert(namespace+".newUser",vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return session.selectOne(namespace+".login", vo);
	}
	
	
	@Override
	public String checkUser(NewUserVO vo) {
		return session.selectOne(namespace+".checkUser", vo);
	}
	
	@Override
	public int checkID(String uid) throws Exception{
		return session.selectOne(namespace+".checkID", uid);
	}
	
	@Override
	public List<boardVO> boardList() throws Exception{
		return session.selectList(namespace+".boardList");
	}
}
