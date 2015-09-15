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
      <form:form class="navbar-form navbar-left" method="get" action="post" modelattribute="post">
        <a class="btn btn-primary btn-lg" href="#" role="button">Post &raquo;</a>
      </form:form>
      <a class="navbar-brand" href="#">Student Time App</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <form:form class="navbar-form navbar-right" method="get" action="signin" modelAttribute="signin">
        <button type="submit" class="btn btn-success">Sign in</button>
      </form:form>
      <form:form class="navbar-form navbar-right" method="post" action="login" modelAttribute="login">
        <div class="form-group">
          <form:input type="text" placeholder="Username" class="form-control" path="username"/>
        </div>
        <div class="form-group">
          <form:password placeholder="Password" class="form-control" path="password"/>
        </div>
        <button type="submit" class="btn btn-success">Log in</button>
      </form:form>
    </div>
    <!--/.navbar-collapse -->
  </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
  <p class="container">
  <h1>Student Time</h1>

  <p>This is a website meant to help students to enhance their working skills, financial stability and CV
    skills.</p>

  <form:form method="get" action="find" modelAttribute="find"><a class="btn btn-primary btn-lg" href="#" role="button">Find &raquo;</a></form:form>

</div>
Post a Job Form
</body>
</html>