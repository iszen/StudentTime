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
      <a class="navbar-brand" href="index">Student Time</a>
    </div>
    <div class="navbar-form navbar-right">
      <form:form method="post"  action="logout">
        <button type="submit" class="btn btn-success">Log out</button>
      </form:form>    </div>
  </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
  <p class="container">

  <div align="center">
    <h1>Student Time</h1>

    <h3>This is a website meant to help students to enhance their working skills, financial stability and CV
      skills.</h3>

    <p>To post a volunteer work please fill out all fields.</p>

  </div>

</div>
<form:form method="post" action="postVolunteering" modelAttribute="postVolunteering">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">


        <div class="input-group">
          <span class="input-group-addon" id="title">Title</span>
          <form:input path="title" type="text" class="form-control" placeholder="Volunteer work title..."
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>

        <div class="input-group">
          <span class="input-group-addon" id="location">Location</span>
          <form:input path="location" type="text" class="form-control" placeholder="Location..."
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>

        <div class="input-group">
          <span class="input-group-addon" id="begin">Begin date</span>
          <form:input path="beginDate" type="date" class="form-control" placeholder="Begin date..."
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>

        <div class="input-group">
          <span class="input-group-addon" id="end">End date</span>
          <form:input path="endDate" type="date" class="form-control" placeholder="End date..."
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>

        <div class="input-group">
          <span class="input-group-addon" id="nrPersons">Number of required persons</span>
          <form:input path="numberRequiredPersons" type="number" class="form-control"
                      placeholder="How many people do you need?"
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>

        <div class="input-group">
          Do they get a certificate?<form:checkbox path="active" />
        </div>
        <br/>

        <div class="input-group">
          <span class="input-group-addon" id="description">Description</span>
          <form:input path="description" type="text" class="form-control" placeholder="Describe the work..."
                      aria-describedby="basic-addon1"/>
        </div>
        <br/>
                <span class="input-group-btn">
                    <button class="btn btn-success pull-right" type="submit">Post</button>
                </span>



      </div>
    </div>
  </div>
</form:form>
</body>
</html>
