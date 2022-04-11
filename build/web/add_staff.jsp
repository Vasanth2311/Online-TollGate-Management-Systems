<%@page import="TGMS.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
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
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link rel="stylesheet" href="Admin/css/style.css">
        <link href="assets/fonts/css/fontawesome-all.min.css" rel="stylesheet" />
        <link href="assets/fonts/css/fontawesome-all.css" rel="stylesheet" />
    </head>
    <%
        String uid = (String) session.getAttribute("uid");
        String uname = (String) session.getAttribute("uname");
        Random RANDOM = new SecureRandom();
        int PASSWORD_LENGTH = 5;
        String letters = "0123456789";
        String pid = "";
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = (int) (RANDOM.nextDouble() * letters.length());
            pid += letters.substring(index, index + 1);
        }
        String sidno = "STAFF" + pid;
    %>

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
                                <p>Fare Detail</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="toll_details.jsp">
                                <i class="forward"></i>
                                <p>Toll Gate Details</p>
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
                            <a class="nav-link" href="online.jsp">
                                <i class="forward"></i>
                                <p>Online Transactions</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="Entry.jsp">
                                <i class="forward"></i>
                                <p>Entry Details</p>
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
                        <div class="row">
                            <div class="login-wrap">
                                <h2>Add Staff</h2>

                                <div class="form">
                                    <form action="staff_reg.jsp" method="post" >
                                        <input type="text" placeholder="<%=sidno%>" value="<%=sidno%>"  name="sid" />
                                        <input type="text" placeholder="Name" name="name" />
                                        <input type="text" placeholder="Email Id" name="email" />
                                        <input type="text" placeholder="Phone" name="phone" />
                                        <input type="date" placeholder="dob" name="dob" />
                                        <textarea name="address" placeholder="Address"></textarea>
                                        <input type="text" placeholder="Salary" name="salary" />
                                        
                                        <select name="branch" required="">
                                            <option value="#">Select the branch Code</option>
                                             <%
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("Select sno from toll_details");
                                while(rs.next()) {
                        %>
                                            <option value="<%=rs.getString("sno")%>"><%=rs.getString("sno")%></option>
                                            <%                                        }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                                        </select>
                                        <select name="shift">
                                            <option value="Night">Night</option>
                                            <option value="Day">Day</option>
                                        </select>
                                        <button type="submit">Upload</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>
    <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Chartist Plugin  -->
    <script src="assets/js/plugins/chartist.min.js"></script>
    <script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
    <script src="assets/js/demo.js"></script>
    <script src="Admin/js/index.js"></script>
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
