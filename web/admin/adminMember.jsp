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
