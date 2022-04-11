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
  <tr>
    <th>Vehicle Number</th>
    <th>Transaction Id</th>
    <th>Toll Id</th>
    <th>Toll Name</th>
    <th>Vehicle Type</th>
    <th>Plan</th>
    <th>Date & Time</th>
    <th>Rate</th>
    
    
  </tr>
   <tr class="titlerow">
       <%                        String id =(String)session.getAttribute("bid");
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("Select * from daily_entry where toll_id ='"+id+"'");
                                while (rs.next()) {
                        %>
                        <td class="rowDataSd"><%=rs.getString("vnum")%></td>
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
       var totals=[0,0,0];
        $(document).ready(function(){

            var $dataRows=$("#sum_table tr:not('.totalColumn, .titlerow')");

            $dataRows.each(function() {
                $(this).find('.rowDataSd').each(function(i){        
                    totals[i]+=parseInt( $(this).html());
                });
            });
            $("#sum_table td.totalCol").each(function(i){  
                $(this).html("total:"+totals[i]);
            });

        });
</script>

</html>