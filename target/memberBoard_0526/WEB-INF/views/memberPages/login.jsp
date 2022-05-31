<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-26
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../../resources/css/login.css">
</head>
<body>
<form action="/member/login" method="post">
    <div class="main" >
        <h2>Login</h2>
        <div class="text">
            <input type="text" style="margin-bottom: 10px;" name="memberId" id="memberId" placeholder="ID">
        </div>
        <div class="text">
            <input type="password" id="memberPassword" name="memberPassword" placeholder="Password"> <br>
        </div>
        <h6><a style="margin-bottom: 10px;" href="/member/save">signup</a></h6>
        <input type="submit" style="margin-top: 20px;" value="Login">
    </div>
</form>

</body>
</html>
