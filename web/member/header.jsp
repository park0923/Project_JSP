<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-04-13
  Time: 오후 7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }
        body
        {
            height: 100%;
            overflow-x: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: row;
        }
        header
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 30px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 10000;
        }
        header .symbol_logo{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        header .symbol
        {
            width: 50px;
            height: 50px;
        }
        header .logo
        {
            color: #fff;
            font-weight: 700;
            text-decoration: none;
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding-left: 10px;
        }
        header .logo:hover
        {
            color: black;
        }
        header ul
        {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        header ul li
        {
            list-style: none;
            margin-left: 20px;
        }
        header ul li a
        {
            text-decoration: none;
            padding: 6px 15px;
            color: #fff;
            border-radius: 20px;
        }
        header ul li a:hover
        {
            color: black;
        }
    </style>
</head>
<body>
    <header>
        <div class="symbol_logo">
            <a href="../index.jsp"> <img src="../images/symbol.png" class="symbol" /></a>
            <a href="../index.jsp" class="logo">컴퓨터소프트웨어공학전공</a>
        </div>
        <ul>
            <li><a href="/home/joinform.jsp">Sing Up</a></li>
            <li><a href="/home/loginForm.jsp">Log In</a></li>
        </ul>
    </header>
</body>
</html>
