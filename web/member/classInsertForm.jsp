<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-27
  Time: 오후 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <script type="text/javascript" src="reservation/selectTime.js"></script>
</head>
<body>
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
                <form action="classInsertProcess.jsp" method="post">
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
                    강의 이름
                    <input type="text" name="className">
                    요일 선택
                    <select name="week">
                        <option >요일 선택</option>
                        <option value="2">월</option>
                        <option value="3">화</option>
                        <option value="4">수</option>
                        <option value="5">목</option>
                        <option value="6">금</option>
                    </select>

                    <input type="submit" value="예약">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
