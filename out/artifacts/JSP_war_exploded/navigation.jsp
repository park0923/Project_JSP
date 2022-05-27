<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" type="text/css" href="navigation.css">--%>
    <style>
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        :root
        {
            --blue: #287bff;
            --blue2: #87CEFA ;
            --white: #fff;
            --grey: #f5f5f5;
            --black1: #222;
            --black2: #999;
        }
        body
        {
            min-height: 100vh;
            overflow-x: hidden;
        }
        .container
        {
            position: relative;
            width: 100%;
        }
        .navigation
        {
            position: fixed;
            width: 20%;
            height: 100%;
            background: var(--blue);
            border-left: 10px solid var(--blue);
            transition: 0.5s;
            overflow: hidden;
        }
        .navigation.active{
            width: 80px;
        }
        .navigation ul
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
        }
        .navigation ul li
        {
            position: relative;
            width: 100%;
            list-style: none;
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }
        .navigation ul li.actives
        {
            background: var(--white);
            color: var(--blue);
        }
        .navigation ul li:hover,
        .navigation ul li.actives
        {
            background: var(--white);
        }
        .navigation ul li:nth-child(1)
        {
            margin-bottom: 40px;
        }
        .navigation ul li a
        {
            position: relative;
            display: block;
            width: 100%;
            display: flex;
            text-decoration: none;
            color: var(--white);
        }
        .navigation ul li:hover a,
        .navigation ul li.actives a
        {
            color: var(--blue);
        }
        .navigation ul li a .logo
        {
            position: relative;
            display: block;
            padding-top: 15px;
            min-width: 60px;
            height: 60px;
            line-height: 72px;
            text-align: center;
        }
        .navigation ul li a img
        {
            position: relative;
            display: block;
            margin-top: 5px;
            margin-left: 10px;
            width: 50px;
            height: 50px;
            line-height: 72px;
            font-size: 20px;
            text-align: center;
        }
        .navigation ul li a .icon
        {
            position: relative;
            display: block;
            padding-top: 15px;
            min-width: 60px;
            height: 60px;
            line-height: 72px;
            text-align: center;
        }
        .navigation ul li a .icon ion-icon
        {
            font-size: 1.75em;
        }
        .navigation ul li a .title
        {
            position: relative;
            display: block;
            padding: 0 10px;
            height: 60px;
            line-height: 60px;
            text-align: start;
            white-space: nowrap;
        }
        .navigation ul li:hover a::before,
        .navigation ul li.hovered a::before
        {
            content: '';
            position: absolute;
            right: 0;
            top: -50px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: transparent;
            box-shadow: 35px 35px 0 10px var(--white);
            pointer-events: none;
        }
        .navigation ul li:hover a::after,
        .navigation ul li.hovered a::after
        {
            content: '';
            position: absolute;
            right: 0;
            bottom: -50px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: transparent;
            box-shadow: 35px -35px 0 10px var(--white);
            pointer-events: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/member/mainForm.jsp">
                    <img src="/images/symbol.png" class="symbol" />
                    <span class="title">컴퓨터소프트웨어공학과</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/mypage.jsp">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <span class="title">마이페이지</span>
                </a>
            </li>
            <%
                if(session.getAttribute("position").equals("admin")){
            %>
                    <li class="list">
                        <a href="/admin/memberManagement.jsp">
                            <span class="icon"><ion-icon name="person-add"></ion-icon></span>
                            <span class="title">회원 정보 수정</span>
                        </a>
                    </li>
                    <li class="list">
                        <a href="/member/classInsertForm.jsp">
                            <span class="icon"><ion-icon name="calendar"></ion-icon></span>
                            <span class="title">강의 정보 입력</span>
                        </a>
                    </li>
            <%
                }else{
            %>
                    <li class="list">
                        <a href="/member/reservation.jsp">
                            <span class="icon"><ion-icon name="search"></ion-icon></span>
                            <span class="title">강의실 예약</span>
                        </a>
                    </li>
            <%
                }
            %>
            <li class="list">
                <a href="/member/reservationCheck.jsp">
                    <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/classroomLookUpForm.jsp">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/inquiry/inquiryList.jsp">
                    <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                    <span class="title">문의하기</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    let list = document.querySelectorAll('.list');

    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('actives'));
        this.classList.add('actives');
    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));

</script>
</body>
</html>
