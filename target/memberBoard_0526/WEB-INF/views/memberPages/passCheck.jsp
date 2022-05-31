<%--
  Created by IntelliJ IDEA.
  User: dbstj
  Date: 2022-05-28
  Time: 오후 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <label for="passConfirm">비밀번호를 입력해주세요.</label> <br>
    <input type="text" id="passConfirm"> <br>
    <input type="button" onclick="passwordCheck()" value="삭제">
</body>
<script>
    const passwordCheck = () => {
        const passConfirm = document.getElementById("passConfirm").value;
        const psDB = '${member.memberPassword}';
        if(passConfirm === psDB){
            location.href = "/member/delete?id=${member.id}";
        }else{
            alert("비밀번호가 일치하지 않습니다.");
            location.href = "/member/detail?id=${member.id}";
        }
    }
</script>
</html>
