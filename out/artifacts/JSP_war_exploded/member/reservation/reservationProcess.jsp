<%@ page import="java.nio.charset.StandardCharsets" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-19
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.ReservationDto" %>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] timeArray = request.getParameter("startTime").split(" ~ ");
    String[] seatArray = request.getParameterValues("seatList");
    String[] endHourArray = timeArray[1].split(":");


    ReservationDto reservationDto = new ReservationDto.Builder()
            .id((String) session.getAttribute("id"))
            .lectureroomNum(request.getParameter("lectureRoom"))
            .startTime(timeArray[0])
            .endTime(timeArray[1])
            .date(request.getParameter("date"))
            .build();
    ReservationDao dao = ReservationDao.getInstance();

    if(Integer.parseInt(endHourArray[0])<=17){
        for(int i=0; i<seatArray.length; i++){
            if(dao.insertReservationAm(reservationDto, seatArray[i]) == ReservationDao.RESERVATION_SUCCESS){
                if(i == seatArray.length - 1){
%>
                    <script>
                        alert("예약에 성공 했습니다.");
                        location.href = '../mainForm.jsp';
                    </script>
<%
                }else {
%>
                    <script>
                        alert("예약에 실패하였습니다.");
                    </script>
<%
                }
            }
        }
    }else {
        for(int i=0; i<seatArray.length; i++){
            if(dao.insertReservation(reservationDto,seatArray[i]) == ReservationDao.RESERVATION_SUCCESS){
                if(i == seatArray.length - 1){
%>
                    <script>
                        alert("예약에 성공 했습니다.");
                        location.href = '../mainForm.jsp';
                    </script>
<%
                }
            }else {
%>
                <script>
                    alert("예약에 실패하였습니다.");
                </script>
<%
            }
        }
    }
%>