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

        <p>To post a job please fill out all fields.</p>

    </div>

</div>
<form:form method="post" action="postJob" modelAttribute="postJob" id="postJobForm">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="form-group>
                    <label for=" title
                " ><b>Title:</b></label>
                <form:input path="title" class="form-control" placeholder="Job title..."
                            aria-describedby="basic-addon1" required="required" id="title" minlength="3"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="location">Location</label>
                <form:input path="location" class="form-control" placeholder="Location..."
                            aria-describedby="basic-addon1" required="required" id="location" minlength="3"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="begin">Begin date:</label>

                <form:input path="beginDate" type="date" class="form-control"
                            aria-describedby="basic-addon1" required="required" id="begin"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="end">End date:</label>
                <form:input path="endDate" type="date" class="form-control" placeholder="End date..."
                            aria-describedby="basic-addon1" required="required" id="end"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="nrPersons">Number of required persons:</label>
                <form:input path="numberRequiredPersons" type="number" class="form-control"
                            placeholder="How many people do you need?"
                            aria-describedby="basic-addon1" required="required" id="nrPersons" value="1"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="salary">Salary:</label>
                <form:input path="salary" type="number" class="form-control" placeholder="How much pay do they get?"
                            aria-describedby="basic-addon1" required="required" id="salary" value="1.1"/>
            </div>
            <br/>

            <div class="form-group">
                <label for="description">Description:</label>
                <form:textarea path="description" class="form-control" placeholder="Describe the job..." rows="5"
                               aria-describedby="basic-addon1" required="required" id="description" minlength="20"/>
            </div>
            <div class="form-group">
                <label class="control-label">Upload an image:</label>
                <form:input path="image" id="input-1" type="file" class="file form-control"
                            aria-describedby="basic-addon1"/>
            </div>
            <br/>
                <span class="form-group-btn">
                    <button class="btn btn-success pull-right" type="submit" onclick="javascript:successPost()">Post
                    </button>
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

</script>
</body>
</html>
