<%@page import="java.sql.ResultSet"%>
<%@page import="TGMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <link href="assets/slider.css" rel="stylesheet" />
    <link href="assets/fonts/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="assets/fonts/css/fontawesome-all.css" rel="stylesheet" />
    <link rel="stylesheet" href="Admin/css/style.css">
</head>
<style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even){background-color: #f2f2f2;}

        #customers tr:hover {background-color: #ddd;}

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="" class="simple-text">
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="admin_home.jsp">
                            <i class="home"></i>
                            <p>Home Page</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admin_profile.jsp">
                            <i class="user-circle"></i>
                            <p>Profile</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="fare_detail.jsp">
                            <i class="rupee-sign"></i>
                            <p>Fare Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="toll_details.jsp">
                            <i class="forward"></i>
                            <p>Toll Gate Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="branch_details.jsp">
                            <i class="forward"></i>
                            <p>Branch Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="add_staff.jsp">
                            <i class="forward"></i>
                            <p>Add Staff</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="staff_details.jsp">
                            <i class="forward"></i>
                            <p>Staff Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="cus_details.jsp">
                            <i class="forward"></i>
                            <p>Customer Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="cus_feedback.jsp">
                            <i class="newspaper"></i>
                            <p>Customer Feedback</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="index.jsp">
                            <i class="lock"></i>
                            <p>Logout</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500" style="background-color: #834dbc">
                    <center><h4 style="color: #fff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Online Toll Gate Management System</h4></center>
                </nav>
                <!-- End Navbar -->
                <div class="content">
                    <div class="container-fluid">
                        <button type="button" onClick="window.print()" style="float: right" >Make Report</button>
                        <div class="row">
                            <table id="customers">
  <tr>
    <th>User Id</th>
    <th>Transaction Id</th>
    <th>Toll Id</th>
    <th>Toll Name</th>
    <th>Vehicle Type</th>
    <th>Plan</th>
    <th>Date & Time</th>
    <th>Rate</th>
    
    
  </tr>
   <tr class="titlerow">
       <%                        String search =request.getParameter("search");
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("Select * from ticket where toll_id='"+search+"' ");
                                while (rs.next()) {
                        %>
                        <td class="rowDataSd"><%=rs.getString("uid")%></td>
                        <td class="rowDataSd"><%=rs.getString("trans")%></td>
                        <td class="rowDataSd"><%=rs.getString("toll_id")%></td>
                        <td class="rowDataSd"><%=rs.getString("toll_name")%></td>
                        <td class="rowDataSd"><%=rs.getString("type")%></td>
                        <td class="rowDataSd"><%=rs.getString("plan")%></td>
                        <td class="rowDataSd"><%=rs.getString("time")%></td>
                        <td class="rowDataSd"><%=rs.getString("rate")%></td>
  </tr>
                    <%                                        }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                    <tr class="totalColumn">
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                        <td class="totalCol"></td>
                    </tr>
                </table>
                            
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<script src="assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.showNotification();

    });
</script>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</html>
