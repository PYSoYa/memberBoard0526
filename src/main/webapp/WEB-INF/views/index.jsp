<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-26
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        const saveForm = () => {
            location.href = "/member/save";
        }
        const login = () => {
            location.href = "/member/login";
        }
        const findAll = () => {
            location.href = "/member/findAll";
        }
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <button onclick="saveForm()" class="">회원가입</button>
    <button onclick="login()" class="">로그인</button>
    <button onclick="findAll()" class="">글목록</button>
</body>
</html>
