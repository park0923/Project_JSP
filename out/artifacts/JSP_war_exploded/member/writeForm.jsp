<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-04-14
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Board</title>
</head>
<body>
    <form action="write.jsp" method="post" name="write_form">
        <h3>글 쓰기</h3>
        <div class="inputbox">
            <span>글 제목</span>
            <input type="text" name="title">
        </div>
        <div class="inputbox">
            <span>글 내용</span>
            <textarea rows="10" cols="20" name="contents"></textarea>
        </div>
        <div class="inputbox">
            <div class="box">
                <input type="submit" value="글쓰기">
            </div>
        </div>
    </form>
    <button onclick="location.href='main.jsp'">취소</button>
</body>
</html>
