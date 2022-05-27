<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-16
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
        <div class="header">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <table>
                    <tr>
                        <td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>유형</td><td>예약 가능 상태</td><td>경고</td><td>버튼</td>
                    </tr>
                    <%
                        UserDao dao = UserDao.getInstance();
                        ResultSet rs = dao.getMember();
                        while(rs.next()){
                    %>
                    <form action="modifyForm.jsp" method="post">
                        <tr>
                            <td><input type="text" name="id" value="<%=rs.getString("member_id")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_name")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_email")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_phone")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_position")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_state")%>" readonly></td>
                            <td><input type="text" value="<%=rs.getString("member_warning")%>" readonly></td>
                            <td><input type="submit" value="수정"></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                </table>
                <input type="button" onclick="location.href='../home/joinform.jsp'" value="회원 추가">
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
