package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/bloglogin" })
public class BlogLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // login.jsp ������
      RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp"); // WebClass �������� ��θ� ã��
      rd.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String id = request.getParameter("id");
      String pwd = request.getParameter("psd");
      System.out.printf("id : %s pwd : %s\n", id, pwd);
      
      response.setContentType("text/html; charset=utf-8");
      // id, pwd ���ռ� üũ
      boolean result = true;
      
      if(id.equals("test@naver.com")) {
         // ���ǿ� ����� ���� ����
         HttpSession session = request.getSession();
         UserVO user = new UserVO();
         user.setId(id);
         user.setName("a");
         user.setNickname("ab");
         session.setAttribute("user", user);
         
         RequestDispatcher rd = request.getRequestDispatcher("/myblog/blog.jsp"); // WebClass �������� ��θ� ã��
         rd.forward(request, response);
      } else {
         request.setAttribute("msg", "error");
         RequestDispatcher rd = request.getRequestDispatcher("/myblog/LogIn.jsp");
         rd.forward(request, response);
      }
   }
   
   protected void doPost2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      System.out.printf("id : %s pwd : %s\n", id, pwd);
      
      response.setContentType("application/json charset=utf-8");
      PrintWriter out = response.getWriter();
      // �밡��
      /*
       * {
       *       "id" : id
       * }
       */
//      out.println("{");
//      out.println("\"id\":" + "\"" + id + "\"");
//      out.println("}");
      
      // JSON Simple Library
//      JSONObject json = new JSONObject();
//      json.put("id", id);
//      out.write(json.toJSONString());
//      System.out.println(json.toJSONString());
      
      // Gson Library
      Gson gson = new Gson();
      JsonObject json = new JsonObject();
      json.addProperty("id", id);
      out.write(gson.toJson(json));
      System.out.println(gson.toJson(json));
      
      out.close();
   }

}