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
    <link rel="stylesheet" href="../../../resources/css/signup.css">
    <script src="../../../resources/js/jquery.js"></script>
</head>
<body>

    <form action="/member/save" method="post" enctype="multipart/form-data">
        <div class="main">
            <h1>회원가입 페이지</h1>
            <div class="style-a">
                <input type="text" id="memberId" name="memberId" onblur="duplicateCheck()" placeholder="아이디">
                <span id="check"></span>
            </div>
            <div class="style-a">
                <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호"> <br>
            </div>
            <div class="style-a">
                <input type="text" id="memberName" name="memberName" placeholder="이름"><br>
            </div>
            <div class="style-a">
                <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일"><br>
            </div>
            <div class="style-a">
                <input type="text" id="memberMobile" name="memberMobile" placeholder="전화번호"><br>
            </div>
            <input type="file" id="memberPhoto" name="memberPhoto" placeholder="프로필사진"><br>

            <input id="button1" type="submit" value="회원가입">
        </div>
    </form>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const check = document.getElementById("check");
        const btn = document.getElementById("button1");
        $.ajax({
            type: "post",
            url: "/member/duplicateCheck",
            data: {"memberId":memberId},
            dataType: "text",
            success: function (result){
                if(result === ""){
                    check.innerHTML = "아이디를 입력해주세요.";
                    check.style.color = "red";
                    btn.setAttribute('disabled', 'true');
                }
                else if(result === "ok" && result != ""){
                    check.innerHTML = "사용가능한 아이디입니다.";
                    check.style.color = "green";
                    btn.removeAttribute('disabled');
                }
                else{
                    check.innerHTML = "중복된 아이디입니다.";
                    check.style.color = "red";
                    btn.setAttribute('disabled', 'true');
                }
            },
            error: function (){
                alert("오류 ㅎ");
            }
        });
    }
</script>
</html>
