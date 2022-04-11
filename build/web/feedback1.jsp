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

    String feedback = request.getParameter("feedback");


    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("current Date " + time);


    System.out.println("tid : " + tid + "\n tname : " + tname + "\n t_sec : " + t_sec + "\n uid : " + uid + " \n feedback : " + feedback);
    Connection con = SQLconnection.getconnection();
    Statement statement = con.createStatement();
    try {
        int in = statement.executeUpdate("INSERT INTO feedback(uid,uname,umail,toll_id,toll_name,toll_section,feedback,time)values('" + uid + "','" + uname + "','" + umail + "','" + tid + "','" + tname + "','" + t_sec + "','" + feedback + "','" + time + "')");
        if (in != 0) {
            response.sendRedirect("user_home.jsp?msg=Feedback_success");
        } else {
            response.sendRedirect("user_home.jsp?msg=Feedback_Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
