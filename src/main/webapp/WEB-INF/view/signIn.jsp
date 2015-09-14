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
    <title></title>
</head>
<body>
<form:form method="post" action="login" modelAttribute="login" >
  <label for="firstname">First Name: </label>
  <form:input size="20" path="firstname"/><br/>
  <label for="lastname">Last Name: </label>
  <form:input size="20" path="lastname"/><br/>
  <label for="username">Username: </label>
  <form:input size="20" path="username"/><br/>
  <label for="password">Password: </label>
  <form:password size="20" path="password"/><br/>
  <label for="workplace">Workplace/University: </label>
  <form:input size="20" path="workplace"/><br/>
  <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
