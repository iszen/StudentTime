<%--
  Created by IntelliJ IDEA.
  User: Ioana
  Date: 9/21/2015
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" session="true" %>
<html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Student Time App</title>

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

        <div class="navbar-form navbar-right">
            <form:form method="post" modelAttribute="logout" action="/">
                <button type="submit" class="btn btn-success">Log out</button>
            </form:form></div>

    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <p class="container">

    <div align="center">
        <h1>Student Time</h1>

        <h3>This is a website meant to help students to enhance their working skills, financial stability and CV
            skills.</h3>

        <p>To apply for a job please fill out all fields.</p>

    </div>

</div>
<form:form method="post" action="email" modelAttribute="email" id="sendEmailForm">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="form-group">
                    <label for="name"><b>Name:</b></label>
                    <form:input path="name" class="form-control" placeholder="Your name..."
                                aria-describedby="basic-addon1" required="required" id="name" minlength="3"/>
                </div>
                <br/>

                <div class="form-group">
                    <label for="from">From:</label>
                    <form:input path="from" class="form-control" placeholder="The company's username"
                                aria-describedby="basic-addon1" required="required" id="from" minlength="3"/>
                </div>
                <br/>

                <div class="form-group">
                    <label for="to">To:</label>

                    <form:input path="to" type="text" class="form-control"
                                aria-describedby="basic-addon1" required="required" id="to"/>
                </div>
                <br/>

                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <form:input path="subject" type="text" class="form-control" placeholder="Subject..."
                                aria-describedby="basic-addon1" required="required" id="subject"/>
                </div>
                <br/>

                <div class="form-group">
                    <label for="text">Text:</label>
                    <form:input path="text" type="text" class="form-control"
                                placeholder="Tell us something about yourself..."
                                aria-describedby="basic-addon1" required="required" id="text"/>
                </div>
                <br/>


                <br/>
                <span class="form-group-btn">
                    <%--<button class="btn btn-success pull-right" type="submit" onclick="javascript:success()">Send an email</button>--%>
                 <button class="btn btn-success pull-right" type="submit">Send an email</button>
                </span>
                <br/>

            </div>
        </div>
    </div>
</form:form>
<script>
    function successPost() {
        alert("Congratulations you just posted a job! Now... go Home");
    }
    $("#postJobForm").validate();
    $("#nrPersons").change(function () {
        if ($(this).val() < 1) {
            alert("You need at least 1 person. Don't you?");
            $(this).val(1);
        }
        ;
    });
    $("#salary").change(function () {
        if ($(this).val() < 1) {
            alert("Nobody works for free...");
            $(this).val(1);
        }
        ;
    });
    $("#beginDate").change(function () {
        if (dates.compare(new Date($(this).value), new Date()) < 0) {
            alert("You can not post a job in the past!");
            $(this).val(new Date());
        }
        ;
    });
</script>
</body>
</html>
