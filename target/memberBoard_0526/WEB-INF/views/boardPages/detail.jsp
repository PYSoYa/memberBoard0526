<%--
  Created by IntelliJ IDEA.
  User: PARKYUNSEOK
  Date: 2022-05-27
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
    <script src="../../../resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <style>
        .main {
            border: 1px solid;
            border-inline-style: hidden;
            border-top: hidden;
            height: 400px;
            width: 400px;
            position: relative;
            top: 0%;
            left: 10%;
            /*transform: translate(-50%, -35%);*/

        }
        #commentContents {
            box-sizing: border-box;
            border: 1px solid #bad4ff;
            border-radius: 4px;
            width: 100%;
            height: 200px;
            margin-bottom: 20px;
        }
        input:focus {
            box-shadow: 0 0 8px 0 #bad4ff;
            outline: none;

        }
        input:focus::placeholder {
            font-size: 2px;
            text-align: center;
            position: fixed;
            left: 0;
            top: 0;
            transition: 0.2s;
        }
        input[type="text"] {
            box-sizing: border-box;
            border: 1px solid #bad4ff;
            border-radius: 4px;
            width: 100%;
            height: 40px;
            margin-bottom: 20px !important;
        }
        #button1 {
            font-family: 'Noto Sans KR', sans-serif;
            margin-left: 1px;
            height: 40px;
            width: 100%;
            background-color: #222222;
            display: inline-block;
            border-color: #222222;
            border-radius: 4px;
            color: white;
            margin-top: 40px;
            margin-bottom: 40px;

        }
    </style>
</head>
<body>
<jsp:include page="../header/header.jsp" flush="false"></jsp:include>

<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>작성시간</th>
            <th>첨부파일</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
            <tr>
                <td>${board.id}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardFileName}</td>
                <c:choose>
                    <c:when test="${memberId!=boardWriter}">
                        <td><a class="visually-hidden">수정</a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a class="page-link" href="/board/update?id=${board.id}">수정</a></td>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${memberId!=boardWriter || memberId=='admin'}">
                        <td><a class="visually-hidden">삭제</a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a class="page-link" href="/board/delete?id=${board.id}">삭제</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
    </table>
</div>
<br>
<div class="main">
    <div class="style-a">
        <input type="text" id="commentWriter" value="${sessionScope.loginMemberId}" placeholder="작성자" readonly>
    </div>
    <div class="style-a">
        <textarea type="text" id="commentContents" placeholder="내용"></textarea>
    </div>
    <button id="button1" style="height:38.5px;">댓글작성</button>
</div>
<br>
<div id="comment-list">
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성기간</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                <c:choose>
                    <c:when test="${memberId!=boardWriter || memberId=='admin'}">
                        <td><a class="visually-hidden">삭제</a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a class="page-link" href="/board/commentDelete?id=${comment.id}">삭제</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    $("#comment-write-btn").click(function (){
        const cWriter = document.getElementById("commentWriter").value;
        const cContents = $("#commentContents").val();
        const boardId = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": cWriter,
                "commentContents": cContents,
                "boardId": boardId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='${sessionScope.loginMemberId}';
                document.getElementById('commentContents').value='';
            },
            error: function () {
                alert("ㅋㅋ에러");
            }
        });
    });
</script>
</html>
