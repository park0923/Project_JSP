<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <style>
        .custom-btn {
            width: 500px;
            height: 100px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 5px;
            font-family: 'Lato', sans-serif;
            font-weight: bold;
            font-size: large;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: center;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            margin-top: 100px;
        }
        .btn-1 {
            background: rgb(19, 109, 252);
            background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
            border: none;
        }
        .btn-1:hover {
            background: rgb(0,3,255);
            background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "loginForm.jsp";
</script>
<%
    }
%>
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <h1>회원정보 수정</h1>
                <hr/>
                <button class="custom-btn btn-1" onclick="location.href='mypage/checkPwForm.jsp'">회원정보 수정</button>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
