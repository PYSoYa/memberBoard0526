<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-27
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        const findAll = () => {
            location.href = "/member/findAll";
        }
    </script>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
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
    <h1>Admin</h1>
<ul class="nav nav-pills">
    <li class="nav-item">
        <a class="btn btn-dark" href="/member/findAll">회원목록</a>
    </li>
</ul>
</header>
</body>
</html>
