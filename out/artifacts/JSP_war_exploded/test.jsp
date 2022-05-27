<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-26
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .nav{
            width: 20%;
            height: 100%;
            float: left;
        }
        .main{
            width: 80%;
            float: right;
        }
        .header{
            width: 100%;
            padding-bottom: 5%;
        }
        .contents{
            height: 100%;
            width: 100%;
            background-color: red;
            position: relative;

        }
        .details{
            height: 90%;
            width: 90%;
            top: 5%;
            left: 5%;
            position: absolute;
            background-color: white;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <%@ include file="navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
