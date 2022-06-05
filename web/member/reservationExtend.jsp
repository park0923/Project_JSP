<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Locale" %>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-06-01
  Time: 오전 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
<%
    String seat = request.getParameter("seat");
    String date = request.getParameter("date");
    String room = request.getParameter("room");
    String sTime = request.getParameter("sTime");
    String[] ssTime = sTime.split(":");
    String eTime = request.getParameter("eTime");
    String[] eeTime = eTime.split(":");
    System.out.println(date+" "+sTime+" "+eTime);

    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
    calendar.setTime(sDate.parse(request.getParameter("date")));
    int week = calendar.get(Calendar.DAY_OF_WEEK);
System.out.println(seat+" "+ Integer.parseInt(ssTime[0])+" "+  room+" "+  week);
    ReservationDao dao = ReservationDao.getInstance();
    int timeC = dao.getExtendTime(seat, Integer.parseInt(ssTime[0]), room, week);
    if(timeC==0 || timeC-Integer.parseInt(eeTime[0])<0) {
        timeC=24;
    }
    int timeExtend = timeC-Integer.parseInt(eeTime[0]);

%>
  <input type="text" value="<%=timeExtend%>"> 시간 연장가능
  <form action="reservationExtendProcess.jsp?seat=<%=seat%>&date=<%=date%>&room=<%=room%>&sTime=<%=sTime%>&eTime=<%=eTime%>" method="post">
      <input type="number" name="time" min="1" max="<%=timeExtend%>">
      <input type="submit" value="연장하기">
  </form>

  </body>
</html>
