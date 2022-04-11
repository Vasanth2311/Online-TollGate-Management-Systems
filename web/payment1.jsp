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
    String tid   = (String)session.getAttribute("ttid");
    String tname =(String)session.getAttribute("ttname");
    String t_sec = (String)session.getAttribute("tt_sec");
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


    System.out.println("tid : " + tid + "\n tname : " + tname + "\n t_sec : " + t_sec + "\n rate : " + rate);
    Connection con = SQLconnection.getconnection();
    Statement statement = con.createStatement();
    try {
        int in = statement.executeUpdate("INSERT INTO daily_entry(toll_id,toll_name,toll_section,type,rate,plan,time,trans,vnum)values('" + tid + "','" + tname + "','" + t_sec + "','" + type + "','" + rate + "','" + plan + "','" + time + "','" + trans + "','" + vnum + "')");
        if (in != 0) {
            response.sendRedirect("staff_home.jsp?msg=entry_success");
        } else {
            response.sendRedirect("staff_home.jsp?msg=entry_Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
