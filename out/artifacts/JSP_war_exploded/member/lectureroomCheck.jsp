<%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 2022-05-18
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
            text-align: center;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
    </style>

    <script type="text/javascript">
        function showClock(){
            var currentDate = new Date();
            var divClock = document.getElementById('divClock');
            var msg = "현재 시간 : ";
            if(currentDate.getHours()>12){      //시간이 12보다 크다면 오후 아니면 오전
                msg += "오후 ";
                msg += currentDate.getHours()-12+"시 ";
            }
            else {
                msg += "오전 ";
                msg += currentDate.getHours()+"시 ";
            }

            msg += currentDate.getMinutes()+"분 ";
            msg += currentDate.getSeconds()+"초";

            divClock.innerText = msg;

            if (currentDate.getMinutes()>58) {    //정각 1분전부터 빨강색으로 출력
                divClock.style.color="red";
            }
            setTimeout(showClock,1000);  //1초마다 갱신
        }
    </script>
</head>
<body onload="showClock()">
<div id="divClock" class="clock">
</div>

<table width=480 height="600" style="color: #121212">
    <caption>사용 가능 강의실</caption>
    <tr width=19%>
        <th></th>
        <th>915</th>
        <th>916</th>
        <th>918</th>
        <th>911</th>
    </tr>

    <tr>
        <th>사용가능 여부</th>
        <td>X</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>

    <tr>
        <th>남은 좌석</th>
        <td>0</td>
        <td>10</td>
        <td>20</td>
        <td>20</td>
    </tr>
</table>
</body>
</html>
