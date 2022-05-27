<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  UserDao dao = UserDao.getInstance();
  int rt = dao.confirmLogin(id, pw);
  if (rt == UserDao.USER_NONEXISTENT) {
%>
<script>
  alert("존재하지 않는 아이디 입니다.")
  history.back();
</script>
<%
} else if (rt == UserDao.USER_LOGIN_FAIL) {
%>
<script>
  alert("비밀번호가 틀립니다.")
  history.back();
</script>
<%
} else {
  UserDto user = dao.getUser(id);
  if (user == null) {
%>
<script>
  alert("존재하지 않는 회원 입니다.")
  history.back();
</script>
<%

    }
    session.setAttribute("name", user.getName());
    session.setAttribute("id", user.getId());
    session.setAttribute("position", dao.getPosition(user.getId()));
    session.setAttribute("isLogin", true);
    response.sendRedirect("../member/mainForm.jsp");

  }
%>
