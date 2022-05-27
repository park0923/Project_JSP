<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-04-13
  Time: 오후 7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .navigation
        {
            position: relative;
            height: 100%;
            width: 70px;
            background: #2b343b;
            box-shadow: 10px 0 0 #4187f6;
            border-left: 10px solid #2b343b;
            overflow-x: hidden;
            transition: width 0.5s;
        }
        .navigation:hover
        {
            width: 300px;
        }
        .navigation ul
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding-left: 5px;
            padding-top: 40px;
        }
        .navigation ul li
        {
            position: relative;
            list-style: none;
            width: 100%;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }
        .navigation ul li.active
        {
            background: #4187f6;
        }
        .navigation ul li a
        {
            position: relative;
            display: block;
            width: 100%;
            display: flex;
            text-decoration: none;
            color: #fff;
        }
        .navigation ul li a .icon
        {
            position: relative;
            display: block;
            min-width: 60px;
            height: 60px;
            line-height: 60px;
            text-align: center;
        }
        .navigation ul li a .icon ion-icon
        {
            position: relative;
            font-size: 1.5em;
            padding-top: 17px;
            z-index: 1;
        }
        .navigation ul li a .title
        {
            position: relative;
            display: block;
            padding-left: 10px;
            height: 60px;
            line-height: 60px;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <div class="navigation">
        <ul>
            <li class="list active">
                <a href="#">
                    <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                    <span class="title">공지사항</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <span class="title">사용방법</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon"><ion-icon name="chatbubble-outline"></ion-icon></span>
                    <span class="title">예약하기</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon"><ion-icon name="settings-outline"></ion-icon></span>
                    <span class="title">예약확인</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon"><ion-icon name="help-outline"></ion-icon></span>
                    <span class="title">강의실조회</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <span class="title">FAQ</span>
                </a>
            </li>
        </ul>

    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        const list = document.querySelectorAll('.list');
        function activeLink(){
            list.forEach((item) =>
                item.classList.remove('active'));
            this.classList.add('active');
        }
        list.forEach((item) =>
            item.addEventListener('click', activeLink));
    </script>
</body>
</html>
