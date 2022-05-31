<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-26
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script>
        const boardSave = () => {
            if(${sessionScope.loginMemberId!=null}){
                location.href = "/board/saveFile";
            }else{
                location.href = "/member/login";
            }
        }
        const logout = () => {
            location.href = "/member/logout";
        }
        const memberAdmin = () => {
            location.href = "/member/admin";
        }
        const myPage = () => {
            location.href = "/member/detail?id=${sessionScope.loginId}";
        }
    </script>
    <style>
        header {
            height: 75px;
            padding: 1rem;
            color: white;
            background: #6f8cee;
            font-weight: bold;
        }

        button {
            margin-top: 2.5px;
            margin-left: 10px;
        }
        #myPage {
            float: right;
        }
        #logout {
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<header>
    <button onclick="boardSave()" class="btn btn-dark">글 작성</button>
    <c:choose>
        <c:when test="${sessionScope.loginMemberId==null}">
            <button class="visually-hidden">로그아웃</button>
        </c:when>
        <c:otherwise>
            <button onclick="logout()" id="logout" class="btn btn-outline-danger">로그아웃</button>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${sessionScope.loginMemberId==null}">
                <button class="visually-hidden">마이페이지</button>
        </c:when>
        <c:otherwise>
                <button onclick="myPage()" id="myPage" class="btn btn-outline-dark">마이페이지</button>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${sessionScope.loginMemberId!='admin'}">
            <button class="visually-hidden">회원관리</button>
        </c:when>
        <c:otherwise>
            <button onclick="memberAdmin()" class="btn btn-outline-dark">회원관리</button>
        </c:otherwise>
    </c:choose>
</header>
</body>
</html>
