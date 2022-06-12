<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-06-10
  Time: 오후 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../navigation.css">
    <style>
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        form
        {
            position: relative;
            width: 100%;
        }
        .container h3
        {
            color: #000000;
            font-weight: 600;
            font-size: 2em;
            width: 100%;
            text-align: center;
            margin-bottom: 30px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .inputbox
        {
            position: relative;
            width: 100%;
            margin-bottom: 20px;
        }
        .inputbox span
        {
            display: inline-block;
            color: black;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.75em;
            border-left: 4px solid black;
            padding-left: 4px;
            line-height: 1em;
        }
        .inputbox .box
        {
            display: flex;
            justify-content: center;
        }
        .inputbox .box .icon
        {
            position: relative;
            min-width: 40px;
            height: 40px;
            background: #4682B4;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            margin-right: 10px;
            font-size: 1.15em;
            box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
        }
        .inputbox .box input
        {
            position: relative;
            width: 50%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
        }
        .inputbox .box input[type="submit"]
        {
            background: lightskyblue;
            border-radius: 30px;
            box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
            color: white;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            margin-top: 10px;
            width: 25%;
            margin-right: 40px;
        }
        .inputbox .box input[type="submit"]:hover
        {
            color: #4682B4;
        }
        .inputbox .box input[type="button"]
        {
            background: lightskyblue;
            border-radius: 30px;
            box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
            color: white;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            margin-top: 10px;
            width: 25%;
        }
        .inputbox .box input[type="button"]:hover
        {
            color: #4682B4;
        }
    </style>
</head>
<link rel="stylesheet" type="text/css" href="/member/main.css">
<body>
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
                <form action="../home/joinProcess.jsp" method="post" name="join_form">
                    <h3>Sign Up</h3>
                    <div class="inputbox">
                        <span>ID</span>
                        <div class="box">
                            <div class="icon"><ion-icon name="person"></ion-icon></div>
                            <input type="text" name="id">
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>Password</span>
                        <div class="box">
                            <div class="icon"><ion-icon name="lock-closed"></ion-icon></div>
                            <input type="password" name="pw">
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>Name</span>
                        <div class="box">
                            <div class="icon"><ion-icon name="pricetag"></ion-icon></div>
                            <input type="text" name="name">
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>Phone</span>
                        <div class="box">
                            <div class="icon"><ion-icon name="book"></ion-icon></div>
                            <input type="text" name="phone">
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>Email</span>
                        <div class="box">
                            <div class="icon"><ion-icon name="book"></ion-icon></div>
                            <input type="text" name="email">
                        </div>
                    </div>
                    <div class="inputbox">
                        <div class="box">
                            <input type="submit" value="Sign Up">
                            <input type="button" value="Back" onclick=history.back()>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
