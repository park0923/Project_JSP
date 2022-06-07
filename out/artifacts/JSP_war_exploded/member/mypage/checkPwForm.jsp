<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-14
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <html>
    <style>

        #main{
            width:60%;
            margin:auto;
        }
        .details{
            left: 350px;
            top: 40px;
        }
        .details .checkPw{
            position: relative;
            width: 700px;
            height: 180px;
            padding: 30px;
            margin-top: 50px;
            margin-left: 400px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);

        }
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        ul,
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .register{
            width: 550px;
            height: 600px;
            margin: 200px auto 0;
            padding: 15px 15px;
            background: white;
            color: #2b2e4a;
            font-size: 14px;
            text-align: left;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }
        .register h3{
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .register input{
            width: 100%;
            height: 40px;
            outline: none;
            padding: 10px;
            border: 1px solid #707070;
            transition: 0.3s;
        }
        .register input:valid, .register input:focus{
            border: 1px solid #2b2e4a;
        }
        .register .center{
            display: flex;
            align-items: center;
        }
        .register .flex{
            display: flex;
            flex-direction: column;
        }
        .register .flex .container{
            display: grid;
            grid-template-columns: 1fr 3fr 1fr;
            margin-bottom: 10px;
        }
        .register .flex .container .item:first-child{
            margin-right: 10px;
        }
        .register .flex .container .item .idcheck{
            height: 100%;
            margin-left: 10px;
            padding: 5px 15px;
            background: #2b2e4a;
            border: 1px solid #2b2e4a;
            color: white;
            font-size: 12px;
            transition: 0.3s;
        }
        .register .flex .container .item .idcheck:hover{
            background: white;
            color: #2b2e4a;
        }
        .register .flex .container .item select{
            height: 40px;
            padding: 10px;
            border: 1px solid #2b2e4a;

        }
        .register .submit{
            width: 100%;
            height: 40px;
            color: white;
            border: none;
            border: 1px solid #2b2e4a;
            background: #2b2e4a;
            transition: 0.3s;
        }
        .register .flex .container:last-child{
            margin: 0;
        }
        .register .submit:hover{
            width: 100%;
            height: 40px;
            border: none;
            border: 1px solid #2b2e4a;
            color: #2b2e4a;
            background: white;
        }
        table {
            /*width: 100%;*/
            border: 1px solid #444444;
            padding: 5px;
            margin-left: auto;
            margin-right: auto;
        }

        td {
            /*width: 100%;*/
            /*border: 1px solid #444444;*/
        }

        .c {
            text-align: center;
        }
        .custom-btn1 {
            width: 100px;
            height: 50px;
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
            margin-left: 0px;
            margin-top: 0px;
        }
        .btn-11 {
            background: rgb(19, 109, 252);
            background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
            border: none;
        }
        .btn-11:hover {
            background: rgb(0,3,255);
            background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
        }

        .left {
            width: 50%;
            float: left;
            margin-top: 200px;

        }
        .right {
            width: 50%;
            float: right;
            display: inline-block;
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

    </style>
    <head>
        <title>회원정보 수정</title>
        <script src="../form.js"></script>
<%--        <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">--%>
        <link rel="stylesheet" type="text/css" href="../main.css">
    </head>
    <body>
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
                    <h1>회원정보 수정</h1>
                    <hr/>
                    <div class="checkPw">
                    <form action="memberUpdateForm.jsp" method="post" name="check_form">


                        <div class="inquiryBox">
                            <div class="inputbox">
                                <input type="password" name="pw"  placeholder="비밀번호 입력">
                            </div>
                            <div class="c" style="margin-left: 325px; width: 300px;">
                                <input class="custom-btn1 btn-11 " type="button" value="확인" onclick="confirmPassword()">
                                <input class="custom-btn1 btn-11 " type="button" value="취소" onclick="location.href='../mainForm.jsp'">
                            </div>
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
