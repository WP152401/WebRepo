package org.dimigo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.dimigo.vo.UserVO;

public class UserDao {

	private Connection conn = null;
	
	public UserDao(Connection conn){
		this.conn = conn;
	}
	
	public UserVO searchUser(UserVO vo) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM USER WHERE ID=?' AND PWD = ? ";
		try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2,vo.getName());
				
				rs = pstmt.executeQuery();
		
				UserVO result = null;
				if (rs.next()){
					result = new UserVO();
					result.setId(rs.getString(1));
					result.setName(rs.getString(3));
					result.setNickname(rs.getString(4));
				}
				System.out.println(result);
				return result;
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("사용자 조회 시 오류가 발생했습니다.");
		} finally{
			if (rs != null) rs.close();
			if(pstmt !=null) pstmt.close();
		}
	}
	

}
