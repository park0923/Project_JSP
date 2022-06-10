<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-04-16
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.BoardDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<jsp:setProperty name="board" property="*"/>
<%
    BoardDao dao = BoardDao.getInstance();
    String id = request.getParameter("id");
    System.out.println(id);
    if(dao.deleteBoard(id) == BoardDao.NOTICE_DELETE_SUCCESS){
%>
<script>
    alert("글삭제를 성공 했습니다.");
    location.href = 'mainForm.jsp';
</script>
<%
    }else {
%>
<script>
    alert("글삭제를 실패 했습니다.");
</script>
<%
    }
%>