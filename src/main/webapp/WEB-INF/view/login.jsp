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

<%@include file="header.html" %>
<body style="background-color: #FFFF66">

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

<div class="jumbotron" style="background-size: 100%;background-image: url(http://cache.desktopnexus.com/thumbseg/827/827295-bigthumbnail.jpg)">
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
                    <button type="submit" class="btn btn-warning pull-right">Log in</button>
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

                    <button type="submit" class="btn btn-danger btn-block">Sign up</button>
                </div>
            </div>
        </div>
    </div>
</form:form>


</body>
</html>
