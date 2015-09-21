<%--
  Created by IntelliJ IDEA.
  User: Ioana
  Date: 9/17/2015
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" session="true" %>

<html>
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
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Post
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

            <a class="navbar-brand" href="/">Student Time</a>
        </div>
        <% if (session.getAttribute("loggedUserName") == null) { %>
        <div id="navbar" class="navbar-collapse collapse">
            <form:form class="navbar-form navbar-right" method="get" action="signin" modelAttribute="signin">
                <button type="submit" class="btn btn-success">Sign up</button>
            </form:form>
            <form:form class="navbar-form navbar-right" method="post" action="/" modelAttribute="login">
                <div class="form-group">
                    <form:input type="text" placeholder="Username" class="form-control" path="username"/>
                </div>
                <div class="form-group">
                    <form:password placeholder="Password" class="form-control" path="password"/>
                </div>
                <button type="submit" class="btn btn-success">Log in</button>
            </form:form>
        </div>
        <% } else {%>
        <div class="navbar-form navbar-right">
            <form:form method="post"  action="logout">
                <button type="submit" class="btn btn-success">Log out</button>
            </form:form>        </div>
        <a class="navbar-brand navbar-right" href="#">Welcome <%= session.getAttribute("loggedUserName")%>!</a>
        <%}%>

        <!--/.navbar-collapse -->
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <p class="container">

    <h1>Student Time</h1>

    <p>This is a website meant to help students to enhance their working skills, financial stability and CV
        skills.</p>

</div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
            <A href="edit.html">Edit Profile</A>

            <A href="edit.html">Logout</A>
            <br>
            <br/><br/>
            <%--<p class=" text-info">May 05,2014,03:00 pm </p>--%>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">


            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><c:out value="${job.title}"/></h3>
                </div>
                <div class="panel-body">
                    <div class="row">

                        <div class="col-md-3 col-lg-3 " align="center">
                            <c:set var="imageName" value="image${job.id}" />
                            <img alt="User Pic"
                                 src="data:image/jpeg;base64,${requestScope[imageName]}"
                                 height="90" width="90"
                                 class="img-circle img-responsive"></div>

                        <div class=" col-md-9 col-lg-9 ">
                            <table class="table table-user-information">

                                <tbody>
                                <tr>
                                    <td>Location:</td>
                                    <td><c:out value="${job.location}"/></td>
                                </tr>
                                <tr>
                                    <td>Start Date:</td>
                                    <td><c:out value="${job.beginDate}"/></td>
                                </tr>
                                <tr>
                                    <td>End Date</td>
                                    <td><c:out value="${job.endDate}"/></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Number of required persons:</td>
                                    <td><c:out value="${job.numberRequiredPersons}"/></td>
                                </tr>
                                <tr>
                                    <td>Salary:</td>
                                    <td><c:out value="${job.salary}"/></td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td><c:out value="${job.description}"/></td>


                                </tbody>
                            </table>

                            <p align="right">
                                <a href="#" class="btn btn-primary">Apply</a></p>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button"
                       class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
