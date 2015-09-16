<%--
  Created by IntelliJ IDEA.
  User: Bella
  Date: 9/9/2015
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form:form method="post" action="login" >
    <label for="username">Username: </label>
    <form:input size="20" path="username"/><br/>
    <label for="password">Password: </label>
    <form:password size="20" path="password"/><br/>
    <input type="submit" value="Submit" />
</form:form>


</body>
</html>
