<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-16
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int Row = (currentPage - 1) * pageSize;
    int count = dao.getCount();
    List<UserDto> userDtoList = dao.getUserPaging(Row, pageSize);
%>
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


    .custom-btn2 {
        width: 200px;
        height: 20px;
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
</style>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../navigation.css">
</head>
<link rel="stylesheet" type="text/css" href="/member/main.css">
<body>
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header" style="padding-bottom: 0px">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="container">
        <div class="contents">
            <div class="details">
                <div class="inquiryBox">
                <table>
                    <tr>
                        <td style="width: 60px"> 순번 </td>
                        <td> 아이디 </td>
                        <td> 이름 </td>
                        <td> 이메일 </td>
                        <td> 전화번호 </td>
                        <td style="padding-right: 60px"> 유형</td>
                        <td > 예약가능</td>
                        <td> 경고</td>
                        <td> 수정</td>
                    </tr>
                    <%
                        int number = count - (currentPage - 1) * pageSize;
                        for(int i=0; i<userDtoList.size(); i++){
                    %>
                    <form action="modifyForm.jsp" method="post">
                        <tr>
                            <td><%=number--%></td>
                            <td><input type="text" name="id" value="<%=userDtoList.get(i).getId()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getName()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getEmail()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getPhone()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getPosition()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getState()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getWarning()%>" readonly></td>
                            <td><button class="custom-btn2 btn-2" style="width: 200px; height: 40px" type="submit">수정</button></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="8" align="center" style="margin-left: 50px; padding-left: 120px">
                            <%
                                if(count > 0){
                                    int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                                    int pageBlock = 10;
                                    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                                    int endPage = startPage + pageBlock - 1;
                                    if(endPage > pageCount){
                                        endPage = pageCount;
                                    }
                                    if(startPage > pageBlock){
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                            <%
                                }

                                for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                    if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                            %>
                            <%=i %>
                            <%
                            }else{ // 현재 페이지가 아닌 경우 링크 설정
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=i%>">[<%=i %>]</a>
                            <%
                                    }
                                } // for end
                                if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
                            <%
                                    }
                                }
                            %>
                        </td>
                    </tr>
                </table>
                </div>
                <button class="custom-btn2 btn-2" style="height: 50px; margin-top: 40px; margin-right: 100px" onclick="location.href='../home/joinform.jsp'" >회원 추가</button>
            </div>
        </div>
    </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
