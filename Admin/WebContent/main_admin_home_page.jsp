<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- App favicon -->
    <link rel="shortcut icon" href="image/favicons.ico">

    <title>ADMIN HOME PAGE</title>

    <!-- App -->
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">

    <!-- custombox.min -->
    <link href="css/custombox.min.css" rel="stylesheet">

    <!-- Icons Font -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  <body>
      <!-- Begin page -->
  <div id="main_class">

        <!-- <?php include 'include/topbar.php' ?> -->
        <!-- Top Bar Start -->
  <div class="topbar">

        <!--Logo -->
        <div class="topbar-left">
          <div class="text-center">
            <a href="manage_toll.jsp" class="logo">Toll Authority</a>
          </div>
        </div>
        <!-- End Logo -->
      
        <!-- Button mobile view to collapse sidebar menu -->
        <div class="navbar navbar-default" role="navigation">
      
          <div class="container">
      
          <!-- Header Part (Right Side) -->
          <ul class="nav navbar-nav navbar-right">
      
            <li class="dropdown user-box">
              <a href="#" class="dropdown-toggle profile" data-toggle="dropdown" aria-expanded="false">
                <h5>Welcome</h5>
              </a>
      
              <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                <li><a href="logout.html"><i class="ti-power-off m-r-5"></i>Logout</a></li>
              </ul>
            </li>
            
          </ul>
          <!-- Header Part (Right Side) -->
          </div>
        </div>
        <!-- End Top -->
      
        </div>
      <!-- End Topbar -->
        <!-- <?php include 'include/sidebar.php' ?> -->

        <!-- ========== Left Sidebar Start ========== -->
        <div class="left side-menu">
                <div class="sidebar-inner">
  
                    <div class="user-panel" id="sidebar-menu">
                      <ul>
                        <li class="has_sub">
                            <a href="Generate_report.jsp"><i class="mdi mdi-bus-school"></i><span>Toll Display</span></a>
                        </li>
                          
                        <li class="has_sub">
                            <a href="add_toll_collector.jsp"><i class="mdi mdi-account"></i><span>Add Toll Collector</span></a>
                        </li>
  
                        <li class="has_sub">
                            <a href="toll_price.jsp"><i class="md mdi mdi-clipboard"></i><span>Update Toll Details</span></a>
                        </li>
  
                        <!-- <li class="has_sub">
                            <a href="request.php"><i class="mdi mdi-share"></i><span>Request</span></a>
                        </li>
  
                        <li class="has_sub">
                            <a href="quotation.php"><i class="mdi mdi-comment-question-outline"></i><span>Quotation</span></a>
                        </li>
  
                        <li class="has_sub">
                            <a href="order.php"><i class="mdi mdi-reorder-horizontal"></i><span>Order</span></a>
                        </li>
                        
                      </ul> -->
  
                    </div>
                </div>
            </div>
    
    
        <div class="content-page">
              <!-- Content Start -->
              <div class="content">
                <!-- Container Start -->
                <div class="container">
    
    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="background-image">
                                
                            </div>
                        </div>
                    </div>
    
                </div>
            </div>
    
      </div>
      <!-- End Begin page -->
    	<!-- js placed at the end of the document so the pages load faster -->
  	<script src="js/jquery-2.1.4.min.js"></script>
  	<script src="js/bootstrap.min.js"></script>

  	<!-- jquery.easing.1.3.min -->
  	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- form validation -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.77/jquery.form-validator.min.js"></script>

  	<!-- Main js -->
      <script src="js/Main.js"></script>
  </body>
</html>
    