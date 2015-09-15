<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Dana
  Date: 9/14/2015
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<br>
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
            <a class="navbar-brand" href="#">Student Time App</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        </div>
    </div>
</nav>
<br/></br>
<form:form class="form-horizontal" role="form" method="post" action="signin" modelAttribute="signin">
    <div class="form-group">
        <label class="control-label col-sm-2" for="firstname">First Name:</label>

        <div class="col-sm-10">
            <form:input type="text" class="form-control" id="firstname" placeholder="Firstname" path="firstname"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="lastname">Last Name:</label>

        <div class="col-sm-10">
            <form:input type="text" size="20" class="form-control" id="lastname" placeholder="Lastname"
                        path="lastname"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="username">Username:</label>

        <div class="col-sm-10">
            <form:input type="text" size="20" class="form-control" id="username" placeholder="Username"
                        path="username"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="password">Password:</label>

        <div class="col-sm-10">
            <form:password size="20" class="form-control" id="password" placeholder="Password" path="password"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="workplace">Workplace/University:</label>

        <div class="col-sm-10">
            <form:input type="text" size="20" class="form-control" id="workplace" placeholder="Workplace/University"
                        path="workplace"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Email:</label>

        <div class="col-sm-10">
            <form:input type="email" size="20" class="form-control" id="email" placeholder="Email"
                        path="email"/>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label><input type="checkbox"> Remember me</label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Submit</button>
        </div>
    </div>
</form:form>
</body>
</html>
