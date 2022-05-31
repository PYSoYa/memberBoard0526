<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-26
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <table class="table">
        <tr>
            <th>id</th>
            <th>memberId</th>
            <th>memberPassword</th>
            <th>memberName</th>
            <th>memberAge</th>
            <th>memberPhone</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfile}"
                                alt="" height="50" width="50"></td>
<%--                <td><a href="/member/detail?id=${member.id}">조회</a></td>--%>
                <td><a href="/member/delete?id=${member.id}">삭제</a></td>
<%--                <td><button onclick="inquiry(${member.id})">조회</button></td>--%>

            </tr>
        </c:forEach>
    </table>
</body>
</html>
