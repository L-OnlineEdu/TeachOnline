<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
Created by IntelliJ IDEA.
User: kwinter
Date: 2018/3/17
Time: 21:05
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Date date=new Date(); SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>在线教育系统</title>

    <!-- CORE CSS-->
    <link href="../tea/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="../tea/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">

</head>

<body>

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START HEADER -->
    <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="cyan">
                <div class="nav-wrapper">
                    <h1 class="logo-wrapper"><a href="index.html" class="brand-logo darken-1"><img src="img/materialize-logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span></h1>
                    <ul class="right hide-on-med-and-down">
                       
                        <li>    
                            <a href="javascript:void(0);" class="waves-effect waves-block waves-light">
                                 <i class="mdi-maps-local-library" style="margin-top:-7px;margin-bottom:-14px"></i>
                                <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的课堂</label>
                            </a>                              
                        </li>
                       
                        <li>    
                                <a href="javascript:void(0);" class="waves-effect waves-block waves-light">
                                     <i class="mdi-social-poll" style="margin-top:-7px;margin-bottom:-14px"></i>
                                    <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的题库</label>
                                </a>                              
                                    
                         </li>
                        <li>
                            <div class="row" style="width:150px;margin-bottom:-10px;" >
                                <div class="col col s4 m4 l4" style="padding-top:10px;">
                                    <img src="img/avatar.jpg" alt="" class="circle responsive-img valign ">
                                </div>
                                <div class="col col s1 m1 l1" style="margin-left:-20px;">
                                    <ul id="profile-dropdown" class="dropdown-content" style="width:20px;">
                                        <li><a href="#"><i class="mdi-action-face-unlock"></i> Profile</a>
                                        </li>
                                        <li><a href="#"><i class="mdi-action-settings"></i> Settings</a>
                                        </li>
                                        <li><a href="#"><i class="mdi-communication-live-help"></i> Help</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="mdi-action-lock-outline"></i> Lock</a>
                                        </li>
                                        <li><a href="#"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                                        </li>
                                    </ul>
                                    
                                    <a class="btn-flat dropdown-button waves-effect waves-light profile-btn" style="width:200px;"  href="#" data-activates="profile-dropdown">
                                            John ▼
                                    </a>
                                      
                                </div>
                            </div>
                        </li>

                    </ul>
               
                </div>
                
            </nav>
        </div>
        <!-- end header nav-->
    </header>
        
    <div>
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content  white-text" style="background:#5BE7C4">
                        <p class="card-stats-title"><i class="mdi-action-description"></i>我的成绩</p>
                        <h4 class="card-stats-number">26分</h4>
                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span class="green-text text-lighten-5">超过了50%的人</span>
                        </p>
                    </div>
                    <div class="card-action  darken-2" style="background:#5BE7C4">
                        <div id="clients-bar">
                             <a href="#" style="color:ghostwhite">详情</a>    
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content  white-text" style="background:#7A57D1">
                        <p class="card-stats-title"><i class="mdi-social-group"></i>我的讨论</p>
                        <h4 class="card-stats-number">1人</h4>
                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span class="purple-text text-lighten-5">当前在线人数</span>
                        </p>
                    </div>
                    <div class="card-action  darken-2" style="background:#7A57D1">
                            <a href="#" style="color:ghostwhite">进入讨论</a> 

                    </div>
                </div>
            </div>                            
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content" style="background:#F5F7FA"> 
                        <p class="card-stats-title"><i class="mdi-alert-warning"></i>收到警告</p>
                        <h4 class="card-stats-number">0个</h4>
                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i>  <span class="text-lighten-5">超过了1人</span>
                        </p>
                    </div>
                    <div class="card-action darken-2" style="background:#F5F7FA">
                            <a href="#" style="color:black">详情</a>    

                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content white-text" style="background:#50C1E9">
                        <p class="card-stats-title"><i class="mdi-av-snooze"></i>进行中的测验</p>
                        <h4 class="card-stats-number">无</h4>
                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-down"></i><span class="deep-purple-text text-lighten-5">上次测验时间YYYY-MM-HH-SS</span>
                        </p>
                    </div>
                    <div class="card-action  darken-2" style="background:#50C1E9">
                            <a href="#" style="color:ghostwhite">进入测验</a>  
                    </div>
                </div>
            </div>                            
        </div>
         
        <div class="row">
                <div class="col s12 m6 l4">
                        <div id="profile-card" class="card">
                            <div class="card-image waves-effect waves-block waves-light" style="background:#7F95D1">
                                <span style="background:#7F95D1"></span>
                            </div>
                            <div class="card-content">
                                <img src="img/avatar.jpg" alt="" class="circle responsive-img activator card-profile-image">
                                <a class="btn-floating activator btn-move-up waves-effect waves-light darken-2 right">
                                    <i class="mdi-editor-mode-edit"></i>
                                </a>
    
                                <span class="card-title activator grey-text text-darken-4">我是谁</span>
                                <p><i class="mdi-action-perm-identity cyan-text text-darken-2"></i>我的学号</p>
                                <p><i class="mdi-communication-business cyan-text text-darken-2"></i>我的班级</p>
                                <p><i class="mdi-social-group  cyan-text text-darken-2"></i> 我的小组</p>
    
                            </div>

                            <div class="card-reveal" style="display: none; transform: translateY(0px);">
                                    <span class="card-title grey-text text-darken-4">加入班级<i class="mdi-navigation-close right"></i></span>
                                    <p><i class="mdi-communication-business cyan-text text-darken-2"></i>班级1</p>
                                    <p><i class="mdi-communication-business cyan-text text-darken-2"></i>班级2</p>
                                    <p><i class="mdi-communication-business cyan-text text-darken-2"></i>班级3</p>
                                    <p><i class="mdi-communication-business cyan-text text-darken-2"></i>班级4</p>
                                </div>
                        </div>
                    </div>

                    <div class="col s12 m6 l4">
                        <input type="hidden" id="teaid"/>
                        <div id="flight-card" class="card">
                            <div class="card-header  darken-2 amber">
                                <div class="card-title">
                                    <h4 class="flight-card-title">今日课程</h4>
                                    <p class="flight-card-date"><%=sdf.format(date)%></p>
                                </div>
                            </div>
                            <div class="card-content-bg white-text">
                                <div class="card-content">
                                    <div class="row" style="text-align:center">
                                        <div class="col s12 m12 l12">
                                            <i class="mdi-social-notifications-on large"></i>
                                        </div>
                                        <div class="col s12 m12 l12  center-align">
                                            <s:if test="courseFlag">
                                                <a id="couring" style="background-color: #ffd208"
                                                   class="waves-effect waves-light btn-large">点击进入课堂</a>
                                            </s:if>
                                            <s:else>
                                                <a id="couring" class="waves-effect waves-light btn-large">暂无当前课程</a>
                                            </s:else>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col s6 m6 l6 center-align">
                                            <div class="flight-info">
                                                <p class="small"><span class="grey-text text-lighten-4">教师未登录</p>

                                            </div>
                                        </div>
                                        <div class="col s6 m6 l6 center-align flight-state-two">
                                            <div class="flight-info">
                                                <p class="small">
                                                    <span id="showHisCou" class="activator grey-text text-lighten-4">
                                                        查看历史课程
                                                    </span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-reveal" style="display: none; transform: translateY(0px);">
                                <span class="card-title grey-text text-darken-4">我的历史课程
                                    <i class="mdi-navigation-close right"></i>
                                </span>
                                <div id="showDiv"></div>

                                <%--<div class="row" style="text-align:center">


                                    <div class="col s12 m12 l12">
                                        <i class="mdi-action-receipt large"></i>
                                    </div>


                                    <div class="col s12 m12 l12  center-align">
                                        <a class="activator waves-effect waves-light btn-large">练习未开启</a>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col s6 m6 l6 center-align">
                                        <div class="flight-info">
                                            <p class="small"><span class="grey-text">教师未登录</p>

                                        </div>
                                    </div>
                                    <div class="col s6 m6 l6 center-align flight-state-two">
                                        <div class="flight-info">
                                            <p class="small"><span class="grey-text">上次练习时间</span></p>

                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                            <%--<div id="flight-card" class="card">
                                <div class="card-header  darken-2 amber">
                                    <div class="card-title">
                                        <h4 class="flight-card-title">今日</h4>
                                        <p class="flight-card-date">2018/5/13</p>
                                    </div>
                                </div>
                                <div class="card-content-bg white-text">
                                    <div class="card-content">
                                        <div class="row" style="text-align:center">
                                                
                                                       
                                             <div class="col s12 m12 l12">
                                                            <i class="mdi-social-plus-one large"></i>
                                             </div>
                                                     
                                                 
                                            <div class="col s12 m12 l12  center-align">
                                                    <a id="ateding" class="waves-effect waves-light btn-large">签到未开启</a>
        
                                            </div>
                                           
                                        </div>
                                        <div class="row">
                                            <div class="col s6 m6 l6 center-align">
                                                <div class="flight-info">
                                                    <p class="small"><span class="grey-text text-lighten-4">教师未登录</p>
                                                
                                                </div>
                                            </div>
                                            <div class="col s6 m6 l6 center-align flight-state-two">
                                                <div class="flight-info">
                                                    <p class="small"><span class="activator grey-text text-lighten-4">开始练习</span></p>
                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-reveal" style="display: none; transform: translateY(0px);">
                                        <span class="card-title grey-text text-darken-4">我的练习<i class="mdi-navigation-close right"></i></span>
                                        <div class="row" style="text-align:center">
                                                
                                                       
                                                <div class="col s12 m12 l12">
                                                               <i class="mdi-action-receipt large"></i>
                                                </div>
                                                        
                                                    
                                               <div class="col s12 m12 l12  center-align">
                                                       <a class="activator waves-effect waves-light btn-large">练习未开启</a>
           
                                               </div>
                                              
                                           </div>
                                           <div class="row">
                                               <div class="col s6 m6 l6 center-align">
                                                   <div class="flight-info">
                                                       <p class="small"><span class="grey-text">教师未登录</p>
                                                   
                                                   </div>
                                               </div>
                                               <div class="col s6 m6 l6 center-align flight-state-two">
                                                   <div class="flight-info">
                                                       <p class="small"><span class="grey-text">上次练习时间</span></p>
                   
                                                   </div>
                                               </div>
                                           </div>
                                </div>
                            </div>--%>
                        </div>


                <div class="col s12 m12 l4">
                    <ul id="task-card" class="collection with-header">
                        <li class="collection-header cyan">
                            <h4 class="task-card-title">最近的签到</h4>
                            <p class="task-card-date">2015/5/1</p>
                        </li>
                        <li class="collection-item dismissable" style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                            <input type="checkbox" id="task1">
                            <label for="task1" style="text-decoration: none;">2018/4/1 00：00 <a href="#" class="secondary-content"><span class="ultra-small">未签到</span></a>
                            </label>
                            <span class="task-cat teal">tea1</span>
                        </li>
                        <li class="collection-item dismissable" style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <input type="checkbox" id="task2">
                                <label for="task2" style="text-decoration: none;">2018/4/1 00：00 <a href="#" class="secondary-content"><span class="ultra-small">未签到</span></a>
                                </label>
                                <span class="task-cat teal">tea1</span>
                        </li>
                        <li class="collection-item dismissable" style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <input type="checkbox" id="task3" checked="checked"/>
                                  <label for="task3" style="text-decoration: line-through;">2018/4/1 00：00 <a href="#" class="secondary-content"><span class="ultra-small">已签到</span></a>
                                </label>
                                <span class="task-cat teal">tea1</span>
                        </li>
                        <li class="collection-item dismissable" style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <input type="checkbox" id="task4" checked="checked" disabled/>
                                  <label for="task4" style="text-decoration: line-through;">2018/4/1 00：00 <a href="#" class="secondary-content"><span class="ultra-small">签到过期</span></a>
                                </label>
                                <span class="task-cat teal">tea1</span>
                        </li>
                    </ul>
                </div>
                 
                </div>
                 
              

                

            </div>

            
            
       
       
            <div id="work-collections">
                <div class="row">
                    
                    <div class="col s12 m12 l6">
                        <ul id="projects-collection" class="collection">
                            <li class="collection-item avatar">
                                <i class="mdi-action-description circle light-blue darken-2"></i>
                                <span class="collection-header">成绩</span>
                                <p>你的历史成绩</p>
                                <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                            </li>
                            <li class="collection-item">
                                <div class="row">
                                    <div class="col s6">
                                        <p class="collections-title">0分</p>
                                        <p class="collections-content">2018/5/1</p>
                                    </div>
                                    <div class="col s3">
                                        <span class="task-cat cyan">tea1</span>
                                    </div>
                                    <div class="col s3">
                                        <div id="project-line-1"></div>
                                    </div>
                                </div>
                            </li>
                            <li class="collection-item">
                                    <div class="row">
                                        <div class="col s6">
                                            <p class="collections-title">0分</p>
                                            <p class="collections-content">2018/5/1</p>
                                        </div>
                                        <div class="col s3">
                                            <span class="task-cat cyan">tea1</span>
                                        </div>
                                        <div class="col s3">
                                            <div id="project-line-1"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="collection-item">
                                        <div class="row">
                                            <div class="col s6">
                                                <p class="collections-title">0分</p>
                                                <p class="collections-content">2018/5/1</p>
                                            </div>
                                            <div class="col s3">
                                                <span class="task-cat cyan">tea1</span>
                                            </div>
                                            <div class="col s3">
                                                <div id="project-line-1"></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="collection-item">
                                            <div class="row">
                                                <div class="col s6">
                                                    <p class="collections-title">0分</p>
                                                    <p class="collections-content">2018/5/1</p>
                                                </div>
                                                <div class="col s3">
                                                    <span class="task-cat cyan">tea1</span>
                                                </div>
                                                <div class="col s3">
                                                    <div id="project-line-1"></div>
                                                </div>
                                            </div>
                                        </li>
                        </ul>
                    </div>
                    <div class="col s12 m12 l6">
                        <ul id="issues-collection" class="collection">
                                <li class="collection-item avatar">
                                        <i class="mdi-alert-warning circle red darken-2"></i>
                                        <span class="collection-header">警告</span>
                                        <p>你收到的警告</p>
                                        <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                                    </li>
                                    <li class="collection-item">
                                        <div class="row">
                                            <div class="col s7">
                                                <p class="collections-title"><strong>-3</strong>分</p>
                                                <p class="collections-content">2018/5/1</p>
                                            </div>
                                            <div class="col s2">
                                                <span class="task-cat cyan">tea1</span>
                                            </div>
                                            <div class="col s3">
                                               扣分原因                                               
                                            </div>
                                        </div>
                                    </li>
                                        <li class="collection-item">
                                                    <div class="row">
                                                        <div class="col s7">
                                                            <p class="collections-title"><strong>-3</strong>分</p>
                                                            <p class="collections-content">2018/5/1</p>
                                                        </div>
                                                        <div class="col s2">
                                                            <span class="task-cat cyan">tea1</span>
                                                        </div>
                                                        <div class="col s3">
                                                           扣分原因                                               
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="collection-item">
                                                        <div class="row">
                                                            <div class="col s7">
                                                                <p class="collections-title"><strong>-3</strong>分</p>
                                                                <p class="collections-content">2018/5/1</p>
                                                            </div>
                                                            <div class="col s2">
                                                                <span class="task-cat cyan">tea1</span>
                                                            </div>
                                                            <div class="col s3">
                                                               扣分原因                                               
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="collection-item">
                                                            <div class="row">
                                                                <div class="col s7">
                                                                    <p class="collections-title"><strong>-3</strong>分</p>
                                                                    <p class="collections-content">2018/5/1</p>
                                                                </div>
                                                                <div class="col s2">
                                                                    <span class="task-cat cyan">tea1</span>
                                                                </div>
                                                                <div class="col s3">
                                                                   扣分原因                                               
                                                                </div>
                                                            </div>
                                                        </li>
                        </ul>
                    </div>
                </div>
            </div>

    </div>
    


    <script src="../tea/js/jquery-1.11.2.min.js"></script>
    <script>

        
        $(document).ready(function () {
            $("#showHisCou").click(function(){
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/stu/findHistCou" ,//url
                    success: function (result) {
                        $("#showDiv").html("<table id=\"showCourse\" class=\"striped\">\n" +
                            "                                    <thead>\n" +
                            "                                    <tr>\n" +
                            "                                        <th data-field=\"id\">课程名称</th>\n" +
                            "                                        <th data-field=\"name\">讲课老师</th>\n" +
                            "                                        <th data-field=\"price\">时间</th>\n" +
                            "                                    </tr>\n" +
                            "                                    </thead>\n" +
                            "                                </table>")
                        $.each(result.courses,function(i,course){
                            $("#showCourse").append("<tr><td>"+course.courseName+"</td><td>"+course.teacher.userName+
                                "</td><td>"+course.date+"</td></tr>")
                        });
                    }
                });
            })
        })
    </script>
    <script src="../tea/swx/sweetalert-dev.js"></script>

    <!--materialize js-->
    <script type="text/javascript" src="../tea/js/materialize.min.js"></script>
    <script src="/utils/alert/js/alert.js"></script>
    <%--me--%>
    <script type="text/javascript" src="../tea/jxv4.js"></script>
  
</body>

</html>
