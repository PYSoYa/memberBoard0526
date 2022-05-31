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
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <script>
        const saveForm = () => {
            location.href = "/member/save";
        }
        const login = () => {
            location.href = "/member/login";
        }
        const findAll = () => {
            location.href = "/board/findAll";
        }
    </script>
    <style>
        header {
            height: 75px;
            padding: 1rem;
            color: white;
            background-color: #6F8CEEFF;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        a {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<header>
    <h1>YunSeok</h1>
<%--    <button onclick="saveForm()" class="btn btn-outline-secondary">회원가입</button>--%>
<%--    <button onclick="login()" class="">로그인</button>--%>
<%--    <button onclick="findAll()" class="">글목록</button>--%>
    <ul class="nav nav-pills">
        <li class="nav-item">
            <a class="btn btn-dark" aria-current="page" href="/index">메인</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-dark" href="/member/save">회원가입</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-dark" href="/member/login">로그인</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-dark" href="/board/findAll">글목록</a>
        </li>
    </ul>
</header>
</body>
</html>
