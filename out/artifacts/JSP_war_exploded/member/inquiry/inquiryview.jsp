<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-23
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>문의하기</title>
    <link rel="stylesheet" type="text/css" href="/member/inquiry/inquiry.css">
    <style>
        .details .inquiryBox
        {
            position: relative;
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-top: 10px;
            border-radius: 20px;
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
        .contets
        {
            position: relative;
            width: 100%;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
        .contets .contets_title
        {
            display: flex;
            flex-direction: row;
            font-size: 20px;
        }
        .contets .contents_info
        {
            display: flex;
            flex-direction: row;
            font-size: 15px;
            margin-top: 5px;
        }
        .contets .contents_info .id
        {
            display: flex;
            flex-direction: row;
            margin-right: 20px;
        }
        .contets .contents_info .date
        {
            display: flex;
            flex-direction: row;
            margin-right: 20px;
        }
        .contets hr
        {
            margin-top: 10px;
        }
        .contets p
        {
            position: relative;
            width: 100%;
            font-size: 30px;
        }
        .details .inquiryBox from
        {
            position: relative;
            background: var(--black1);
        }
        .details .inquiryBox .inputbox
        {
            position: relative;
            width: 100%;
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }
        .details .inquiryBox .inputbox input
        {
            position: relative;
            width: 80%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .inquiryBox .inputbox button
        {
            position: relative;
            width: 80%;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 15px;
        }
        .details .inquiryBox .inputbox textarea
        {
            position: relative;
            width: 80%;
            min-height: 600px;
            border: none;
            outline: black;
            padding: 10px 10px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.2);
            font-size: 20px;
        }
        .details .inquiryBox .inputbox input[type="submit"]
        {
            background: var(--blue);
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            width: 40%;
        }
        .details .inquiryBox .inputbox input[type="submit"]:hover
        {
            background: var(--blue2);
        }
        .details .inquiryBox .inputbox button
        {
            background: var(--blue);
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            width: 40%;
        }
        .details .inquiryBox .inputbox button:hover
        {
            background: var(--blue2);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <%@ include file="../../navigation.jsp" %>
    </div>
    <%request.setCharacterEncoding("utf-8");%>
    <div class="main">
        <div class="header">
            <%@ include file="../../header.jsp" %>
        </div>

        <div class="details">
            <div class="title">
                <h1>문의하기</h1>
                <hr/>
            </div>
            <div class="inquiryBox">
                <div class="cardHeader">
                    <h2>상세보기</h2>
                    <a href="/member/inquiry/inquiryList.jsp" class="btn">돌아가기</a>
                </div>
                <%
                    UserDao udao = UserDao.getInstance();
                    BoardDao dao = BoardDao.getInstance();
                    BoardDto boardDto = dao.getBoardId(request.getParameter("id"));
                %>
                <div class="contets">
                    <div class="contets_title">
                        <h2>제목 :&nbsp;</h2>
                        <h2><%=boardDto.getBoard_title()%></h2>
                    </div>
                    <div class="contents_info">
                        <div class="id">
                            <h4>작성자 :&nbsp;</h4>
                            <h4><%=boardDto.getB0ard_studentID()%></h4>
                        </div>
                        <div class="date">
                            <h4>작성일 :&nbsp;</h4>
                            <h4><%=boardDto.getCreate_date()%></h4>
                        </div>
                    </div>
                    <hr>
                    <%
                        String[] str = boardDto.getBoard_inquiry().split("\n");
                        for (int i = 0; i < str.length; i++){
                    %>
                        <p><%=str[i]%></p>
                    <%
                        }
                    %>
                    <hr>
                    <%
                        if (udao.getPosition((String) session.getAttribute("id")).equals("admin")){
                            if (boardDto.getBoard_classfication().equals("inquiry")){
                    %>
                            <form action="/member/inquiry/inquiryanswerprocess.jsp?id=<%=boardDto.getBoard_index()%>" method="post">
                                <div class="inputBox">
                                    <%
                                    if(boardDto.getBoard_answer() == null){
                                    %>
                                    <textarea typeof="text" name="answer" placeholder="내용을 입력하세요"></textarea>
                                    <%
                                    }
                                    else{
                                    %>
                                    <textarea typeof="text" name="answer"><%=boardDto.getBoard_answer()%></textarea>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="inputBox">
                                    <input type="submit" value="작성">
                                    <button type="button" onclick="location.href='inquiryList.jsp'">취소</button>
                                </div>
                            </form>
                    <%
                            }
                        }
                        else {
                            if(boardDto.getBoard_answer() == null){
                    %>
                                <p></p>
                    <%
                            }
                            else{
                    %>
                                <p><%=boardDto.getBoard_answer()%></p>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

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
