<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="TGMS.SQLconnection"%>
<%
Connection con=null;
 Statement st = null;
 Statement st1 = null;
 ResultSet rs = null;

String sid = request.getParameter("sid");
int action = Integer.parseInt(request.getParameter("action"));
    try {
        
                             con = SQLconnection.getconnection();
                             st = con.createStatement();
                            st1 = con.createStatement();
        switch (action) {
            case 1:
		response.sendRedirect("update_staff.jsp?sid="+sid);
                break;
case 2:
                try {
                    
                    int j = st1.executeUpdate("DELETE from staff where sid='"+sid+"' ");
                    if(j!=0){
                        response.sendRedirect("staff_details.jsp?msg=success");
                    } else {
                        response.sendRedirect("staff_details.jsp?msggg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
                 }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>