<%@ page import="java.sql.ResultSet" %>
<%@ page import="mysql.testDAO" %>
<%@ page import="beans.testDTO" %>
<%@ page import="mysql.ScheduleDao" %>
<%@ page import="beans.ScheduleDto" %>
<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 조회</title>
    <link rel="stylesheet" type="text/css" href="../member/main.css">
    <style>
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
        .left{
            display: inline-block;
            float: left;
        }
    </style>
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
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <div class="left">
                    <select onChange="change(this.options[this.selectedIndex].value)" style="width: 100px" style="height: 20px">
                        <option selected>강의실 선택</option>
                        <option value="selectBox01">915</option>
                        <option value="selectBox02">916</option>
                        <option value="selectBox03">918</option>
                        <option value="selectBox04">911</option>
                    </select>
                </div>

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
                            ScheduleDao dao = ScheduleDao.getInstance();
                            ResultSet rs = dao.getSchedule();
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
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<SCRIPT LANGUAGE="JavaScript">
    function change(style) {

        if( style == "selectBox01" )
        {
            test.style.display= "inline"
            view1.style.display = "inline"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox02" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "inline"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox03" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "inline"
            view4.style.display = "none"
        }
        if( style == "selectBox04")
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "inline"
        }

    }
</SCRIPT>
</body>
</html>
