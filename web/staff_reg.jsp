<%@page import="TGMS.Mail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="TGMS.SQLconnection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String sid = request.getParameter("sid");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String statuss = "Active";

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("current Date " + time);

    Random RANDOM = new SecureRandom();
    int PASSWORD_LENGTH = 5;
    String letters = "0123456789";
    String pid = "";
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        pid += letters.substring(index, index + 1);
    }
    String pass = "PASS" + pid;

    String salary = request.getParameter("salary");
    String branch = request.getParameter("branch");
    String shift = request.getParameter("shift");


    System.out.println("name : " + name + "\n pass : " + pass + "\n email : " + email + "\n phone : " + phone + " \n address : " + address);
    Connection con = SQLconnection.getconnection();
    Statement statement = con.createStatement();
    try {
        int in = statement.executeUpdate("INSERT INTO staff(sid,name,email,phone,dob,password,time,statuss,salary,branch,shift,address)values('" + sid + "','" + name + "','" + email + "','" + phone + "','" + dob + "','" + pass + "','" + time + "','" + statuss + "','" + salary + "','" + branch + "','" + shift + "','" + address + "')");
        if (in != 0) {
            String msggg="Dear Staff Member Your Account has been activated. User And Password \nUsername "+sid+" \nPassword "+pass;                   
                 Mail ma= new Mail();
            ma.secretMail(msggg,"Downloadkey",email);          
            String msg= "File Download Key:"+msggg;                         
                System.out.println("success");
                System.out.println("success");
            response.sendRedirect("add_staff.jsp?msg=success");
        } else {
            response.sendRedirect("add_staff.jsp?msg=Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
