<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Bella
  Date: 9/15/2015
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    </div>
</nav>

<div class="jumbotron">
    <p class="container">

    <div align="center">

        <br/>
        <h4>You have to be logged in to post on this website!</h4>

    </div>
</div>
<br/>
<form:form class="form-horizontal" role="form" method="post" action="/" modelAttribute="login">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Username:</label>

                    <div class="col-sm-5">
                        <form:input type="text" size="20" class="form-control" id="username" placeholder="Username"
                                    path="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Password:</label>

                    <div class="col-sm-5">
                        <form:password size="20" class="form-control" id="password" placeholder="Password"
                                       path="password"
                                       required="required"/>
                    </div>
                </div>
                <div class="col-sm-7">
                    <button type="submit" class="btn btn-success pull-right">Log in</button>
                </div>
                <br/>
                <br/>
                <div align="center" class="col-sm-7">
                    <p>Dont' have an account?</p>
                </div>
            </div>

        </div>
    </div>
</form:form>



<form:form class="form-inline" role="form" method="get" action="signin" modelAttribute="signin">
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="col-sm-7">

        <button type="submit" class="btn btn-primary btn-block">Sign up</button>
    </div>
            </div>
        </div>
    </div>
</form:form>


</body>
</html>
