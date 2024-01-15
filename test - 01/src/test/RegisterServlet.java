package test;

import java.io.*;
import java.sql.*;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

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
        String pwd = request.getParameter("pwd");

        if (phone_number == null || phone_number.trim().isEmpty()) {
            // 用户名为空，返回错误页面
            request.setAttribute("resultMsg", "手机号不能为空");
            request.getRequestDispatcher("register-error.jsp").forward(request, response);
            return;
        }
        if (phone_number.length() != 11) {
            // 手机号不符合规定，返回错误页面并传递错误信息
            request.setAttribute("resultMsg", "手机号必须为11位数");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            // 密码为空，返回错误页面
            request.setAttribute("resultMsg", "密码不能为空");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }
        if (password.length() < 6) {
            // 密码不能少于六位数，返回错误页面
            request.setAttribute("resultMsg", "密码不能少于六位数");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }
        if (!password.equals(pwd)) {
            // 重复密码和密码不一致，返回错误页面
            request.setAttribute("resultMsg", "密码不一致");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }

        try {
            // 检查用户名是否已存在
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // 用户名已存在，返回错误页面
                request.setAttribute("resultMsg", "手机号已存在");
                request.getRequestDispatcher("/register-error.jsp").forward(request, response);

            } else {
                // 自动生成id和username
                String id = generateId();
                String username = generateUsername();

                // 插入新用户信息
                sql = "INSERT INTO user(id, username, phone_number, password) VALUES(?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, id);
                stmt.setString(2, username);
                stmt.setString(3, phone_number);
                stmt.setString(4, password);
                int count = stmt.executeUpdate();

                if (count > 0) {
                    // 注册成功，跳转到成功页面
                    response.sendRedirect("index.jsp");
                } else {
                    // 注册失败，跳转到错误页面
                    response.sendRedirect("register-error.jsp");
                }
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

    // 生成随机的6位数字
    public static String generateId() {
        return String.format("%06d", new Random().nextInt(1000000));
    }

    // 生成随机的6位字母
    public static String generateUsername() {
        String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder username = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            username.append(letters.charAt(new Random().nextInt(letters.length())));
        }
        return username.toString();
    }
}
