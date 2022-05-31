<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-27
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/member/update" method="post" name="memberUpdate" enctype="multipart/form-data">
    <input type="hidden" id="id" name="id" value="${updateMember.id}" readonly>
    <input type="password" id="passCheck" name="memberPassword"  placeholder="비밀번호"> <br>
    <input type="text" id="memberName" name="memberName" value="${updateMember.memberName}" placeholder="이름"><br>
    <input type="text" id="memberEmail" name="memberEmail" value="${updateMember.memberEmail}" placeholder="이메일"><br>
    <input type="file" id="memberPhoto" name="memberPhoto" value="${updateMember.memberPhoto}" placeholder="프로필사진"><br>
    <input type="button" onclick="modify()" value="정보수정">
</form>
</body>
<script>
    const modify = () => {
        const passCheck = document.getElementById("passCheck").value;
        const passwordDB = '${updateMember.memberPassword}';
        if(passCheck  === passwordDB){
            alert("비밀번호가 일치합니다.");
            memberUpdate.submit();
        }else{
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>
