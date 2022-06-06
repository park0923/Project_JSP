<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:useBean id="user" class="beans.UserDto"/>
<jsp:setProperty name="user" property="*"/>
<%
    request.setCharacterEncoding("utf-8");
    UserDao dao = UserDao.getInstance();
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    System.out.println(id);
    System.out.println(pw);
    System.out.println(name);
    System.out.println(phone);
    System.out.println(email);
%>

<%--    if (dao.confirmId(user.getId()) == UserDao.USER_EXISTENT) {--%>
<%--%>--%>
<%--<script>--%>
<%--    alert("이미 존재하는 아이디 입니다.")--%>
<%--    history.back();--%>
<%--</script>--%>
<%--<%--%>
<%--} else {--%>
<%--    System.out.println(session.getAttribute("id"));--%>
<%--    if (dao.insertUser(user) == UserDao.USER_JOIN_SUCCESS) {--%>
<%--        if(session.getAttribute("id")==null){--%>
<%--%>--%>
<%--        <script>--%>
<%--            alert("회원가입을 성공 했습니다.");--%>
<%--            location.href = history.back();--%>
<%--        </script>--%>
<%--<%--%>
<%--        }else if(session.getAttribute("id").equals("admin")){--%>
<%--%>--%>
<%--        <script>--%>
<%--            alert("회원가입을 성공 했습니다.");--%>
<%--            location.href = history.back();--%>
<%--        </script>--%>
<%--<%--%>
<%--        }--%>
<%--    }else{--%>
<%--%>--%>
<%--    <script>--%>
<%--        alert("회원가입을 실패 했습니다.");--%>
<%--        location.href = history.back();--%>
<%--    </script>--%>
<%--<%--%>
<%--    }--%>
<%--}--%>
<%--%>--%>
