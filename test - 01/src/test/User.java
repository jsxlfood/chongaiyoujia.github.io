package test;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class User extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Connection conn;

    public void init() throws ServletException {
        // �������ݿ�����
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }

        // �������ݿ�����
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
            // �û�δ��¼����ת����¼ҳ��
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // ��ѯ�û���Ϣ
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");

                // ���û�ҳ����ʾ�û���Ϣ
                request.setAttribute("id", id);
                request.setAttribute("username", username);
                request.setAttribute("phone_number", phone_number);
                request.getRequestDispatcher("user.jsp").forward(request, response);
            } else {
                // �ֻ��Ų����ڣ���ת������ҳ��
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    public void destroy() {
        // �ر����ݿ�����
        try {
            conn.close();
        } catch (SQLException e) {
            // ignore
        }
    }
}
