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
        ResultSet rs = st.executeQuery("SELECT * FROM users where email='" + name + "' AND pass='" + pass+ "' " );
        if (rs.next()) {
          session.setAttribute("uid", rs.getString("id"));
          session.setAttribute("mail", rs.getString("email"));
          session.setAttribute("uname", rs.getString("name"));
                response.sendRedirect("user_home.jsp?success");
            }else{
                response.sendRedirect("User.jsp?authentication_Failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>