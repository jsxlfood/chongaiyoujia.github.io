package test;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;



public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    

    private Connection conn;

    public void init() throws ServletException {
        // 加载数据库驱动
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }

        // 建立数据库连接
        String url = "jdbc:mysql://localhost:3306/register";
        String username = "root";
        String password = "123456";
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String phone_number = request.getParameter("phone_number");
        String password = request.getParameter("password");

        if (phone_number == null || phone_number.trim().isEmpty()) {
            // 手机号为空，返回错误页面
        	 request.setAttribute("resultMsg", "手机号不能为空");
             request.getRequestDispatcher("login-error.jsp").forward(request, response);
             return;
        }

        if (password == null || password.trim().isEmpty()) {
            // 密码为空，返回错误页面
        	 request.setAttribute("resultMsg", "密码不能为空");
             request.getRequestDispatcher("login-error.jsp").forward(request, response);
             return;
        }

        try {
            // 查询用户信息并验证密码是否正确
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String pwd = rs.getString("password");
                if (pwd.equals(password)) {
                    // 登录成功，跳转到成功页面
                	String userNm = rs.getString("username"); 
                	String userId = rs.getString("id"); 
                	String userPhone = rs.getString("phone_number");   
                    HttpSession session = request.getSession();
                    session.setAttribute("userNm", userNm);
                    session.setAttribute("userId", userId);
                    session.setAttribute("userPhone", userPhone);
                    response.sendRedirect("index.jsp");
                   
                } else {
                    // 密码错误，跳转到错误页面
                	 request.setAttribute("resultMsg", "密码错误");
                     request.getRequestDispatcher("login-error.jsp").forward(request, response);
                     return;
                }
            } else {
                // 手机号不存在，跳转到错误页面
            	 request.setAttribute("resultMsg", "手机号不存在");
                 request.getRequestDispatcher("login-error.jsp").forward(request, response);
                 return;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    public void destroy() {
        // 关闭数据库连接
        try {
            conn.close();
        } catch (SQLException e) {
            // ignore
        }
    }
}

