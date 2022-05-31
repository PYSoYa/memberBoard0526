<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-27
  Time: 오후 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/update" method="post" enctype="multipart/form-data">
    <input type="hidden" id="id" name="id" value="${board.id}" readonly>
   제목: <input type="text" id="boardTitle" value="${board.boardTitle}" name="boardTitle" placeholder="제목"> <br>
   내용: <input type="text" id="boardContents" name="boardContents"
           value="${board.boardContents}" placeholder="내용"> <br>
   첨부파일: <input type="file" id="boardFile" name="boardFile" value="${board.boardFile}" placeholder="첨부파일"> <br>
    <input type="submit" value="글 수정">

</form>
</body>
</html>
