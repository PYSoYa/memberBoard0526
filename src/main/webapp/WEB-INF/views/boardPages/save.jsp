<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-26
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../../resources/css/signup.css">
</head>
<body>
    <form action="/board/saveFile" method="post" enctype="multipart/form-data">
        <div class="main">
            <h2>글 작성</h2>
            <div class="style-a">
            <input type="text" id="boardTitle" name="boardTitle" placeholder="제목"> <br>
            </div>
            <div class="style-a">
                <input type="text" id="boardWriter" name="boardWriter" value="${sessionScope.loginMemberId}" placeholder="작성자" readonly> <br>
            </div>
            <div class="style-a">
                <textarea type="text" id="boardContents" name="boardContents" placeholder="내용"></textarea> <br>
            </div>
                <input type="file" id="boardFile" name="boardFile" placeholder="첨부파일"> <br>
            <input type="submit" id="button1" value="글 작성">
        </div>
    </form>
</body>
</html>
