<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection"%>
<%@page import="TGMS.SQLconnection"%>
<%
String uid =request.getParameter("id");
String single =request.getParameter("single");
String retun = request.getParameter("retun");
String daily = request.getParameter("daily");
String fifty = request.getParameter("fifty");
String monthly = request.getParameter("monthly");

Connection con = SQLconnection.getconnection();
Statement st = con.createStatement();
        
try{
    int i = st.executeUpdate("update fare_details set single ='"+single+"', returns ='"+retun+"', daily_pass ='" +daily+ "', fifty_trip='"+fifty+"', monthly='"+monthly+"' where sid = '"+uid+"'");
if(i!=0){
response.sendRedirect("fare_detail.jsp?msg=Update_Success");

}
       else{
        response.sendRedirect("fare_detail.jsp?msg=Update_Failed");
       }

}
catch(Exception ex)
               {
    ex.printStackTrace();
}
%>