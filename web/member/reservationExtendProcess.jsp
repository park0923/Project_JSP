<%@ page import="mysql.ReservationDao" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-06-01
  Time: 오전 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String seat = request.getParameter("seat");
    String date = request.getParameter("date");
    String room = request.getParameter("room");
    String sTime = request.getParameter("sTime");
    String eTime = request.getParameter("eTime");
    String[] eeTime = eTime.split(":");
    int time = Integer.parseInt(request.getParameter("time"))+Integer.parseInt(eeTime[0]);
    System.out.println("zz");
    System.out.println(time);
    ReservationDao dao = ReservationDao.getInstance();
    if(dao.updateExtendTime(String.valueOf(time)+":00", seat, date, room, sTime, eTime)==ReservationDao.UPDATE_SUCCESS){
%>
<script>
    alert("연장에 성공 했습니다.");
    close();
</script>
<%
    }else {
%>
<script>
    alert("연장에 실패 했습니다.");
    close();
</script>
<%
    }
%>