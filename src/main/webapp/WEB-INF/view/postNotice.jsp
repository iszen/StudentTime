<%--
  Created by IntelliJ IDEA.
  User: Bella
  Date: 9/15/2015
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        <p>Please write your notice in the input field below.</p>

    </div>

</div>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form:form method="post" action="/postNotice" modelAttribute="postNotice" id="postNoticeForm">
            <div class="form-group">
                <div class="form-group>
                    <label for=" title
                " ><b>Title:</b></label>
                <form:input path="title" class="form-control" placeholder="Notice title..."
                            aria-describedby="basic-addon1" required="required" id="title" minlength="3"/>
            </div>
            <br/>
            <label for="notice">Your notice:</label>

            <form:textarea path="text" class="form-control" rows="5" id="notice" minlength="10"/>

        </div>
                <span class="input-group-btn">
                    <button class="btn btn-success pull-right" type="submit" onclick="javascript:successPost()">Post
                    </button>
                </span>
        </form:form>

    </div>
</div>
</div>
<script>
    function successPost() {
        alert("Congratulations you just posted a notice! Now... go Home");
    }
    $("#postNoticeForm").validate();
</script>
</body>
</html>
