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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone_number = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String pwd = request.getParameter("pwd");

        if (phone_number == null || phone_number.trim().isEmpty()) {
            // �û���Ϊ�գ����ش���ҳ��
            request.setAttribute("resultMsg", "�ֻ��Ų���Ϊ��");
            request.getRequestDispatcher("register-error.jsp").forward(request, response);
            return;
        }
        if (phone_number.length() != 11) {
            // �ֻ��Ų����Ϲ涨�����ش���ҳ�沢���ݴ�����Ϣ
            request.setAttribute("resultMsg", "�ֻ��ű���Ϊ11λ��");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            // ����Ϊ�գ����ش���ҳ��
            request.setAttribute("resultMsg", "���벻��Ϊ��");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }
        if (password.length() < 6) {
            // ���벻��������λ�������ش���ҳ��
            request.setAttribute("resultMsg", "���벻��������λ��");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }
        if (!password.equals(pwd)) {
            // �ظ���������벻һ�£����ش���ҳ��
            request.setAttribute("resultMsg", "���벻һ��");
            request.getRequestDispatcher("/register-error.jsp").forward(request, response);
            return;
        }

        try {
            // ����û����Ƿ��Ѵ���
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // �û����Ѵ��ڣ����ش���ҳ��
                request.setAttribute("resultMsg", "�ֻ����Ѵ���");
                request.getRequestDispatcher("/register-error.jsp").forward(request, response);

            } else {
                // �Զ�����id��username
                String id = generateId();
                String username = generateUsername();

                // �������û���Ϣ
                sql = "INSERT INTO user(id, username, phone_number, password) VALUES(?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, id);
                stmt.setString(2, username);
                stmt.setString(3, phone_number);
                stmt.setString(4, password);
                int count = stmt.executeUpdate();

                if (count > 0) {
                    // ע��ɹ�����ת���ɹ�ҳ��
                    response.sendRedirect("index.jsp");
                } else {
                    // ע��ʧ�ܣ���ת������ҳ��
                    response.sendRedirect("register-error.jsp");
                }
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

    // ���������6λ����
    public static String generateId() {
        return String.format("%06d", new Random().nextInt(1000000));
    }

    // ���������6λ��ĸ
    public static String generateUsername() {
        String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder username = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            username.append(letters.charAt(new Random().nextInt(letters.length())));
        }
        return username.toString();
    }
}
