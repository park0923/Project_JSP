<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="mysql.ScheduleDao" %>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="beans.ReservationDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-30
  Time: 오후 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
    calendar.setTime(sDate.parse(request.getParameter("date")));
    int week = calendar.get(Calendar.DAY_OF_WEEK);
    String[] startArr = request.getParameter("startTime").split(":");
    String[] endArr = request.getParameter("endTime").split(":");
    int person = Integer.parseInt(request.getParameter("person"));

    ScheduleDao scheduleDao = ScheduleDao.getInstance();
    int cnt = scheduleDao.scheduleCheck(request.getParameter("lectureRoom"), week, Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]), request.getParameter("date"));

    if(cnt != 0){
%>
<script>
    alert("이 시간은 수업중입니다.");
    location.href = "../reservation.jsp";
</script>
<%
    }

    ReservationDao dao = ReservationDao.getInstance();
    String seatArr = "";
    String roomNum = "자동 배정";
    String teamCheck = request.getParameter("team");
    boolean tf;
    if(teamCheck == null){
        tf = false;
    }else {
        tf = true;
    }
    List<ReservationDto> selectedSeat;
    if(request.getParameter("lectureRoom") != null){
        dao = ReservationDao.getInstance();
        selectedSeat = dao.selectTime(request.getParameter("lectureRoom"),request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
    %>
        <script>
            location.href='/member/reservation/seatSelection.jsp?roomNum=<%=request.getParameter("lectureRoom")%>&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
        </script>
    <%
    }else{
        selectedSeat = dao.selectTime("915",request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
        if(selectedSeat.size() >= 25 || selectedSeat.size()+person > 25){
            selectedSeat = dao.selectTime("916",request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
            if(selectedSeat.size() >= 25 || selectedSeat.size()+person > 25){
                selectedSeat = dao.selectTime("918",request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
                if(selectedSeat.size() >= 25 || selectedSeat.size()+person > 25){
                    selectedSeat = dao.selectTime("911",request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
    %>
<script>
    location.href='/member/reservation/seatSelection.jsp?roomNum=911&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
</script>
<%
                }else if(selectedSeat.size() >= 20 && tf && selectedSeat.size()+person <= 25){
%>
                <script>
                    var con = confirm("다음 강의실 쓰겠습니까?");
                    if(con){
                        location.href='/member/reservation/seatSelection.jsp?roomNum=911date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
                    }else {
                        location.href='/member/reservation/seatSelection.jsp?roomNum=918&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
                    }
                </script>
<%
                }
%>
<script>
    location.href='/member/reservation/seatSelection.jsp?roomNum=918&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
</script>
<%
            }else if(selectedSeat.size() >= 20 && tf && selectedSeat.size()+person <= 25){
            %>
            <script>
                var con = confirm("다음 강의실 쓰겠습니까?");
                if(con){
                    location.href='/member/reservation/seatSelection.jsp?roomNum=918&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
                }else {
                    location.href='/member/reservation/seatSelection.jsp?roomNum=916&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
                }
            </script>
            <%
            }
            %>
<script>
    location.href='/member/reservation/seatSelection.jsp?roomNum=916&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
</script>
<%
        }else if(selectedSeat.size() >= 20 && tf && selectedSeat.size()+person <= 25){
        %>
        <script>
            var con = confirm("다음 강의실 쓰겠습니까?");
            if(con){
                location.href='/member/reservation/seatSelection.jsp?roomNum=916&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
            }else {
                location.href='/member/reservation/seatSelection.jsp?roomNum=915&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
            }
        </script>
        <%
        }
        %>
<script>
    location.href='/member/reservation/seatSelection.jsp?roomNum=915&date=<%=request.getParameter("date")%>&sTime=<%=request.getParameter("startTime")%>&eTime=<%=request.getParameter("endTime")%>&person=<%=request.getParameter("person")%>';
</script>
        <%
    }
%>