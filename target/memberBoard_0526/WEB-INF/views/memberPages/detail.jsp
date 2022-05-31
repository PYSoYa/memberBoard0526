<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-27
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>프로필사진</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <tr>
            <td>${member.id}</td>
            <td>${member.memberId}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberMobile}</td>
            <td>${member.memberProfile}</td>
            <td><a href="/member/update">수정</a></td>
            <td><a href="/member/passCheck">삭제</a></td>
        </tr>
    </table>
</div>
</body>
    <script>
        // const modify = () => {
        //     location.href = "/member/update";
        // }
        // const memberDelete = (id) => {
        //     location.href = "/member/passCheck";
        // }
    </script>
</html>
