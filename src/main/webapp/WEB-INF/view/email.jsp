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

<%@include file="header.html" %>
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
<form:form method="post" action="email" modelAttribute="email" id="sendEmailForm" onsubmit="javascript:successSent()">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <div class="form-group">
                    <label for="text">Text:</label>
                    <form:input path="text" type="text" class="form-control"
                                placeholder="Tell us something about yourself..."
                                aria-describedby="basic-addon1" required="required" id="text"/>
                </div>
                <br/>

                <div class="form-group">
                    <label class="control-label">Upload your cv:</label>
                    <form:input path="file" id="input-1" type="file" class="file form-control"
                                aria-describedby="basic-addon1"/>
                </div>
                <br/>
                <br/>
                <span class="form-group-btn">
                    <%--<button class="btn btn-success pull-right" type="submit" onclick="javascript:success()">Send an email</button>--%>
                 <button class="btn btn-success pull-right" type="submit">Send an
                     email
                 </button>
                </span>
                <br/>

            </div>
        </div>
    </div>
</form:form>
<script>
    function successSent() {
        alert("You have successfully sent an E-mail to your employer.Return to the homepage");
    }
    $("#sendEmailForm").validate();

</script>
</body>
</html>
