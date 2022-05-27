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
</head>
<body>
<%
    List<ScheduleDto> scheduleDto;
    String[][] scheduleName = new String[9][5];
    ScheduleDao dao = ScheduleDao.getInstance();
    String[] scheduleTime = {"9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"};
    scheduleDto = dao.selectSchedule("915");

//    for(int i=0; i<scheduleDto.size(); i++){
//        System.out.println(scheduleDto);
//        System.out.println(scheduleDto.get(i).getSchedule_name());
//        System.out.println(scheduleDto.get(i).getSchedule_class_Stime());
//        System.out.println(scheduleDto.get(i).getSchedule_class_Etime());
//        System.out.println(scheduleDto.get(i).getSchedule_week());
//    }

    for(int j=0; j<8;j++){
        for(int i=0; i<5; i++){
            scheduleName[j][i]="";
        }
    }

    for(int i=0; i<5; i++){
        for(int j=0; j<9; j++){
            for(int k=0; k<scheduleDto.size(); k++){
                if(scheduleTime[j].equals(scheduleDto.get(k).getSchedule_class_Stime()) && i==scheduleDto.get(k).getSchedule_week()){
                    scheduleName[j][i]=scheduleDto.get(k).getSchedule_name();
                }
            }
        }
    }
    for(int j=0; j<8;j++){
        for(int i=0; i<5; i++){
            System.out.print(scheduleName[j][i]);
        }
        System.out.println();
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
                <select  name="lectureRoom">
                    <option value="0">강의실 선택</option>
                    <option value="915">915</option>
                    <option value="916">916</option>
                    <option value="918">918</option>
                    <option value="911">911</option>
                </select>
                <table>
                    <tr>
                        <td></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>
                    </tr>
                        <%
                            for(int i=0; i<8; i++){
                        %>
                    <tr>
                        <td><%= scheduleTime[i]%> ~ <%= scheduleTime[i+1]%></td>
                        <td><%=scheduleName[i][0]%></td>
                        <td><%=scheduleName[i][1]%></td>
                        <td><%=scheduleName[i][2]%></td>
                        <td><%=scheduleName[i][3]%></td>
                        <td><%=scheduleName[i][4]%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
