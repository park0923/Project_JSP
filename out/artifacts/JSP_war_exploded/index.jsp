<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>컴퓨터소프트웨어공학과 강의실 대여시스템</title>
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
      background: linear-gradient(#4682B4,#FFFFFF);
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

    .container
    {
      position: absolute;
      width: 90%;
      height: 50%;
      display: flex;
      flex-direction: row;
      background: #4682B4;
      justify-content: space-between;
      padding: 0;
    }

    .container  img
    {
      position: relative;
      display: flex;
    }
    .container  img#coding
    {
      width: 70%;
      height: 100%;
    }
    .container .middle_title
    {
      position: relative;
      width: 30%;
      height: 100%;
      display: flex;
      margin: 10px;
      min-width: 500px;
      flex-direction: column;
      justify-content: start;
      align-items: start;
    }
    .container .middle_title h1
    {
      margin-bottom: 4px;
      color: white;
      min-width: 200px;
    }
    .container .middle_title h3
    {
      margin-bottom: 50px;
      color: white;
      min-width: 200px;
    }
    .container .middle_title p
    {
      font-size: 30px;
      color: white;
      min-width: 200px;
    }

  </style>
</head>
<body>
<header>
  <div class="symbol_logo">
    <a href="index.jsp"> <img src="images/symbol.png" class="symbol" /></a>
    <a href="index.jsp" class="logo">컴퓨터소프트웨어공학전공</a>
  </div>
  <ul>
    <li><a href="/home/joinform.jsp">Sing Up</a></li>
    <li><a href="/home/loginForm.jsp">Log In</a></li>
  </ul>
</header>
<div class="container">
  <img src="images/coding.jpg" id="coding" />
  <div class="middle_title">
    <h1>컴퓨터소프트웨어공학전공</h1>
    <h3>ComputerSoftware Engineering</h3>
    <p>컴퓨터소프트웨어공학과 <br>강의실 예약 시스템 </p>
  </div>
</div>
</body>
</html>
