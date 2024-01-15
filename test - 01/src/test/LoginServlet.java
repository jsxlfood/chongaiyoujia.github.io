package test;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;



public class LoginServlet extends HttpServlet {

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

        if (phone_number == null || phone_number.trim().isEmpty()) {
            // �ֻ���Ϊ�գ����ش���ҳ��
        	 request.setAttribute("resultMsg", "�ֻ��Ų���Ϊ��");
             request.getRequestDispatcher("login-error.jsp").forward(request, response);
             return;
        }

        if (password == null || password.trim().isEmpty()) {
            // ����Ϊ�գ����ش���ҳ��
        	 request.setAttribute("resultMsg", "���벻��Ϊ��");
             request.getRequestDispatcher("login-error.jsp").forward(request, response);
             return;
        }

        try {
            // ��ѯ�û���Ϣ����֤�����Ƿ���ȷ
            String sql = "SELECT * FROM user WHERE phone_number=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone_number);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String pwd = rs.getString("password");
                if (pwd.equals(password)) {
                    // ��¼�ɹ�����ת���ɹ�ҳ��
                	String userNm = rs.getString("username"); 
                	String userId = rs.getString("id"); 
                	String userPhone = rs.getString("phone_number");   
                    HttpSession session = request.getSession();
                    session.setAttribute("userNm", userNm);
                    session.setAttribute("userId", userId);
                    session.setAttribute("userPhone", userPhone);
                    response.sendRedirect("index.jsp");
                   
                } else {
                    // ���������ת������ҳ��
                	 request.setAttribute("resultMsg", "�������");
                     request.getRequestDispatcher("login-error.jsp").forward(request, response);
                     return;
                }
            } else {
                // �ֻ��Ų����ڣ���ת������ҳ��
            	 request.setAttribute("resultMsg", "�ֻ��Ų�����");
                 request.getRequestDispatcher("login-error.jsp").forward(request, response);
                 return;
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

