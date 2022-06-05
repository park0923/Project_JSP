<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-18
  Time: 오전 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    UserDto user = new UserDto.Builder()
            .id(request.getParameter("id"))
            .pw(request.getParameter("pw"))
            .name(request.getParameter("name"))
            .phone(request.getParameter("phone"))
            .email(request.getParameter("email"))
            .position(request.getParameter("position"))
            .state(request.getParameter("state"))
            .warning(request.getParameter("warning"))
            .build();
    if(dao.adminUpdateUser(request.getParameter("id"), user) == UserDao.USER_UPDATE_SUCCESS){
%>
        <script>
            alert("회원정보 수정 완료");
            location.href = "../member/mainForm.jsp";
        </script>
<%
    }else{
%>
        <script>
            alert("회원정보 수정 실패");
            history.back();
        </script>
<%
    }
%>