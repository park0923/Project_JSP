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
    <style>

        .details .inquiryBox
        {
            position: relative;
            width: 100%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            border-radius: 20px;
            margin-top: 15px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }

        .cardHeader h2
        {
            font-weight: 600;
            color: var(--blue);
        }

        .details .inquiryBox table
        {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .details .inquiryBox table thead td
        {
            font-weight: 600;
            text-align: center;
        }
        .details .inquiryBox table tr
        {
            color: var(--black1);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }
        .details .inquiryBox table tr:last-child
        {
            border-bottom: none;
        }

        .details .inquiryBox table tr td .view
        {
            text-decoration: none;
            color:  var(--black1);
        }
        .details .inquiryBox table tr td .view:hover
        {
            text-decoration: none;
            color:  var(--white);
        }
        .details .inquiryBox table tr td
        {
            padding: 10px;
            text-align: center;
        }
        .details .inquiryBox table tbody tr td:nth-child(6)
        {
            text-align: end;
        }

        input[type=text]{
            size: 50px;
            width: 100%;
            border: 0;
            text-align: center;
        }

        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        ul,
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
            color: inherit;
        }

        .register h3{
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .register input{
            width: 100%;
            height: 40px;
            outline: none;
            padding: 10px;
            border: 1px solid #707070;
            transition: 0.3s;
        }
        .register input:valid, .register input:focus{
            border: 1px solid #2b2e4a;
        }

        .register .flex .container .item select{
            height: 40px;
            padding: 10px;
            border: 1px solid #2b2e4a;

        }

        table {
            /*width: 100%;*/
            border: 1px solid #444444;
            padding: 5px;
            margin-left: auto;
            margin-right: auto;
        }

        .custom-btn2 {
            width: 160px;
            height: 50px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 5px;
            font-family: 'Lato', sans-serif;
            font-weight: bold;
            font-size: large;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: center;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            margin-left: 10px;
        }
        .btn-2 {
            background: rgb(19, 109, 252);
            background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
            border: none;
        }
        .btn-2:hover {
            background: rgb(0,3,255);
            background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
        }
    </style>
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

    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
    calendar.setTime(sDate.parse(request.getParameter("date")));
    int week = calendar.get(Calendar.DAY_OF_WEEK);

    ReservationDao dao = ReservationDao.getInstance();
    int Rtime = dao.getRTime(seat, Integer.parseInt(ssTime[0]), room, date);
    int Sctime = dao.getScTime(seat, Integer.parseInt(ssTime[0]), room, week);
    int timeC=0;
    if(Rtime==0){
        timeC = Sctime;
    }else if(Sctime==0){
        timeC = Rtime;
    }else if(Rtime==0 && Sctime==0){
        timeC = 0;
    } else {
        if(Rtime<Sctime)
            timeC = Rtime;
        else {
            timeC = Sctime;
        }
    }

    if(timeC==0 || (timeC-Integer.parseInt(eeTime[0]))<0) {
        timeC=24;
    }
    int timeExtend = timeC-Integer.parseInt(eeTime[0]);

    if(timeExtend<=0){
%>
<script>
    alert("연장할 수 있는 시간이 없습니다.");
    close();
</script>
<%
}else{
%>
<div class="contents">
    <div class="details">
        <h1 style="text-align: center">예약 연장</h1>
        <hr/>

        <div class="inquiryBox">
            <form action="reservationExtendProcess.jsp?seat=<%=seat%>&date=<%=date%>&room=<%=room%>&sTime=<%=sTime%>&eTime=<%=eTime%>" method="post">
                <table>
                    <tr>
                        <td>연장 가능 시간</td>
                        <td><input type="text" value="<%=timeExtend%>"></td>
                    </tr>
                    <tr>
                        <td>연장 희망 시간</td>
                        <td><input type="number" name="time" min="1" max="<%=timeExtend%>" value="1"></td>
                    </tr>

                </table>
                <input class="custom-btn2 btn-2" style="margin-top: 25px; width: 110px; height: 40px; margin-left: 370px;" type="submit" value="연장하기">
            </form>
        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>