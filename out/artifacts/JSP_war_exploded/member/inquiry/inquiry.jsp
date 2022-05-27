<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문의하기</title>
    <link rel="stylesheet" type="text/css" href="../main.css">
    <style>
        .details .inquiryBox
        {
            position: relative;
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-top: 40px;
            margin-left: 200px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }

        .details .inquiryBox from
        {
            position: relative;
            background: var(--black1);
        }
        .details .inquiryBox .inputbox
        {
            position: relative;
            width: 100%;
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }
        .details .inquiryBox .inputbox input
        {
            position: relative;
            width: 80%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .inquiryBox .inputbox button
        {
            position: relative;
            width: 80%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .inquiryBox .inputbox textarea
        {
            position: relative;
            width: 80%;
            min-height: 600px;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 20px;
        }
        .details .inquiryBox .inputbox input[type="submit"]
        {
            background: var(--blue);
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            width: 40%;
        }
        .details .inquiryBox .inputbox input[type="submit"]:hover
        {
            background: var(--blue2);
        }
        .details .inquiryBox .inputbox button
        {
            background: var(--blue);
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            width: 40%;
        }
        .details .inquiryBox .inputbox button:hover
        {
            background: var(--blue2);
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
        <%@ include file="../../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <div class="title">
                    <h1>문의하기</h1>
                    <hr/>
                </div>
                <div class="inquiryBox">
                    <form action="inquiryprocess.jsp" method="post" name="inquiry_form">
                        <div class="inputBox">
                            <input type="text" name="title" placeholder="제목을 입력하세요.">
                        </div>
                        <div class="inputBox">
                            <textarea typeof="text" name="inquiry" placeholder="내용을 입력하세요"></textarea>
                        </div>
                        <div class="inputBox">
                            <input type="submit" value="작성">
                            <button type="button" onclick="location.href='inquiryList.jsp'">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
