<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
%>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="beans.UserDto"/>
<jsp:setProperty name="user" property="*"/>
<%
    UserDao dao = UserDao.getInstance();
    if (dao.confirmId(user.getId()) == UserDao.USER_EXISTENT) {
%>
<script>
    alert("이미 존재하는 아이디 입니다.")
    history.back();
</script>
<%
} else {
    if (dao.insertUser(user) == UserDao.USER_JOIN_SUCCESS) {
%>
<script>
    alert("회원가입을 성공 했습니다.");
    location.href = history.back();
</script>
<%
}else{
%>
<script>
    alert("회원가입을 실패 했습니다.");
    location.href = history.back();
</script>
<%
        }
    }
%>
