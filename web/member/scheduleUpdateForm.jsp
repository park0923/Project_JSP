<%@ page import="mysql.ScheduleDao" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-06-01
  Time: 오후 6:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    ScheduleDao dao = ScheduleDao.getInstance();
    String name = request.getParameter("name");
    String room = request.getParameter("room");
    String sTime = request.getParameter("sTime");
    String eTime = request.getParameter("eTime");
    String week = request.getParameter("week");
    String sDate = request.getParameter("sDate");
    String eDate = request.getParameter("eDate");
    int index = dao.selectScheduleIndex(name,room,sTime,eTime,week,sDate,eDate);
%>
<form action="scheduleUpdateProcess.jsp" method="post" name="schedule_update_form">
    <table>
        <input type="hidden" name="index" value="<%=index%>">
        <tr>
            <td>강의명</td>
            <td><input type="text" name="name" value="<%=name%>"></td>
        </tr>
        <tr>
            <td>강의실</td>
            <td>
                <select name="room">
                    <option value="0">강의실 선택</option>
                    <option value="915">915</option>
                    <option value="916">916</option>
                    <option value="918">918</option>
                    <option value="911">911</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>강의 시작 시간</td>
            <td><select name="sTime" onchange="categoryChange(this)">
                <option value="0">시작 시간 선택</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                <option value="18:00">18:00</option>
                <option value="19:00">19:00</option>
            </select></td>
        </tr>
        <tr>
            <td>강의 종료 시간</td>
            <td>
                <select name="eTime" id="changeTime" onchange="disabledRoom(this)">
                    <option value="">종료 시간 선택</option>
                    <option>시작 시간을 선택하세요</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>요일</td>
            <td>
                <select name="week">
                    <option >요일 선택</option>
                    <option value="2">월</option>
                    <option value="3">화</option>
                    <option value="4">수</option>
                    <option value="5">목</option>
                    <option value="6">금</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>강의 시작 날짜</td>
            <td><input type="date" name="sDate" value="<%=sDate%>"></td>
        </tr>
        <tr>
            <td>강의 종료 날짜</td>
            <td><input type="date" name="eDate" value="<%=eDate%>"></td>
        </tr>
        <td><input type="button" value="수정" onclick="confirmModify()"> </td>
    </table>
</form>

<body>

<script>
    function confirmModify() {
        if(document.schedule_update_form.name.value === ""){
            alert("강의명을 입력하세요.");
            document.schedule_update_form.name.focus();
            return;
        }
        if(document.schedule_update_form.room.value === ""){
            alert("강의실을 입력하세요.");
            document.schedule_update_form.room.focus();
            return;
        }
        if(document.schedule_update_form.eTime.value === ""){
            alert("강의 종료 날짜를 입력하세요.");
            document.schedule_update_form.eTime.focus();
            return;
        }
        if(document.schedule_update_form.sTime.value === ""){
            alert("강의 시작 날짜를 입력하세요.");
            document.schedule_update_form.sTime.focus();
            return;
        }
        if(document.schedule_update_form.week.value === ""){
            alert("요일을 입력하세요.");
            document.schedule_update_form.week.focus();
            return;
        }
        if(document.schedule_update_form.sDate.value === ""){
            alert("강의 시작 날짜를 입력하세요.");
            document.schedule_update_form.sDate.focus();
            return;
        }
        if(document.schedule_update_form.eDate.value === ""){
            alert("강의 종료 날짜를 입력하세요.");
            document.schedule_update_form.eDate.focus();
            return;
        }
        document.schedule_update_form.submit();
    }
    function categoryChange(e) {
        var endTime_0 = ["시작 시간을 선택하세요"];
        var endTime_1 = ["10:00"];
        var endTime_2 = ["11:00"];
        var endTime_3 = ["12:00"];
        var endTime_4 = ["13:00"];
        var endTime_5 = ["14:00"];
        var endTime_6 = ["15:00"];
        var endTime_7 = ["16:00"];
        var endTime_8 = ["17:00"];
        var target = document.getElementById("changeTime");
        var room = document.getElementById("Room");

        if(e.value == "0") {
            var d = endTime_0;
        }
        else if(e.value == "9:00") {
            var d = endTime_1;
        }
        else if(e.value == "10:00") {
            var d = endTime_2;
        }
        else if(e.value == "11:00") {
            var d = endTime_3;
        }
        else if(e.value == "12:00") {
            var d = endTime_4;
        }
        else if(e.value == "13:00") {
            var d = endTime_5;
        }
        else if(e.value == "14:00") {
            var d = endTime_6;
        }
        else if(e.value == "15:00") {
            var d = endTime_7;
        }
        else if(e.value == "16:00") {
            var d = endTime_8;
        }

        target.options.length = 0;

        for (x in d) {
            var opt = document.createElement("option");
            opt.name = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
        }
    }
</script>
</body>
</html>
