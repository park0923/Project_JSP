<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-04-14
  Time: 오후 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.BoardDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<jsp:setProperty name="board" property="*"/>
<%
    BoardDao dao = BoardDao.getInstance();
    String name = (String) session.getAttribute("name");
    if(dao.insertBoard(board, name) == BoardDao.NOTICE_WRITE_SUCCESS){
%>
<script>
    alert("글쓰기를 성공 했습니다.");
    location.href = 'main.jsp';
</script>
<%
    }else {
%>
<script>
    alert("글쓰기를 실패 했습니다.");
</script>
<%
    }
%>
