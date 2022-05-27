<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-15
  Time: 오후 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    String id = (String) session.getAttribute("id");
    System.out.println(id);
    int rt = dao.deleteId(id);
    if(rt == UserDao.USER_DELETE_SUCCESS){
%>
<script>
    alert("삭제되었습니다.")
    location.href="../../index.jsp";
</script>
<%
    } else{
%>
<script>
    alert("오류로 삭제되지 않았습니다.")
    history.back();
</script>
<%
    }
%>