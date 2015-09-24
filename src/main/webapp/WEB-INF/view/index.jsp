<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" session="true" %>

<html lang="en">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Student Time</title>

    <!-- Bootstrap core CSS -->
    <link href="../../webapp/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <form:form class="navbar-form navbar-left">
        <div class="dropdown">
            <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenu1"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Post something ...
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="postJob">Job</a></li>
                <li><a href="postVolunteering">Volunteer work</a></li>
                <li><a href="postNotice">Notice</a></li>
            </ul>
        </div>
    </form:form>
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#">Student Time</a>
        </div>
        <% if (session.getAttribute("loggedUserName") == null) { %>
        <div id="navbar" class="navbar-collapse collapse">
            <form:form class="navbar-form navbar-right" method="get" action="signin" modelAttribute="signin">
                <button type="submit" class="btn btn-warning">Sign up</button>
            </form:form>
            <form:form class="navbar-form navbar-right" method="post" action="/" modelAttribute="login" onsubmit='return validateMyForm()'>
                <div class="form-group">
                    <form:input type="text" id="username" placeholder="Username" class="form-control" path="username"/>
                </div>
                <div class="form-group">
                    <form:password  id="password" placeholder="Password" class="form-control" path="password"/>
                </div>
                <button type="submit" class="btn btn-warning">Log in</button>
                <script type="text/javascript">
                    function validateMyForm()
                    {
                        if (document.getElementById('username').value.length == 0 || document.getElementById('password').value.length == 0)
                        {
                            window.alert("Don't leave any fields empty!");
                            return false;
                        }
                    }

                </script>
            </form:form>
        </div>
        <% } else {%>
        <div class="navbar-form navbar-right">
            <form:form method="post" modelAttribute="logout" action="/">
                <button type="submit" class="btn btn-warning">Log out</button>
            </form:form>
        </div>
        <a class="navbar-brand navbar-right" href="#">Welcome <%= session.getAttribute("loggedUserName")%>!</a>
        <%}%>

        <!--/.navbar-collapse -->
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron" style="background-size: 100%;background-image: url()">
    <p class="container">

    <h1>Student Time</h1>

    <p>This is a website meant to help students to enhance their working skills, financial stability and CV
        skills.</p>

</div>
</div>
<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home"><h2>Jobs</h2></a></li>
    <li><a data-toggle="tab" href="#menu1"><h2>Volunteer work</h2></a></li>
    <li><a data-toggle="tab" href="#menu2"><h2>Notices</h2></a></li>
</ul>

<div class="tab-content" style="background-color: #555555">
    <div id="home" class="tab-pane fade in active">
        <br/><br/>

        <div class="row">
            <form:form action="/" method="get" modelAttribute="search">
            <div class="col-md-6 col-md-offset-3">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-warning" type="submit">Find a job</button>
                    </span>
                    <form:input path="searchJob" class="form-control" placeholder="Search for a job..."/>

                </div>
                <!-- /input-group -->
            </div>
            <!-- /.col-lg-6 -->
             </form:form>
            <br/><br/>
            <br/><br/>
            <c:forEach items="${jobList}" var="job">
                <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                    <div class="thumbnail"  style="width: 300px;height: 250px;background-image: url(http://ginva.com/wp-content/uploads/2012/02/simple-wallpaper-20.jpg); background-size: 100%">
                        <c:set var="imgName" value="image${job.id}"/>
                        <img src="data:image/jpeg;base64,${requestScope[imgName]}"
                             alt="No image available"
                             height="90" width="90">

                        <div class="caption">
                            <c:set var="jobTitle" value="${job.title}"/>
                            <c:choose>
                                <c:when test="${job.title.length() < '31'}"><h4><c:out value="${job.title}"/></h4><br/></c:when>
                                <c:when test="${job.title.length() > '59'}">
                                    <h4>${fn:substring(jobTitle, 0, 59)}...</h4></c:when>
                                <c:otherwise><h4><c:out value="${job.title}"/></h4></c:otherwise>
                            </c:choose>
                            <p><c:out value="Owner: ${job.owner.username}"/></p>

                            <p><a href="/email?jobprofiletitle=${job.title}" class="btn btn-danger"
                                  role="submit">Apply</a> <a
                                    href="http://localhost:8080/jobProfile?jobtitle=${job.title}"
                                    class="btn btn-warning"
                                    role="submit">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div id="menu1" class="tab-pane fade">
        <br/><br/>

        <div class="row">
            <form:form action="/" method="get" modelAttribute="search">
                <div class="col-md-6 col-md-offset-3">
                    <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Find a job</button>
                    </span>
                        <form:input path="searchVol" class="form-control" placeholder="Search for volunteer work..."/>

                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </form:form>
            <br/><br/>
            <br/><br/>

            <c:forEach items="${volunteerList}" var="volunteer">

                <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                    <div class="thumbnail">
                        <c:set var="imgName" value="image${volunteer.id}"/>
                        <img src="data:image/jpeg;base64,${requestScope[imgName]}"
                             alt="No image available"
                             height="100" width="100">

                        <div class="caption">
                            <c:set var="volunteerTitle" value="${volunteer.title}"/>
                            <c:choose>
                                <c:when test="${volunteer.title.length() < '31'}"><h4><c:out
                                        value="${volunteer.title}"/></h4><br/></c:when>
                                <c:when test="${volunteer.title.length() > '59'}">
                                    <h4>${fn:substring(volunteerTitle, 0, 59)}...</h4></c:when>
                                <c:otherwise><h4><c:out value="${volunteer.title}"/></h4></c:otherwise>
                            </c:choose>
                            <p><c:out value="Owner: ${volunteer.owner.username}"/></p>

                            <p><a href="/email" class="btn btn-primary" role="submit">Apply</a> <a
                                    href="http://localhost:8080/volunteerProfile?volunteerTitle=${volunteer.title}"
                                    class="btn btn-success"
                                    role="submit">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div id="menu2" class="tab-pane fade">
        <br/><br/>

        <div class="row">
            <form:form action="/" method="get" modelAttribute="search">
                <div class="col-md-6 col-md-offset-3">
                    <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Find a job</button>
                    </span>
                        <form:input path="searchNotice" class="form-control" placeholder="Search for a notice..."/>

                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </form:form>
            <br/><br/>
            <br/><br/>

            <c:forEach items="${noticeList}" var="notice">

                <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                    <div class="thumbnail">

                        <div class="caption">
                            <p><b><c:out value="Owner: ${notice.owner.username}"/></b></p>

                            <c:set var="noticeText" value="${notice.text}"/>
                            <c:choose>
                                <c:when test="${notice.text.length() < '31'}">
                                    <p><c:out value="${notice.text}"/><br/><br/></p>
                                </c:when>
                                <c:when test="${notice.text.length() > '59'}">
                                    <p>${fn:substring(noticeText, 0, 59)}...</p>
                                </c:when>
                                <c:otherwise><p><c:out value="${notice.text}"/></p></c:otherwise>
                            </c:choose>

                            <p><a href="http://localhost:8080/noticeProfile?noticeText=${notice.text}"
                                  class="btn btn-info btn-sm" role="submit">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <br/><br/>
</div>
<br/>

<div>
    <br>
    <hr>
    <footer>
        <p>&copy; StudentTime 2015</p>
    </footer>
</div>
<!-- /container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
