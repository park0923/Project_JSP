<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>강의실 예약</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <link rel="stylesheet" type="text/css" href="/member/reservation/reservation.css">
  <style>
    .details{
      left: 350px;
      top: 40px;
    }
    .details .reservationDate{
      position: relative;
      width: 700px;
      height: 650px;
      padding: 30px;
      top: -40px;
      border-radius: 20px;
      box-shadow: 0 7px 25px rgba(0,0,0,0.5);
      text-align: left;
      margin-left: 150px;
    }
    .reservationHeader h1{
      font-weight: 600;
      color: black;
      text-align: center;
      height: 70px;
      padding-top: 10px;
    }
    .reservationHeader{
      justify-content: space-between;
      align-items: flex-start;
    }
    .selectDate{
      padding: 10px;
      display: flex;
      font-size: initial;
      font-weight: bold;
    }
    .rs{
      display: inline-block;
      padding: 5px;
    }
    .selectStartTime h3{
      font-size: initial;
      margin-bottom: 10px;
      margin-left: 6px;
      margin-top: 20px;
    }
    .selectStartTime{
      padding: 5px;
      display: inline-block;
    }
    .selectEndTime{
      padding: 5px;
      display: inline-block;
    }
    .selectLectureRoom{
      padding: 5px;

    }
    .selectLectureRoom h3{
      margin-bottom: 10px;
      font-size: initial;
      margin-left: 6px;
      margin-top: 25px;
    }
    .selectPerson{
      padding: 5px;
    }
    .selectPerson h3{
      margin-bottom: 10px;
      font-size: initial;
      margin-left: 6px;
      margin-top: -5px;
    }
    .selectbtn{
      margin-left: 280px;
      padding: 10px 20px;
      background: darkblue;
      text-decoration: none;
      color: var(--white);
      border-radius: 6px;
      border: solid 0px;
      font-size: initial;
      font-weight: bold;
    }
    .team{
      padding: 5px;
    }
    .team h3{
      margin-bottom: 10px;
      font-size: initial;
      margin-left: 6px;
      margin-top: 15px;
    }

  </style>
</head>
<script type="text/javascript" src="reservation/selectTime.js"></script>
<body>
<%
  Date date = new Date();
  SimpleDateFormat simpleDate = new SimpleDateFormat("HHmm");
  String strTime = simpleDate.format(date);
  if (session.getAttribute("isLogin") == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  location.href = "loginForm.jsp";
</script>
<%
}else if(Integer.parseInt(strTime)>24430){
%>
<script>
  alert("예약 가능시간이 끝났습니다.");
  location.href = "mainForm.jsp";
</script>
<%
  }
%>
<div class="container">
  <div class="nav">
    <%@ include file="../navigation.jsp" %>
  </div>

  <div class="main">
    <div class="header">
      <%@ include file="../header.jsp" %>
    </div>
    <div class="details">
      <div class="reservationDate">
        <div class="reservationHeader">
          <h1>강의실 예약</h1>
          <hr style="border: solid 2px darkblue; margin-bottom: 3px">
          <hr style="border: solid 0.5px black">
          <Br>
        </div>

        <div class="selectDate">
          <label for="start" style="margin-left: 6px">예약 날짜:</label>
        </div>
        <%
          SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
          String strDate = sDate.format(date);
        %>

        <form name="reservation_form" method="post" action="reservation/reservationAfter.jsp">
          <input type="date" id="start" name="date"
                 value=<%= strDate%> max="2030-12-31" style="margin-left: 10px">
          <Br>

          <span class="rs">
        <div class="selectStartTime">
          <h3>시간 선택 : </h3>
          <select name="startTime" onchange="categoryChange(this)">
            <option value="0">시작 시간 선택</option>
            <option value="9:00">9:00</option>
            <option value="10:00">10:00</option>
            <option value="11:00">11:00</option>
            <option value="12:00">12:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>
            <option value="18:00">18:00</option>
            <option value="19:00">19:00</option>
          </select>
        </div>
          <div class="selectEndTime">
          <select name="endTime" id="changeTime" onchange="disabledRoom(this)">
            <option value="">종료 시간 선택</option>
            <option>시작 시간을 선택하세요</option>
          </select>
          </div>
          <div class="selectLectureRoom">
            <h3>강의실 선택 : </h3>
          <select id="Room" name="lectureRoom">
            <option value="0">강의실 선택</option>
            <option value="915">915</option>
            <option value="916">916</option>
            <option value="918">918</option>
            <option value="911">911</option>
          </select>
          </div>
          <div class="selectPerson">
          <br>
          <h3>인원:</h3>
          <input type="number" id="person" name="person" min="1" max="1" step="1" value="1">
          <br>
          </div>
            <div class="team">
            <h3>조별학습</h3>
              <input type="checkbox" name="team">
            </div>
          <input type="button" value="다음" onclick="confirmTime()" class="selectbtn" style="margin-top: 30px;">

          </span>
        </form>
      </div>
    </div>
  </div>

</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
  function confirmTime(){
    var room = document.getElementById("Room");
    if(document.reservation_form.startTime.value === "0"){
      alert("시작 시간을 선택하세요");
      return;
    }
    if(document.reservation_form.lectureRoom.value === "0" && room.disabled == false){
      alert("강의실을 선택하세요");
      return;
    }
    document.reservation_form.submit();
  }

  $("input:checkbox").on('click', function (){
    if($(this).prop('checked')){
      $('#person').prop('max',10);
    }else {
      $('#person').prop('max',1);
    }
  });
</script>
</body>
</html>
