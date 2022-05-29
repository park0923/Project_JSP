<%@ page import="mysql.ReservationDao" %>
<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-29
  Time: 오후 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ReservationDao dao = ReservationDao.getInstance();
  String id = request.getParameter("id");
  String room = request.getParameter("room");
  String seat = request.getParameter("seat");
  String sTime = request.getParameter("sTime");
  String eTime = request.getParameter("eTime");
  String date = request.getParameter("date");

  if( dao.deleteReservation(id,date,room,seat,sTime,eTime) == ReservationDao.DELETE_SUCCESS){
%>
<script>
  alert("삭제 완료");
  location.href="../mainForm.jsp"
</script>
<%
}
else{
%>
<script>
  alert("삭제 중 오류가 발생했습니다.");
  location.href="../mainForm.jsp"
</script>
<%
  }
%>