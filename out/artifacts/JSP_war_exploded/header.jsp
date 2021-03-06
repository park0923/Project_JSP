<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-26
  Time: 오후 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
    ReservationDao r = ReservationDao.getInstance();
    Date d = new Date();
    SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
    String n = r.getLongTimeName(s.format(d));
    if(n=="") n = "현재 없음";
%>
<html>
<head>
    <title>Title</title>
    <style>
        .main.active
        {
            width: calc(100% - 80px);
            left: 80px;
        }
        .topbar
        {
            width: 100%;
            height: 60px;
            display: flex;
            justify-content: end;
            /*align-items: center;*/
            /*padding: 0 10px;*/
        }
        .toggle
        {
            position: relative;
            top: 0;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2.5em;
            cursor: pointer;
        }
        .user ul
        {
            display: flex;
            padding-right: 15px;
            font-size: 18px;
            justify-content: center;
            align-items: center;
        }
        .user ul li
        {
            list-style: none;
            margin-left: 20px;
        }
        .user ul li a
        {
            color: var(--black1);
            text-decoration: none;
        }
        .user_1{
            margin-right: 400px;
        }
        .user{
            margin-top: 10px ;
        }
    </style>
</head>
<body>

<div class="topbar">
    <div class="user">
        <ul style="justify-content: left; display: inline-block" class="user_1">
            <li>오늘 정리하는 사람: <%=n%></li>
        </ul>
        <ul style="justify-content: right; display: inline-block; margin-left: 430px" class="user_2">
            <li> <%=session.getAttribute("id")%></li>
        </ul>
        <ul style="justify-content: right; display: inline-block" class="user_3">
            <li><a href="/home/logout.jsp">로그아웃</a></li>
        </ul>
    </div>
</div>
<script>
    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }
</script>
</body>
</html>
