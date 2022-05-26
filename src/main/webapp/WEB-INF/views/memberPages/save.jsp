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
</head>
<body>
    <h2>회원가입 페이지</h2>
    <form action="/member/save" method="post">
        <input type="text" id="memberId" name="memberId" placeholder="아이디">
        <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호">
        <input type="text" id="memberName" name="memberName" placeholder="이름">
        <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일">
        <input type="text" id="memberMobile" name="memberMobile" placeholder="전화번호">
        <input type="file" id="memberProfile" name="memberProfile" placeholder="프로필사진">
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
