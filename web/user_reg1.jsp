<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="TGMS.SQLconnection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("dob");
    String address = request.getParameter("address");
    String pass = request.getParameter("pass");


    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("current Date " + time);


    System.out.println("name : " + name + "\n pass : " + pass + "\n email : " + email + "\n phone : " + phone + " \n address : " + address);
    Connection con = SQLconnection.getconnection();
    Statement statement = con.createStatement();
    try {
        int in = statement.executeUpdate("INSERT INTO users(name,email,dob,gender,address,phone,pass,time)values('" + name + "','" + email + "','" + dob + "','" + gender + "','" + address + "','" + phone + "','" + pass + "','" + time + "')");
        if (in != 0) {
            response.sendRedirect("User.jsp?msg=success");
        } else {
            response.sendRedirect("user_reg.jsp?msg=Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
