<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-27
  Time: 오후 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    .cardHeader
    {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }
    .cardHeader h2
    {
        font-weight: 600;
        color: var(--blue);
    }
    .btn
    {
        position: relative;
        padding: 5px 10px;
        background: var(--blue);
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn:hover
    {
        background: var(--blue2);
        color: var(--blue);
    }
    .btn_up
    {
        position: relative;
        padding: 5px 10px;
        background: blue;
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn_up:hover
    {
        background: var(--blue2);
        color: var(--white);
    }
    .btn_del
    {
        position: relative;
        padding: 5px 10px;
        background: #FE2E2E;
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn_del:hover
    {
        background: #F78181;
        color: var(--white);
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
    .register{
        width: 550px;
        height: 500px;
        margin-left: 400px;
        margin-top: 100px;
        margin-bottom: 100px;
        padding: 15px 15px;
        background: white;
        color: #2b2e4a;
        font-size: 14px;
        text-align: left;
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
    .register .center{
        display: flex;
        align-items: center;
    }
    .register .flex{
        display: flex;
        flex-direction: column;
    }
    .register .flex .container{
        display: grid;
        grid-template-columns: 1fr 3fr 1fr;
        margin-bottom: 10px;
    }
    .register .flex .container .item:first-child{
        margin-right: 10px;
    }
    .register .flex .container .item .idcheck{
        height: 100%;
        margin-left: 10px;
        padding: 5px 15px;
        background: #2b2e4a;
        border: 1px solid #2b2e4a;
        color: white;
        font-size: 12px;
        transition: 0.3s;
    }
    .register .flex .container .item .idcheck:hover{
        background: white;
        color: #2b2e4a;
    }
    .register .flex .container .item select{
        height: 40px;
        padding: 10px;
        border: 1px solid #2b2e4a;

    }
    .register .submit{
        width: 100%;
        height: 40px;
        color: white;
        border: none;
        border: 1px solid #2b2e4a;
        background: #2b2e4a;
        transition: 0.3s;
    }
    .register .flex .container:last-child{
        margin: 0;
    }
    .register .submit:hover{
        width: 100%;
        height: 40px;
        border: none;
        border: 1px solid #2b2e4a;
        color: #2b2e4a;
        background: white;
    }
    table {
        /*width: 100%;*/
        border: 1px solid #444444;
        padding: 5px;
        margin-left: auto;
        margin-right: auto;
    }

    td {
        /*width: 100%;*/
        /*border: 1px solid #444444;*/
    }

    .c {
        text-align: center;
    }
    .custom-btn2 {
        width: 200px;
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
        margin-left: 100px;
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

    .left {
        width: 50%;
        float: left;
        margin-top: 200px;

    }
    .right {
        width: 50%;
        float: right;
        display: inline-block;
    }

</style>
<head>
    <title>강의등록</title>
    <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header" style="padding-bottom: 0px">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <h1>강의 정보 입력</h1>
                <hr/>
                <div class="inquiryBox">
                <form action="classInsertProcess.jsp" method="post" name="classInsertForm">
                    <div class="register">
                        <div class="flex">
                            <div class="selectStartTime">
                                <div class="selectStartTime">
                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">수업 시작 날짜</h3>
                                        </li>
                                        <li class="item">
                                            <input type="date" name="sDate" style="padding-right: 26px; width:290px">
                                        </li>
                                    </ul>
                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">수업 종료 날짜</h3>
                                        </li>
                                        <li>
                                            <input type="date" name="eDate" style="padding-right: 26px; width:290px">
                                        </li>
                                    </ul>

                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">수업 시작</h3>
                                        </li>
                                        <li class="item">
                                            <select  name="startTime" onchange="categoryChange(this)"style="padding-right: 26px; width:290px;" >
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
                                        </li>
                                    </ul>

                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">수업 종료</h3>
                                        </li>
                                        <li class="item">
                                            <div class="selectEndTime">
                                                <select name="endTime" id="changeTime" onchange="disabledRoom(this)"style="padding-right: 26px; width:290px;">
                                                    <option value="">종료 시간 선택</option>
                                                    <option>시작 시간을 선택하세요</option>
                                                </select>
                                            </div>
                                        </li>
                                    </ul>

                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">강의실</h3>
                                        </li>
                                        <li class="item">
                                            <div class="selectLectureRoom">

                                                <select id="Room" name="lectureRoom"style="padding-right: 26px; width:290px;">
                                                    <option value="0">강의실 선택</option>
                                                    <option value="915">915</option>
                                                    <option value="916">916</option>
                                                    <option value="918">918</option>
                                                    <option value="911">911</option>
                                                </select>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">강의 이름</h3>
                                        </li>
                                        <li class="item">
                                            <input type="text" name="className" style="width: 290px">
                                        </li>
                                    </ul>
                                    <ul class="container">
                                        <li class="item center">
                                            <h3 style="width: 140px">수업 요일</h3>
                                        </li>
                                        <li class="item">
                                            <select name="week"style="padding-right: 26px; width:290px;">
                                                <option value="0">요일 선택</option>
                                                <option value="2">월</option>
                                                <option value="3">화</option>
                                                <option value="4">수</option>
                                                <option value="5">목</option>
                                                <option value="6">금</option>
                                            </select>
                                        </li>
                                    </ul>
                                    <input type="button" class="custom-btn2 btn-2" value="강의등록" style="margin-left: 1px; margin-top: 20px" onclick="confirmInsert()" >
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script>
    function categoryChange(e) {
        var endTime_0 = ["시작 시간을 선택하세요"];
        var endTime_1 = ["10:00"];
        var endTime_2 = ["11:00"];
        var endTime_3 = ["12:00"];
        var endTime_4 = ["13:00"];
        var endTime_5 = ["14:00"];
        var endTime_6 = ["15:00"];
        var endTime_7 = ["16:00"];
        var endTime_8 = ["17:00"];
        var target = document.getElementById("changeTime");
        var room = document.getElementById("Room");

        if(e.value == "0") {
            var d = endTime_0;
        }
        else if(e.value == "9:00") {
            var d = endTime_1;
        }
        else if(e.value == "10:00") {
            var d = endTime_2;
        }
        else if(e.value == "11:00") {
            var d = endTime_3;
        }
        else if(e.value == "12:00") {
            var d = endTime_4;
        }
        else if(e.value == "13:00") {
            var d = endTime_5;
        }
        else if(e.value == "14:00") {
            var d = endTime_6;
        }
        else if(e.value == "15:00") {
            var d = endTime_7;
        }
        else if(e.value == "16:00") {
            var d = endTime_8;
        }

        target.options.length = 0;

        for (x in d) {
            var opt = document.createElement("option");
            opt.name = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
        }
    }

    function confirmInsert() {
        if(document.classInsertForm.sDate.value === "" || document.classInsertForm.eDate.value === "0"){
            alert("시간을 선택하세요.");
            document.classInsertForm.sDate.focus();
            return;
        }
        if(document.classInsertForm.startTime.value === "" || document.classInsertForm.startTime.value === "0"){
            alert("시간을 선택하세요.");
            document.classInsertForm.startTime.focus();
            return;
        }
        if(document.classInsertForm.lectureRoom.value === "" || document.classInsertForm.lectureRoom.value === "0"){
            alert("강의실을 선택하세요.");
            document.classInsertForm.lectureRoom.focus();
            return;
        }
        if(document.classInsertForm.className.value.trim() === ""){
            alert("강의 이름을 입력하세요.");
            document.classInsertForm.className.focus();
            return;
        }
        if(document.classInsertForm.week.value === "" || document.classInsertForm.week.value === "0"){
            alert("요일을 선택하세요.");
            document.classInsertForm.week.focus();
            return;
        }

        document.classInsertForm.submit();
    }
</script>
</html>
