<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.ScheduleDao" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>강의실 조회</title>
    <link rel="stylesheet" type="text/css" href="/admin/schedule.css">
    <style>
        .details .schedulelist
        {
            position: relative;
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-top: 10px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/admin/adminMainForm.jsp">
                    <img src="../images/symbol.png" class="symbol" />
                    <span class="title">컴퓨터소프트웨어공학과</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/mypage.jsp">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <span class="title">마이페이지</span>
                </a>
            </li>
            <li class="list">
                <a href="">
                    <span class="icon"><ion-icon name="person-add"></ion-icon></span>
                    <span class="title">아이디 생성</span>
                </a>
            </li>
            <li class="list">
                <a href="">
                    <span class="icon"><ion-icon name="search"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/admin/inputScheduleForm.jsp">
                    <span class="icon"><ion-icon name="calendar"></ion-icon></span>
                    <span class="title">강의 정보 입력</span>
                </a>
            </li>
            <li class="list">
                <a href="">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/inquiry/inquiryList.jsp">
                    <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                    <span class="title">문의하기</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>
            <div class="user">
                <ul>
                    <li> <%=session.getAttribute("name")%></li>
                    <li><a href="../home/logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>

        <div class="details">
            <div class="schedulelist">
                <table>
                    <thead>
                    <tr>
                        <td> 수업 </td>
                        <td> 강의실 </td>
                        <td> 시작시간 </td>
                        <td> 끝나는 시간 </td>
                        <td> 요일</td>
                    </tr>

                    </thead>
                    <tbody>
                    <%
                        ScheduleDao dao = ScheduleDao.getInstance();
                        ResultSet rs = dao.getSchedule();

                        while(rs.next()){
                    %>
                        <tr>
                            <td><%=rs.getString("schedule_name")%> </td>
                            <td><%=rs.getString("schedule_lectureroom_num")%> </td>
                            <td><%=rs.getString("schedule_class_Stime")%> </td>
                            <td><%=rs.getString("schedule_class_Etime")%> </td>
                            <td><%=rs.getString("schedule_week")%> </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

    let list = document.querySelectorAll('.list');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('actives'));
        this.classList.add('actives');

    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));
</script>
</body>
</html>
