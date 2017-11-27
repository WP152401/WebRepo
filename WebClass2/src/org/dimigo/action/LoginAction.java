package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.util.CommonUtil;
import org.dimigo.vo.UserVO;

public class LoginAction implements IAction {
	
	private void validate(String id, String pwd) throws Exception {
		if(CommonUtil.isEmpty(id)) throw new Exception("아이디를 입력하세요.");
		if(CommonUtil.isEmpty(pwd)) throw new Exception("비밀번호를 입력하세요.");
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		try {
			// 1. Extract input value
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.printf("id : %s, pwd : %s\n", id, pwd);
			
			// 2. Checking Validation
			validate(id, pwd);
			
			// Check if ID & Password is validated (Identification)
			boolean result = true;
			
			if(result) {
				// Creating and storing user's information in session
				HttpSession session = request.getSession();
				UserVO user = new UserVO();
				user.setId(id);
				user.setName("QBE");
				user.setNickname("Cutty");
				
				session.setAttribute("user", user);
				
				// Forwarding to home.jsp
				RequestDispatcher rd = request.getRequestDispatcher("jsp/home.jsp");
				rd.forward(request, response);
			} else {
				throw new Exception("아이디와 비밀번호가 올바르지 않습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
	}
	
}
