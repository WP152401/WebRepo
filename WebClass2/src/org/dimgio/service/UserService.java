package org.dimgio.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.dimigo.dao.UserDao;
import org.dimigo.vo.UserVO;

import com.mysql.jdbc.PreparedStatement;

public class UserService extends AbstractService{
	public UserVO login(UserVO user) throws Exception{
		Connection conn = null;
			try{
				conn = getConnection();
				UserDao dao = new UserDao(conn);
				UserVO result = dao.searchUser(user);
				
				if(result == null)
					throw new Exception("Invalid username or password");
				
					return result;
			}finally{
				if (conn != null) conn.close();
			}
	}
	public List<UserVO> searchUserList() throws Exception{
		Connection conn = null;
		try{
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			
			return dao.searchUserList()
		} finally  {
			if (conn != null) conn.close();
		}
	}
	public List<UserVO> serchUserList()throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT ID, NAME, NICKNAME FROM USER";
		try{
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			UserVO result = null;
			List<UserVO> list = new ArrayList<>();
			while(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(2));
				result.setNickname(rs.getString(3));
				list.add(result);
			}
		}
	}
}
