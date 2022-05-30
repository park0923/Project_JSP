<%@ page import="mysql.ScheduleDao" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.ScheduleDto" %><%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-27
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <style>
        .details .classroomLookUp{
            position: relative;
            width: 900px;
            height: 750px;
            padding: 30px;
            margin-top: -30px;
            margin-left: 200px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
            text-align: center;

        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
            padding: 10px;
            table-layout: fixed;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
    </style>
</head>
<body>
<%
    List<ScheduleDto> scheduleDto1;
    List<ScheduleDto> scheduleDto2;
    List<ScheduleDto> scheduleDto3;
    List<ScheduleDto> scheduleDto4;
    String[][] scheduleName1 = new String[9][5];
    String[][] scheduleName2 = new String[9][5];
    String[][] scheduleName3 = new String[9][5];
    String[][] scheduleName4 = new String[9][5];

    ScheduleDao dao = ScheduleDao.getInstance();
    String[] scheduleTime = {"9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"};

    scheduleDto1 = dao.selectSchedule("915");
    scheduleDto2 = dao.selectSchedule("916");
    scheduleDto3 = dao.selectSchedule("918");
    scheduleDto4 = dao.selectSchedule("911");

    for(int j=0; j<8;j++){
        for(int i=0; i<5; i++){
            scheduleName1[j][i]="";
            scheduleName2[j][i]="";
            scheduleName3[j][i]="";
            scheduleName4[j][i]="";

        }
    }

    for(int i=0; i<5; i++){
        for(int j=0; j<9; j++){
            for(int k=0; k<scheduleDto1.size(); k++){
                if(scheduleTime[j].equals(scheduleDto1.get(k).getSchedule_class_Stime()) && (i+2)==scheduleDto1.get(k).getSchedule_week()){
                    scheduleName1[j][i]=scheduleDto1.get(k).getSchedule_name();
                }
            }
        }
    }

    for(int i=0; i<5; i++){
        for(int j=0; j<9; j++){
            for(int k=0; k<scheduleDto2.size(); k++){
                if(scheduleTime[j].equals(scheduleDto2.get(k).getSchedule_class_Stime()) && (i+2)==scheduleDto2.get(k).getSchedule_week()){
                    scheduleName2[j][i]=scheduleDto2.get(k).getSchedule_name();
                }
            }
        }
    }

    for(int i=0; i<5; i++){
        for(int j=0; j<9; j++){
            for(int k=0; k<scheduleDto3.size(); k++){
                if(scheduleTime[j].equals(scheduleDto3.get(k).getSchedule_class_Stime()) && (i+2)==scheduleDto3.get(k).getSchedule_week()){
                    scheduleName3[j][i]=scheduleDto3.get(k).getSchedule_name();
                }
            }
        }
    }

    for(int i=0; i<5; i++){
        for(int j=0; j<9; j++){
            for(int k=0; k<scheduleDto4.size(); k++){
                if(scheduleTime[j].equals(scheduleDto4.get(k).getSchedule_class_Stime()) && (i+2)==scheduleDto4.get(k).getSchedule_week()){
                    scheduleName4[j][i]=scheduleDto4.get(k).getSchedule_name();
                }
            }
        }
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
        <div class="contents">
            <div class="details">
                <div class="classroomLookUp">
                <select onChange="change(this.options[this.selectedIndex].value)" style="margin-right: 20px" >
                    <option selected>강의실 선택</option>
                    <option value="selectBox01">915</option>
                    <option value="selectBox02">916</option>
                    <option value="selectBox03">918</option>
                    <option value="selectBox04">911</option>
                </select>
                <table id="view1" style="display: none; border: solid 0px" >
                    <tr>
                        <td></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>
                    </tr>
                        <%
                            for(int i=0; i<8; i++){
                        %>
                    <tr>
                        <td><%= scheduleTime[i]%> ~ <%= scheduleTime[i+1]%></td>
                        <td><%=scheduleName1[i][0]%></td>
                        <td><%=scheduleName1[i][1]%></td>
                        <td><%=scheduleName1[i][2]%></td>
                        <td><%=scheduleName1[i][3]%></td>
                        <td><%=scheduleName1[i][4]%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <table id="view2" style="display: none; border: solid 0px" >
                    <tr>
                        <td></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>
                    </tr>
                    <%
                        for(int i=0; i<8; i++){
                    %>
                    <tr>
                        <td><%= scheduleTime[i]%> ~ <%= scheduleTime[i+1]%></td>
                        <td><%=scheduleName2[i][0]%></td>
                        <td><%=scheduleName2[i][1]%></td>
                        <td><%=scheduleName2[i][2]%></td>
                        <td><%=scheduleName2[i][3]%></td>
                        <td><%=scheduleName2[i][4]%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <table id="view3" style="display: none; border: solid 0px" >
                    <tr>
                        <td></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>
                    </tr>
                    <%
                        for(int i=0; i<8; i++){
                    %>
                    <tr>
                        <td><%= scheduleTime[i]%> ~ <%= scheduleTime[i+1]%></td>
                        <td><%=scheduleName3[i][0]%></td>
                        <td><%=scheduleName3[i][1]%></td>
                        <td><%=scheduleName3[i][2]%></td>
                        <td><%=scheduleName3[i][3]%></td>
                        <td><%=scheduleName3[i][4]%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <table id="view4" style="display: none; border: solid 0px" >
                    <tr>
                        <td></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>
                    </tr>
                    <%
                        for(int i=0; i<8; i++){
                    %>
                    <tr>
                        <td><%= scheduleTime[i]%> ~ <%= scheduleTime[i+1]%></td>
                        <td><%=scheduleName4[i][0]%></td>
                        <td><%=scheduleName4[i][1]%></td>
                        <td><%=scheduleName4[i][2]%></td>
                        <td><%=scheduleName4[i][3]%></td>
                        <td><%=scheduleName4[i][4]%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    function change(style) {

        if( style == "selectBox01" )
        {
            view1.style.display = "inline"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox02" )
        {
            view1.style.display = "none"
            view2.style.display = "inline"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox03" )
        {
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "inline"
            view4.style.display = "none"
        }
        if( style == "selectBox04")
        {
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "inline"
        }

    }
</script>
</body>
</html>
