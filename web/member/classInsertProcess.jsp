<%@ page import="beans.ScheduleDto" %>
<%@ page import="mysql.ScheduleDao" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-27
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("className");
    String roomNum = request.getParameter("lectureRoom");
    String sTime = request.getParameter("startTime");
    String eTime = request.getParameter("endTime");
    String week = request.getParameter("week");
    ScheduleDao dao = ScheduleDao.getInstance();
    if(dao.insertSchedule(name, roomNum, sTime, eTime, week)==ScheduleDao.SCHEDULE_INSERT_SUCCESS){
%>
<script>
    alert("강의 등록에 성공 했습니다.");
    location.href = 'mainForm.jsp';
</script>
<%
    }else {
%>
        <script>
            alert("강의 등록에 실패하였습니다.");
        </script>
<%
    }
%>