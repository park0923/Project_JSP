<%@ page import="mysql.ReservationDao" %>
<%@ page import="beans.ReservationDto" %>
<%@ page import="java.util.List" %>
<%@ page import="mysql.ScheduleDao" %>
<%@ page import="beans.ScheduleDto" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 정보</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <style>
        .details .reservationCheck{
            position: relative;
            width: 1300px;
            height: 700px;
            padding: 30px;
            margin-top: -30px;
            margin-left: 50px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
            text-align: center;
            width: 1200px;
            margin-left: 20px;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
            padding: 10px;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 10px;
        }
        caption{
            margin-bottom: 30px;
            font-size: xx-large;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "../home/loginForm.jsp";
</script>
<%
    }
%>
<%
    ScheduleDao dao = ScheduleDao.getInstance();
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int Row = (currentPage - 1) * pageSize;
    int count = dao.getCount();
    List<ScheduleDto> scheduleDtoList = null;

    if(count > 0){
        scheduleDtoList = dao.getSchedulePaging(Row, pageSize);
    }else {
        %>
        <script>
            alert("강의가 없습니다.")
            history.back();
        </script>
        <%
    }
    String[] weeks = {"0","일","월","화","수","목","금","토"};
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
                <div class="reservationCheck">
                <section>
                    <table style="border-spacing: 30px">
                        <caption>예약 정보</caption>
                        <tr>
                            <th>순서</th>
                            <th>강의 이름</th>
                            <th>강의실</th>
                            <th>강의 시작 시간</th>
                            <th>강의 종료 시간</th>
                            <th>요일</th>
                            <th>강의 시작 날짜</th>
                            <th>예약 종료 날짜</th>
                            <th>수정</th>
                        </tr>
                        <%
                            if(count > 0){
                                int number = count - (currentPage - 1) * pageSize;
                                for(int i=0; i<scheduleDtoList.size(); i++){
                        %>
                        <tr class="reservation">
                            <td><%=number--%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_name()%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_lectureroom_num()%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_class_Stime()%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_class_Etime()%></td>
                            <td><%=weeks[scheduleDtoList.get(i).getSchedule_week()]%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_Sdate()%></td>
                            <td><%=scheduleDtoList.get(i).getSchedule_Edate()%></td>
                            <td><input type="button" value="수정" onclick="PopUp('/member/scheduleUpdateForm.jsp?name=<%=scheduleDtoList.get(i).getSchedule_name()%>&room=<%=scheduleDtoList.get(i).getSchedule_lectureroom_num()%>&sTime=<%=scheduleDtoList.get(i).getSchedule_class_Stime()%>&eTime=<%=scheduleDtoList.get(i).getSchedule_class_Etime()%>&week=<%=scheduleDtoList.get(i).getSchedule_week()%>&sDate=<%=scheduleDtoList.get(i).getSchedule_Sdate()%>&eDate=<%=scheduleDtoList.get(i).getSchedule_Edate()%>')"></td>
                            <td><input type="button" value="삭제" onclick="location.href='/member/scheduleDeleteProcess.jsp?name=<%=scheduleDtoList.get(i).getSchedule_name()%>&room=<%=scheduleDtoList.get(i).getSchedule_lectureroom_num()%>&sTime=<%=scheduleDtoList.get(i).getSchedule_class_Stime()%>&eTime=<%=scheduleDtoList.get(i).getSchedule_class_Etime()%>&week=<%=scheduleDtoList.get(i).getSchedule_week()%>&sDate=<%=scheduleDtoList.get(i).getSchedule_Sdate()%>&eDate=<%=scheduleDtoList.get(i).getSchedule_Edate()%>'"></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr>
                            <td colspan="11" align="center">
                                <%
                                    if(count > 0){
                                        // 총 페이지의 수
                                        int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                                        // 한 페이지에 보여줄 페이지 블럭(링크) 수
                                        int pageBlock = 10;
                                        // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                                        int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                                        int endPage = startPage + pageBlock - 1;

                                        // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                                        if(endPage > pageCount){
                                            endPage = pageCount;
                                        }

                                        if(startPage > pageBlock){
                                %>
                                <a href="classModifyForm.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                                <%
                                    }
                                    for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                                %>
                                <%=i %>
                                <%
                                }else{ // 현재 페이지가 아닌 경우 링크 설정
                                %>
                                <a href="classModifyForm.jsp?pageNum=<%=i%>">[<%=i %>]</a>
                                <%
                                        }
                                    } // for end
                                    if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                                %>
                                <a href="classModifyForm.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
                                <%
                                        }
                                    }
                                %>
                            </td>
                        </tr>
                    </table>
                </section>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
<script>
    function sendPost(url, params) {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = url;
        document.charset = "UTF-8";
        document.body.appendChild(form);

        for (var key in params) {
            var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden');
            hiddenField.setAttribute('name', key);
            hiddenField.setAttribute('value',params[key]);
            console.log(params[key]);
            form.appendChild(hiddenField);
        }
        console.log(hiddenField.value);
        form.submit();
    }

    $(".recognizeBtn").click(function (){
        var checkBtn = $(this);
        var tdArr = new Array();

        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();

        var id = td.eq(1).text();
        var date = td.eq(2).text();
        var room = td.eq(3).text();
        var seat = td.eq(4).text();
        var sTime = td.eq(5).text();
        var eTime = td.eq(6).text();

        console.log(id, date, room, seat, sTime, eTime);
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
        console.log(tdArr);
        sendPost('reservationRecognize.jsp', tdArr)
    });

    function PopUp(url){
        open(url,'pop01' ,'top=10, left=10, width=800, height=800, status=no, menubar=no, toolbar=no, resizable=no');
    }
</script>
</html>
