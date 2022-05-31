<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="beans.testDTO"%>
<%@ page import="mysql.testDAO"%>

<html>
<head>

    <title>문의하기</title>
    <link rel="stylesheet" type="text/css" href="/member/inquiry.css">
    <link rel="stylesheet" type="text/css" href="/member/schedule.css">
</head>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "login.jsp";
</script>
<%
    }
%>
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

<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/member/mainview.jsp">
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
                <a href="/member/reservation.jsp">
                    <span class="icon"><ion-icon name="today"></ion-icon></span>
                    <span class="title">강의실 예약</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/reservationcheck.jsp">
                    <span class="icon"><ion-icon name="search"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/classroominquiry.jsp">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list actives">
                <a href="/member/inquiry.jsp">
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
                    <li><a href="logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>
        <div id="main">
            <div class="right">
                <div class="register" style="padding-left: 40px;">
                    <h3 style="margin-bottom: 50px; border-left-width: 0px; margin-left: 0px; padding-top: 50px;">강의 시간표 등록</h3>

                    <form action="./testAction.jsp" method="post" name="join_form">
                        <div class="flex">
                            <ul class="container">
                                <li class="item center">
                                    강의 이름
                                </li>
                                <li class="item">
                                    <input type="text" name="schedule_name" autofocus required>
                                </li>
                                <li class="item">

                                </li>
                            </ul>


                            <ul class="container">
                                <li class="item center">
                                    사용 강의실
                                </li>
                                <li class="item" >
                                    <select name="schedule_lectureroom_num" onChange="change(this.options[this.selectedIndex].value)" style="padding-right: 26px; width:148px;" >
                                        <option selected>강의실 선택</option>
                                        <option name="selectBox01" value="915">915</option>
                                        <option name="selectBox02" value="916">916</option>
                                        <option name="selectBox03" value="918">918</option>
                                        <option name="selectBox04" value="911">911</option>
                                    </select>
                                </li>
                            </ul>
                            <ul class="container">
                                <li class="item center">
                                    수업시작 시간
                                </li>
                                <li class="item">
                                    <select name="schedule_class_Stime" onchange="categoryChange(this)" style="padding-right: 26px;  width:148px;">
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
                                </li>
                            </ul>
                            <ul class="container">
                                <li class="item center">
                                    수업종료 시간
                                </li>
                                <li class="item">
                                    <select name="schedule_class_Etime" id="endTime" style="padding-right: 26px;  width:148px;">

                                        <option value="">종료 시간 선택</option>
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
                                </li>
                            </ul>
                            <ul class="container">
                                <li class="item center">
                                    수업 날짜
                                </li>
                                <li class="item" >
                                    <select name="schedule_week" onChange="change(this.options[this.selectedIndex].value)" style="padding-right: 26px; width:148px;" >
                                        <option selected>요일 선택</option>
                                        <option value="월">월</option>
                                        <option value="화">화</option>
                                        <option value="수">수</option>
                                        <option value="목">목</option>
                                        <option value="금">금</option>
                                        <option value="토">토</option>
                                    </select>
                                </li>
                                <li class="item">

                                </li>
                            </ul>
                            <ul class="container">
                                <li class="item center">
                                </li>

                                <li class="item">
                                    <button type="submit" class="submit">수업 등록</button>
                                </li>

                            </ul>
                        </div>
                    </form>
                </div>
            </div>

            <div class="left">
                <%--<section>
                <%
                    DatabaseUtil.getConnection();
                    Connection conn=null;
                    Statement stmt=null;
                    ResultSet rs = null;
                    String query = "SELECT schedule_name,schedule_lectureroom_num,schedule_class_Stime,schedule_class_Etime,schedule_week FROM  schedule";
                    rs=stmt.executeQuery(query);

                %>
                <table>
                    <tr>
                    <td>
                        수업 이름
                    </td>
                    <td>
                        강의실
                    </td>
                    <td>
                        시작 시간
                    </td>
                    <td>
                        끝나는 시간
                    </td>
                    <td>
                        요일
                    </td>
                    </tr>
                <%
                    while (rs.next()){


                %><tr>
                <td><% rs.getString(1); %></td>
                <td><% rs.getString(2); %></td>
                <td><% rs.getString(3); %></td>
                <td><% rs.getString(4); %></td>
                <td><% rs.getString(5); %></td>
            </tr>
                    <% } %></table>
                </section>--%>
                    <section id="test" style="display: none">

                        <table id="view1" height="600" style="color: #121212" style="display: none"> <!--915 강의 시간표-->
                            <caption>▶  강의 시간표  ◀</caption>
                            <Tr>
                                <td>월</td>
                                <td>화</td>
                                <td>수</td>
                                <td>목</td>
                                <td>금</td>
                            </Tr>
                            <%
                                testDAO dao = testDAO.getInstance();
                                ResultSet rs = dao.getSchedule();
                                System.out.println(rs);
                                while(rs.next()){
                                    testDTO dto = new testDTO();
                                    dto.setSchedule_name(rs.getString("schedule_name"));
                                    dto.setSchedule_lectureroom_num(rs.getString("schedule_lectureroom_num"));
                                    dto.setSchedule_class_Stime(rs.getString("schedule_class_Stime"));
                                    dto.setSchedule_class_Etime(rs.getString("schedule_class_Etime"));
                                    dto.setSchedule_week(rs.getString("schedule_week"));
                            %>
                            <form action="testAction.jsp" method="post">


                                <tr>
                                    <th><%=rs.getString("schedule_lectureroom_num") %></th>
                                    <td><%=rs.getString("schedule_lectureroom_num") %></td>
                                    <td><%=rs.getString("schedule_class_Stime") %></td>
                                    <td><%=rs.getString("schedule_class_Etime") %></td>
                                    <td><%=rs.getString("schedule_week") %></td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                        </table>

                    </section>

            </div>
        </div>
        </div>
    </div>

</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="../../../../../../../../IdeaProjects/demo2/src/main/webapp/selectTime.js"></script>
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

    function change(style) {


        if( style == "915" )
        {
            test.style.display= "inline"
            view1.style.display = "inline"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "916" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "inline"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "918" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "inline"
            view4.style.display = "none"
        }
        if( style == "911")
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "inline"
        }
    }

</script>
</body>
</html>