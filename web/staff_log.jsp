<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="TGMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    System.out.println("Check User name And Password : " + name + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM staff where sid='" + name + "' AND password='" + pass+ "' AND statuss='Active'" );
        if (rs.next()) {
          session.setAttribute("sid", rs.getString("sid"));
          session.setAttribute("bid", rs.getString("branch"));
          session.setAttribute("mail", rs.getString("email"));
          session.setAttribute("uname", rs.getString("name"));
                response.sendRedirect("staff_home.jsp?success");
            }else{
                response.sendRedirect("Staff.jsp?authentication_Failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>