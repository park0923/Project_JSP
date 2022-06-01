<%@ page import="mysql.ScheduleDao" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-06-01
  Time: 오후 7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String room = request.getParameter("room");
    String sTime = request.getParameter("sTime");
    String eTime = request.getParameter("eTime");
    String week = request.getParameter("week");
    String sDate = request.getParameter("sDate");
    String eDate = request.getParameter("eDate");
    System.out.println(week);
    ScheduleDao dao = ScheduleDao.getInstance();
    int index = dao.selectScheduleIndex(name,room,sTime,eTime,week,sDate,eDate);
    if(dao.deleteSchedule(index)==ScheduleDao.SCHEDULE_DELETE_SUCCESS){
%>
<script>
    alert("삭제 완료");
    location.href='mainForm.jsp';
</script>
<%
    }
%>