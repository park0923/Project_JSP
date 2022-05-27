<%@ page import="java.util.Enumeration" %>
<%@ page import="beans.ReservationDto" %>
<%@ page import="mysql.ReservationDao" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-25
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("1");
    String date = request.getParameter("2");
    String room = request.getParameter("3");
    String seat = request.getParameter("4");
    String sTime = request.getParameter("5");
    String eTime = request.getParameter("6");
    ReservationDto reservationDto = new ReservationDto.Builder()
            .id(id)
            .date(date)
            .lectureroomNum(room)
            .seat(seat)
            .startTime(sTime)
            .endTime(eTime)
            .build();
    ReservationDao dao = ReservationDao.getInstance();
    if(dao.updateState(reservationDto) == ReservationDao.UPDATE_SUCCESS){
%>
        <script>
            alert("승인에 성공 했습니다.");
            location.href = document.referrer;
        </script>
<%
    }else {
%>
        <script>
            alert("예약에 실패하였습니다.");
            location.href = 'mainForm.jsp';
        </script>
<%
    }
%>