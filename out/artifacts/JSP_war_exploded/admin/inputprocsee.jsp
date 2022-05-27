<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.ScheduleDao" %>

<%
    String schedule_name = request.getParameter("schedule_name");
    String schedule_lectureroom_num = request.getParameter("schedule_lectureroom_num");
    String schedule_class_stime = request.getParameter("schedule_class_stime");
    String schedule_class_etime = request.getParameter("schedule_class_etime");
    String schedule_week = request.getParameter("schedule_week");
    ScheduleDao dao = ScheduleDao.getInstance();
    System.out.println(schedule_name);
    System.out.println(schedule_lectureroom_num);
    System.out.println(schedule_class_stime);
    System.out.println(schedule_class_etime);
    System.out.println(schedule_week);
    if (dao.insertSchedule(schedule_name, schedule_lectureroom_num, schedule_class_stime, schedule_class_etime, schedule_week) == ScheduleDao.SCHEDULE_INSERT_SUCCESS){
%>
        <script>
            alert("강의 시간표 등록 성공");
            location.href="adminMainForm.jsp"
        </script>
<%
    }
%>