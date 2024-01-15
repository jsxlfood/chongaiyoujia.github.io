package test;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class User extends HttpServlet {

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String phone_number = (String) session.getAttribute("phone_number");

        if (phone_number == null || phone_number.trim().isEmpty()) {
            // 用户未登录，跳转到登录页面
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 查询用户信息
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");

                // 在用户页面显示用户信息
                request.setAttribute("id", id);
                request.setAttribute("username", username);
                request.setAttribute("phone_number", phone_number);
                request.getRequestDispatcher("user.jsp").forward(request, response);
            } else {
                // 手机号不存在，跳转到错误页面
                response.sendRedirect("error.jsp");
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
