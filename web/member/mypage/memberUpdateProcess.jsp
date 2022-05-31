<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    request.setCharacterEncoding("UTF-8");
    String rid = request.getParameter("id");
    String sid = (String) session.getAttribute("id");
    UserDto user = new UserDto.Builder()
            .id(rid)
            .name(request.getParameter("name"))
            .phone(request.getParameter("phone"))
            .email(request.getParameter("email"))
            .build();
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    if(dao.confirmLogin(sid,pw) == UserDao.USER_LOGIN_SUCCESS){
        if (dao.updateUser(sid, user) == UserDao.USER_UPDATE_SUCCESS) {
            session.setAttribute("name", user.getName());
            session.setAttribute("id", user.getId());
            session.setAttribute("isLogin", true);
%>
            <script>
                alert("회원정보 수정 완료");
                location.href = '../mainForm.jsp';
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
    } else {
%>
            <script>
                alert("비밀번호가 틀렸습니다.");
                history.back();
            </script>
<%
    }
%>
