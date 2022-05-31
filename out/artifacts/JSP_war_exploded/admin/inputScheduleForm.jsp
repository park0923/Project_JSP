<%@ page import="mysql.ScheduleDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="beans.ScheduleDto" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 정보 입력</title>
    <link rel="stylesheet" type="text/css" href="schedule.css">
    <style>
        .details .scheduleBox
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

        .details .scheduleBox from
        {
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .details .scheduleBox .inputbox
        {
            position: relative;
            width: 50%;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .details .scheduleBox .inputbox input
        {
            position: relative;
            width: 40%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .scheduleBox .inputbox select
        {
            position: relative;
            width: 40%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .scheduleBox .inputbox .box
        {
            margin-top: 10px;
        }
        .details .scheduleBox .inputbox input[type="submit"],
        .details .scheduleBox .inputbox input[type="reset"]
        {
            background: var(--blue);
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            width: 40%;
        }
        .details .scheduleBox .inputbox input[type="submit"]:hover,
        .details .scheduleBox .inputbox input[type="reset"]:hover
        {
            background: var(--blue2);
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
                <a href="/admin/inputScheduleForm.jsp.jsp">
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
            <div class="scheduleBox">
                <div class="title">
                    <h1>강의 시간표 등록</h1>
                    <hr/>
                </div>
                <form action="./inputprocsee.jsp" method="post" name="join_form">
                    <div class="inputbox">
                        <span>강의 이름</span>
                        <div class="box">
                            <input type="text" name="schedule_name">
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>사용 강의실</span>
                        <div class="box">
                            <select name="schedule_lectureroom_num" onChange="change(this.options[this.selectedIndex].value)">
                                <option selected>강의실 선택</option>
                                <option name="selectBox01" value="915">915</option>
                                <option name="selectBox02" value="916">916</option>
                                <option name="selectBox03" value="918">918</option>
                                <option name="selectBox04" value="911">911</option>
                            </select>
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>수업시작 시간</span>
                        <div class="box">
                            <select name="schedule_class_stime" onchange="categoryChange(this)" >
                                <option>시작 시간 선택</option>
                                <option value="09:00">09:00</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                                <option value="20:00">20:00</option>
                            </select>
                        </div>
                    </div>
                    <div class="inputbox">
                        <span>수업종료 시간</span>
                        <div class="box">
                            <select name="schedule_class_etime" onchange="categoryChange(this)">
                                <option>종료 시간 선택</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                                <option value="20:00">20:00</option>
                                <option value="21:00">21:00</option>
                            </select>
                        </div>
                        <div class="inputbox">
                            <span>수업 날짜</span>
                            <div class="box">
                                <select name="schedule_week" onChange="change(this.options[this.selectedIndex].value)" >
                                    <option selected>요일 선택</option>
                                    <option value="MON">월</option>
                                    <option value="TUE">화</option>
                                    <option value="WED">수</option>
                                    <option value="THU">목</option>
                                    <option value="FRI">금</option>
                                    <option value="SAT">토</option>
                                </select>
                            </div>
                        </div>
                        <div class="inputbox">
                            <div class="box">
                                <input type="submit" value="INSERT">
                                <input type="reset" value="Reset">
                            </div>
                        </div>
                    </div>
                </form>
<%--                <div class="right">--%>
<%--                    <div class="register" style="padding-left: 40px;">--%>
<%--                        <h3>강의 시간표 등록</h3>--%>


<%--                    </div>--%>

<%--                    <div class="left">--%>
<%--                        <section id="test" style="display: none">--%>
<%--                            <table id="view1" height="600" style="color: #121212" style="display: none"> <!--915 강의 시간표-->--%>
<%--                                <caption>▶  강의 시간표  ◀</caption>--%>
<%--                                    <Tr>--%>
<%--                                        <td>월</td>--%>
<%--                                        <td>화</td>--%>
<%--                                        <td>수</td>--%>
<%--                                        <td>목</td>--%>
<%--                                        <td>금</td>--%>
<%--                                    </Tr>--%>
<%--                                    <%--%>
<%--                                        ScheduleDao dao = ScheduleDao.getInstance();--%>
<%--                                        ResultSet rs = dao.getSchedule();--%>
<%--                                        System.out.println(rs);--%>
<%--                                        while(rs.next()){--%>
<%--                                            ScheduleDto dto = new ScheduleDto();--%>
<%--                                            dto.setSchedule_name(rs.getString("schedule_name"));--%>
<%--                                            dto.setSchedule_lectureroom_num(rs.getString("schedule_lectureroom_num"));--%>
<%--                                            dto.setSchedule_class_Stime(rs.getString("schedule_class_Stime"));--%>
<%--                                            dto.setSchedule_class_Etime(rs.getString("schedule_class_Etime"));--%>
<%--                                            dto.setSchedule_week(rs.getString("schedule_week"));--%>
<%--                                    %>--%>
<%--                                    <form action="testAction.jsp" method="post">--%>


<%--                                        <tr>--%>
<%--                                            <th><%=rs.getString("schedule_lectureroom_num") %></th>--%>
<%--                                            <td><%=rs.getString("schedule_lectureroom_num") %></td>--%>
<%--                                            <td><%=rs.getString("schedule_class_Stime") %></td>--%>
<%--                                            <td><%=rs.getString("schedule_class_Etime") %></td>--%>
<%--                                            <td><%=rs.getString("schedule_week") %></td>--%>
<%--                                        </tr>--%>
<%--                                    </form>--%>
<%--                                    <%--%>
<%--                                        }--%>
<%--                                    %>--%>
<%--                            </table>--%>
<%--                        </section>--%>
<%--                    </div>--%>
                </div>
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
