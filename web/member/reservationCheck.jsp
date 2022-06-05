<%@ page import="mysql.ReservationDao" %>
<%@ page import="beans.ReservationDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>예약 조회</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <style>
        .details .reservationCheck{
            position: relative;
            width: 100%;
            height: 100%;
            padding: 30px;
            margin-top: -30px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.8em;
            text-align: center;
            width: 100%;

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
        .checkBtn{
            padding: 5px 10px;
            background: var(--blue);
            color: var(--white);
            border-radius: 6px;
            border: solid 0px;
        }
        .reservationCancel{
            padding: 5px 10px;
            background: var(--blue);
            color: var(--white);
            border-radius: 6px;
            border: solid 0px;
        }
        .recognizeBtn{
            padding: 5px 10px;
            background: var(--blue);
            color: var(--white);
            border-radius: 6px;
            border: solid 0px;
        }
        .recognize{
            padding: 5px 10px;
            background: gray;
            color: var(--white);
            border-radius: 6px;
            border: solid 0px;
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
    ReservationDao dao = ReservationDao.getInstance();
    List<ReservationDto> reservationDtoList = null;
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int Row = (currentPage - 1) * pageSize;
    int count;

    if(session.getAttribute("position").equals("admin")){
         count = dao.getCount();
        if(count > 0){
            reservationDtoList = dao.getReservation(Row, pageSize, "");
        }else {
        %>
            <script>
                alert("예약이 없습니다.")
                history.back();
            </script>
        <%
        }
    }else{
        count = dao.getIdCount((String) session.getAttribute("id"));
        if(count > 0){
            reservationDtoList = dao.getReservation(Row, pageSize, (String) session.getAttribute("id"));
        }else{
        %>
            <script>
                alert("예약이 없습니다.")
                history.back();
            </script>
        <%
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
                <div class="reservationCheck">
                <section>
                    <table style="border-spacing: 30px">
                        <caption>예약 정보</caption>
                        <tr>
                            <th>순서</th>
                            <th>아이디</th>
                            <th>사용 날짜</th>
                            <th>사용 강의실</th>
                            <th>사용 좌석</th>
                            <th>예약 시작 시간</th>
                            <th>예약 종료 시간</th>
                            <th>예약 승인 여부</th>
                            <th>연장</th>
                            <th>취소</th>
                            <%
                                if(session.getAttribute("position").equals("admin")){
                            %>
                                <th>승인</th>
                            <%
                                }
                            %>
                        </tr>
                        <%
                            if(count > 0){
                                int number = count - (currentPage - 1) * pageSize;
                                for(int i=0; i<reservationDtoList.size(); i++){
                        %>
                        <tr class="reservation">
                            <td><%=number--%></td>
                            <td><%=reservationDtoList.get(i).getId()%></td>
                            <td><%=reservationDtoList.get(i).getDate()%></td>
                            <td><%=reservationDtoList.get(i).getLectureroomNum()%></td>
                            <td><%=reservationDtoList.get(i).getSeat()%></td>
                            <td><%=reservationDtoList.get(i).getStartTime()%></td>
                            <td><%=reservationDtoList.get(i).getEndTime()%></td>
                            <td><%=reservationDtoList.get(i).getState()%></td>
<%--                            <td><input type="button" value="연장" class="checkBtn"> </td>--%>
                            <td><input type="button" value="연장" class="checkBtn" onclick="extendTimePopUp('reservationExtend.jsp?date=<%=reservationDtoList.get(i).getDate()%>&room=<%=reservationDtoList.get(i).getLectureroomNum()%>&seat=<%=reservationDtoList.get(i).getSeat()%>&sTime=<%=reservationDtoList.get(i).getStartTime()%>&eTime=<%=reservationDtoList.get(i).getEndTime()%>')"> </td>
                            <td><input type="button" value="취소" class="reservationCancel" onclick="location.href='/member/reservation/deleteReservation.jsp?id=<%=reservationDtoList.get(i).getId()%>&date=<%=reservationDtoList.get(i).getDate()%>&room=<%=reservationDtoList.get(i).getLectureroomNum()%>&seat=<%=reservationDtoList.get(i).getSeat()%>&sTime=<%=reservationDtoList.get(i).getStartTime()%>&eTime=<%=reservationDtoList.get(i).getEndTime()%>'"> </td>
                            <%
                                if(session.getAttribute("position").equals("admin")){
                                    if(reservationDtoList.get(i).getState().equals("대기중")){
                            %>
                                        <td><input type="button" value="승인" class="recognizeBtn"> </td>
                            <%
                                    }else{
                            %>
                                        <td><input type="button" class="recognize" value="승인" disabled="true"> </td>
                            <%
                                    }
                                }
                            %>
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
                                <a href="reservationCheck.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                                <%
                                    }

                                    for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                                %>
                                <%=i %>
                                <%
                                }else{ // 현재 페이지가 아닌 경우 링크 설정
                                %>
                                <a href="reservationCheck.jsp?pageNum=<%=i%>" style="color: black; text-decoration: none">[<%=i %>]</a>
                                <%
                                        }
                                    } // for end
                                    if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                                %>
                                <a href="reservationCheck.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
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

    function extendTimePopUp(url){
        var str = ""
        var tdArr = new Array();	// 배열 선언
        var checkBtn = $(".checkBtn");

        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();


        var date = td.eq(2).text();
        date = date.split("-");
        var sTime =td.eq(5).text();
        sTime = sTime.split(":");
        var eTime =td.eq(6).text();
        eTime = eTime.split(":");

        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth()+1;
        var day = now.getDate();
        var hour = now.getHours();
        var minutes = now.getMinutes();

        var date1 = new Date(year, month, day, hour, minutes);
        var date2 = new Date(date[0], date[1], date[2], eTime[0], eTime[1]);

        var date3 = new Date(date[0], date[1], date[2], sTime[0], sTime[1]);
        var chMin = (date1.getTime() - date3.getTime())
        var elMin = (date2.getTime() - date1.getTime())/1000/60;
        if(elMin>0 && chMin>0){
            alert(elMin+"분 남았습니다.");
            open(url,'pop01' ,'top=10, left=10, width=800, height=800, status=no, menubar=no, toolbar=no, resizable=no');
        }else if(chMin<0){
            alert("아직 예약이 시작되지않았습니다.");
        }else{
            alert("확인 못함");
        }
    }

</script>
</html>
