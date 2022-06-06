<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-22
  Time: 오후 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<html>
<head>
    <title>문의하기</title>
    <link rel="stylesheet" type="text/css" href="../main.css">
<%--    <link rel="stylesheet" type="text/css" href="/member/inquiry/inquiry.css">--%>
    <style>
        .details .inquiryBox
        {
            position: relative;
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-top: 40px;
            margin-left: 200px;
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
        .details .inquiryBox table tbody tr:hover
        {
            background: var(--blue);
            color: var(--white);
        }
        .details .inquiryBox table tbody tr:hover:last-child
        {
            background: none;
            color: black;
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
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    BoardDao dao = BoardDao.getInstance();
    List<BoardDto> boardDtoList = null;
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
            boardDtoList = dao.getInquiry(Row, pageSize, "");
        }else {
        %>
            <script>
                alert("예약이 없습니다.")
                history.back();
            </script>
        <%
        }
    }else{
        boardDtoList = dao.getInquiry(Row, pageSize, (String) session.getAttribute("id"));
        count = dao.getIdCount((String) session.getAttribute("id"));
    }
%>
<div class="container">
    <div class="nav">
        <%@ include file="../../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <div class="title">
                    <h1>문의하기</h1>
                    <hr/>
                </div>
                <div class="inquiryBox">
                    <div class="cardHeader">
                        <h2>문의내용</h2>
                        <a href="/member/inquiry/inquiry.jsp" class="btn">글쓰기</a>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <td> 글 번호 </td>
                            <td> 제목 </td>
                            <td> 작성자 </td>
                            <td> 작성일 </td>
                            <td> 분류</td>
                        </tr>

                        </thead>
                        <tbody>
                        <%
                            int number = count - (currentPage - 1) * pageSize;
                            for(int i=0; i<boardDtoList.size(); i++){
                        %>
                        <tr>
                            <td><%=number--%></td>
                            <td>
                                <a class="view" href="inquiryview.jsp?id=<%=boardDtoList.get(i).getBoard_index()%>"><%=boardDtoList.get(i).getBoard_title()%></a>
                            </td>
                            <td><%=boardDtoList.get(i).getB0ard_studentID()%></td>
                            <td><%=boardDtoList.get(i).getCreate_date()%></td>
                            <td><%=boardDtoList.get(i).getBoard_classfication()%></td>
                            <%
                                if(session.getAttribute("id").equals(boardDtoList.get(i).getB0ard_studentID()) || session.getAttribute("position").equals("admin")){
                            %>
                            <td>
                                <a href="/member/inquiry/inquiryupdate.jsp?id=<%=boardDtoList.get(i).getBoard_index()%>" class="btn_up">수정</a>
                            </td>
                            <td>
                                <a href="/member/inquiry/inquirydeleteprocess.jsp?id=<%=boardDtoList.get(i).getBoard_index()%>" class="btn_del">삭제</a>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="8" align="center">
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
                                <a href="inquiryList.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                                <%
                                    }

                                    for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                                %>
                                <%=i %>
                                <%
                                }else{ // 현재 페이지가 아닌 경우 링크 설정
                                %>
                                <a href="inquiryList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
                                <%
                                        }
                                    } // for end
                                    if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                                %>
                                <a href="inquiryList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
                                <%
                                        }
                                    }
                                %>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
