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
    String tid   = (String)session.getAttribute("tid");
    String tname =(String)session.getAttribute("tname");
    String t_sec = (String)session.getAttribute("t_sec");
    String uid = (String)session.getAttribute("uid");
    String uname = (String)session.getAttribute("uname");
    String umail = (String)session.getAttribute("mail");
    String rate = request.getParameter("rate");
    String type = request.getParameter("type");
    String plan = request.getParameter("plan");
    String vnum = request.getParameter("vnum");
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
        String trans = "PAYID" + pid;


    System.out.println("tid : " + tid + "\n tname : " + tname + "\n t_sec : " + t_sec + "\n uid : " + uid + " \n rate : " + rate);
    Connection con = SQLconnection.getconnection();
    Statement statement = con.createStatement();
    try {
        int in = statement.executeUpdate("INSERT INTO ticket(uid,uname,umail,toll_id,toll_name,toll_section,type,rate,plan,time,trans,vnum)values('" + uid + "','" + uname + "','" + umail + "','" + tid + "','" + tname + "','" + t_sec + "','" + type + "','" + rate + "','" + plan + "','" + time + "','" + trans + "','" + vnum + "')");
        if (in != 0) {
                    String msggg="Hi "+uname+" your Payment recived for Vehicle Number : "+vnum+" Toll Access.\nYour Transaction ID :"+trans+" \nThank You.";                   
                 Mail ma= new Mail();
            ma.secretMail(msggg,"Downloadkey",umail);          
            String msg= "File Download Key:"+msggg;                         
                System.out.println("success");
                System.out.println("success");
            response.sendRedirect("user_home.jsp?msg=Booking_success");
        } else {
            response.sendRedirect("user_home.jsp?msg=Booking_Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
