<%@page import="TGMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
                        <a class="nav-link" href="staff_home.jsp">
                            <i class="home"></i>
                            <p>Home Page</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="user_entry.jsp">
                            <i class=""></i>
                            <p>Users Entry</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="daily.jsp">
                            <i class=""></i>
                            <p>All Entries</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="online_users.jsp">
                            <i class=""></i>
                            <p>Online Users</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="index.jsp">
                            <i class=""></i>
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
                        <div class="row">
                            <table id="customers">
                                <%  String id =(String)session.getAttribute("bid");
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("Select * from toll_details where sno='" + id + "'");
                                        if (rs.next()) {
                                            String tid =rs.getString("sno");
                                            session.setAttribute("ttid", tid );
                                            String tname =rs.getString("toll_name");
                                             session.setAttribute("ttname", tname );
                                            String t_sec =rs.getString("section");
                                            session.setAttribute("tt_sec", t_sec );
                                %>
                                <H1>Vehicle Entry Form</H1>
                                <tr>
                                <th>Branch No</th>
                                <td class="btn" style=" background-color: #009688; color: white"><%=rs.getString("sno")%></td>
                                </tr>
                                <tr>
                                <th>State</th>
                                <td><%=rs.getString("state")%></td>
                                </tr>
                                <tr>
                                <th>NH Number</th>
                                <td><%=rs.getString("NH_no")%></td>
                                </tr>
                                <tr>
                                <th>Toll Name</th>
                                <td><%=rs.getString("toll_name")%></td>
                                </tr>
                                <tr>
                                <th>Toll KM</th>
                                <td><%=rs.getString("toll_location")%></td>
                                </tr>
                                <tr>
                                <th>Section</th>
                                <td><%=rs.getString("section")%></td>
                                </tr>
                                <form action="payment.jsp" method="get">
                                <tr>
                                <th>Vehicle Number</th>
                                <td><input type="text" name="vnum" placeholder="Enter Vehicle Number"></td>
                                </tr>
                                <tr>
                                <th>Select Vehicle Type</th>
                                <td><select name="type">
                                        <option value="Car,Jeep,Van,LMV,Three wheelers">Car,Jeep,Van,LMV,Three wheelers</option>
                                        <option value="LCV,LGV,MiniBus">LCV,LGV,MiniBus</option>
                                        <option value="2 axle - Truck / Bus">2 axle - Truck / Bus</option>
                                        <option value="3 axle commercial vehicle">3 axle commercial vehicle</option>
                                        <option value="Heavy Construction Machinery /Earth Moving Equipments / Multi axle vehicles">Heavy Construction Machinery /Earth Moving Equipments / Multi axle vehicles</option>
                                        <option value="Over Sized Vehicles- 7 or more axles">Over Sized Vehicles- 7 or more axles</option>
                                    </select></td>
                                </tr>
                                <tr>
                                <th>Select Plan</th>
                                <td><select name="plan">
                                        <option value="single">Single</option>
                                        <option value="returns">Return</option>
                                        <option value="daily_pass">Daily Pass</option>
                                        <option value="fifty_trip">Fifty Trip</option>
                                        <option value="monthly">Monthly</option>
                                    </select></td>
                                </tr>
                                <tr>
                                <th></th>
                                <td><button class="btn" type="submit" style=" background-color: #009688; color: white">Submit</button></td>
                                </tr>
                                </form>
                                
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
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