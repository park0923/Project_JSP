<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-14
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.ReservationDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 예약 시스템</title>
    <link rel="stylesheet" type="text/css" href="/mainview.css">
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
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "../home/loginForm.jsp";
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
        <div class="cardBox">
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">강의실 예약</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="today"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">예약 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="search"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">강의실 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="calendar-clear"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">문의하기</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="chatbox-ellipses"></ion-icon>
                </div>
            </div>
        </div>
        <div class="contents">
            <div class="details">
                <div class="noticelist">
                    <div class="cardHeader">
                        <h2>Today</h2>
                        <a href="/member/classroominquiry.jsp" class="btn">View All</a>
                    </div>

                    <table>
                        <thead>
                        <tr>
                            <td>구분</td>
                            <td>915</td>
                            <td>916</td>
                            <td>918</td>
                            <td>911</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>2교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>3교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>4교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>5교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>6교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>7교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>8교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>9교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
