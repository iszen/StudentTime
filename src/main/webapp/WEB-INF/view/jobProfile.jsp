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
            <form:form method="post" action="logout">
                <button type="submit" class="btn btn-success">Log out</button>
            </form:form></div>
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
                        <c:set var="imageName" value="image${job.id}"/>
                        <img alt="No image available"
                             src="data:image/jpeg;base64,${requestScope[imageName]}"
                             height="90" width="90"
                             class="img-circle img-responsive">
                        <h4><c:out value="${job.owner.username}"/></h4>
                    </div>

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
                            <a href="/email?jobprofiletitle=${job.title}" class="btn btn-primary">Apply</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</body>
</html>
