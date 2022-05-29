<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-14
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "loginForm.jsp";
</script>
<%
}
%>
    <html>
    <head>
        <title>Title</title>
        <script src="../form.js"></script>
<%--        <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">--%>
        <link rel="stylesheet" type="text/css" href="../main.css">
    </head>
    <body>
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
                    <form action="memberUpdateForm.jsp" method="post" name="check_form">
                        <table>
                            <td>비밀번호 입력하세요</td>
                            <td><input type="password" name="pw"></td>
                        </table>
                        <div class="c">
                            <input type="button" value="확인" onclick="confirmPassword()">
                            <input type="button" value="취소" onclick="location.href='../mainForm.jsp'">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
    </html>
