<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-17
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    String id = (String) session.getAttribute("id");
    String beforePw = request.getParameter("before_pw");
    String afterPw = request.getParameter("after_pw");
    String checkPw = request.getParameter("check_after_pw");
    if(dao.confirmLogin(id,beforePw) == UserDao.USER_LOGIN_SUCCESS){
        if(dao.updatePassword(id,afterPw) == UserDao.USER_DELETE_SUCCESS){
%>
            <script>
                alert("회원정보 수정 완료");
                window.close();
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
    } else{
%>
            <script>
                alert("비밀번호가 틀렸습니다.");
                history.back();
            </script>
<%
    }
%>