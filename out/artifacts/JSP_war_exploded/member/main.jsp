<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="form.js"></script>
    <title>Home</title>
</head>
<body>
<h2>
    <%
        if (session.getAttribute("isLogin") == null) {

    %>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "loginForm.jsp";
    </script>

    <%
        }else{
            System.out.println((String) session.getAttribute("name"));
    %>
        <hr>
        <%=session.getAttribute("name")%>님 안녕하세요<br/><br/>
    <%
        if(session.getAttribute("position").equals("admin")){
    %>
            <button onclick="location.href='memberManagement.jsp'">회원관리</button>
    <%
        }
    %>
        <button onclick="confirmCheck()">아이디 삭제</button>
        <button onclick="location.href='checkPwForm.jsp'">회원정보 수정</button>
        <button onclick="location.href='logout.jsp'">로그아웃</button>
        <button onclick="location.href='writeForm.jsp'">글쓰기</button>
        <button onclick="location.href='notice.jsp'">공지사항</button>
        <button onclick="location.href='reservationFirst.jsp'">예약하기</button>
    <%
        }
    %>

</body>
</html>