/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TGMS;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.imageio.ImageIO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author java3
 */
@WebServlet("/admin_detail")
@MultipartConfig(maxFileSize = 16177215)
public class admin_detail extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/otgms";
    private String dbUser = "root";
    private String dbPass = "root";
    private SimpleDateFormat format;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        String name = request.getParameter("name");
        String mail = request.getParameter("email");
        String company = request.getParameter("company");
        //String language = request.getParameter("language");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String pin = request.getParameter("pin");
        String pass = request.getParameter("password");
        String des = request.getParameter("des");
        System.out.println("name" + name + "password" + pass + address + "mail" + mail + "cell" + phone);
        InputStream inputStream = null;
//        Part filePart = request.getPart("dpic");
//        if (filePart != null) {
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//            inputStream = filePart.getInputStream();
//        }
        Connection conn = null;
        String message = null;
        try {

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "Update admin set name=? ,email=?,company=?,address=?,phone=?,city=?,country=?,pincode=?,password=?,des=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, mail);
            statement.setString(3, company);
            statement.setString(4, address);
            statement.setString(5, phone);
            statement.setString(6, city);
            statement.setString(7, country);
            statement.setString(8, pin);


//            if (inputStream != null) {
//                statement.setBlob(9, inputStream);
//            }
            statement.setString(9, pass);
            statement.setString(10, des);
            int row = statement.executeUpdate();
            if (row > 0) {

                response.sendRedirect("admin_profile.jsp?msg=Update Success");
            } else {
                response.sendRedirect("admin_profile.jsp?msg=Update Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}