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
    int index = Integer.parseInt(request.getParameter("index"));
    System.out.println(name);
    System.out.println(room);
    System.out.println(sTime);
    System.out.println(eTime);
    System.out.println(week);
    System.out.println(sDate);
    System.out.println(eDate);
    ScheduleDao dao = ScheduleDao.getInstance();
    System.out.println(dao.selectScheduleIndex(name,room,sTime,eTime,week,sDate,eDate));
    if(dao.updateSchedule(name,room,sTime,eTime,week,sDate,eDate,index)==ScheduleDao.SCHEDULE_UPDATE_SUCCESS){
%>
<script>
    alert("수정 완료");
    close();
</script>
<%
    }else{
%>
<script>
    alert("오류");
    close();
</script>
<%
    }
%>