<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Home</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <!-- <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'> -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>TeachOnline</h1>
        </header>
        <div class="profile-photo-container">
            <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
            <div class="input-group">
                <button type="submit" class="fa fa-search"></button>
                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>Dashboard</a></li>
                <li><a href="data-visualization.html"><i class="fa fa-bar-chart fa-fw"></i>Charts</a></li>
                <li><a href="data-visualization.html"><i class="fa fa-database fa-fw"></i>Data Visualization</a></li>
                <li><a href="maps.html"><i class="fa fa-map-marker fa-fw"></i>Maps</a></li>
                <li><a href="manage-users.html"><i class="fa fa-users fa-fw"></i>Manage Users</a></li>
                <li><a href="preferences.html"><i class="fa fa-sliders fa-fw"></i>Preferences</a></li>
                <li><a href="login.html"><i class="fa fa-eject fa-fw"></i>Sign Out</a></li>
            </ul>
        </nav>
    </div>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">Admin panel</a></li>
                        <li><a href="">Dashboard</a></li>
                        <li><a href="">Overview</a></li>
                        <li><a href="login.html">Sign in form</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-1 dh">
                    <!-- <i class="fa fa-times"></i> -->
                    <div onclick="openWin()">
                        <h2 class="templatemo-inline-block">测试</h2>
                        <img width="50px" src="images/a.png" style="float:right"  class="img-thumbnail"/>
                        <h3 class="text-uppercase margin-bottom-10" >选择试卷、试卷推送、答题、自动判卷</h3>
                    </div>
                </div>

                <div class="templatemo-content-widget white-bg col-1 dh">
                    <!-- <i class="fa fa-times"></i> -->

                    <h2 class="templatemo-inline-block">讨论</h2>
                    <img width="50px" src="images/b.png" style="float:right"  class="img-thumbnail"/>
                    <h3 class="text-uppercase margin-bottom-10" >小组讨论、单独讨论、课堂讨论、举手、教师提问</h3>

                </div>
                <div class="templatemo-content-widget white-bg col-1 dh">
                    <!-- <i class="fa fa-times"></i> -->

                    <h2 class="templatemo-inline-block">警告</h2>
                    <img width="50px" src="images/c.png" style="float:right"  class="img-thumbnail"/>
                    <h3 class="text-uppercase margin-bottom-10" >违纪行为警告、扣分惩罚</h3>
                </div>
                <!-- <div class="templatemo-content-widget white-bg col-1 text-center">
                  <i class="fa fa-times"></i>
                  <h2 class="text-uppercase">Maris</h2>
                  <h3 class="text-uppercase margin-bottom-10">Design Project</h3>
                  <img src="images/bicycle.jpg"  class="img-thumbnail">
                </div>
                <div class="templatemo-content-widget white-bg col-1">
                  <i class="fa fa-times"></i>
                  <h2 class="text-uppercase">Dictum</h2>
                  <h3 class="text-uppercase">Sedvel Erat Non</h3><hr>
                  <div class="progress">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                  </div>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
                  </div>
                  <div class="progress">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                  </div>
                </div> -->
            </div>
            <%--<div class="templatemo-content-widget white-bg">--%>
                <%--<i class="fa fa-times"></i>--%>
                <%--<div class="media">--%>
                    <%--<div class="media-left">--%>
                        <%--<a href="#">--%>
                            <%--<img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="media-body">--%>
                        <%--<h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>--%>
                        <%--<p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="templatemo-content-widget no-padding">
                <i class="fa fa-times"></i>
                <div class="panel panel-default table-responsive">
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">First Name <span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">Last Name <span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">User Name <span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">Email <span class="caret"></span></a></td>
                            <td>Edit</td>
                            <td>Action</td>
                            <td>Del</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1.</td>
                            <td>John</td>
                            <td>Smith</td>
                            <td>@jS</td>
                            <td>js@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>2.</td>
                            <td>Bill</td>
                            <td>Jones</td>
                            <td>@bJ</td>
                            <td>bj@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>Mary</td>
                            <td>James</td>
                            <td>@mJ</td>
                            <td>mj@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>4.</td>
                            <td>Steve</td>
                            <td>Bride</td>
                            <td>@sB</td>
                            <td>sb@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>5.</td>
                            <td>Paul</td>
                            <td>Richard</td>
                            <td>@pR</td>
                            <td>pr@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>6.</td>
                            <td>Will</td>
                            <td>Brad</td>
                            <td>@wb</td>
                            <td>wb@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>7.</td>
                            <td>Steven</td>
                            <td>Eric</td>
                            <td>@sE</td>
                            <td>se@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>8.</td>
                            <td>Landi</td>
                            <td>Susan</td>
                            <td>@lS</td>
                            <td>ls@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        </div>
    </div>
</div>

<style>
    .dh{
        transition: transform 0.25s ease;
    }
    .dh:hover{
        transform: scale(1.1,1.1);
        box-shadow: 0 0 10px grey;
        cursor: pointer;
    }
</style>
<!-- JS -->


<script type="text/javascript" src="js/popwin.js"></script>
<script type="text/javascript">
    function openWin(){
        popWin.showWin("http://localhost:8080/teacher/exam.jsp",1000,560,function(){
            //alert("关闭并执行回调函数");
        });
    }
    function closeWin(){

        $("#mask,#maskTop").fadeOut(function() {
            $(this).remove();
        });
    }
</script>
<script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<!-- <script src="https://www.google.com/jsapi"></script> Google Chart -->
<script>

    $(document).ready(function(){

        if($.browser.mozilla) {
            //refresh page on browser resize
            // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
            $(window).bind('resize', function(e)
            {
                if (window.RT) clearTimeout(window.RT);
                window.RT = setTimeout(function()
                {
                    this.location.reload(false); /* false to get page from cache */
                }, 200);
            });
        } else {
            // $(window).resize(function(){
            //   drawChart();
            // });

        }

    });

</script>
<script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>
