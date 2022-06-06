<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String answer = request.getParameter("answer");
    BoardDao bdao = BoardDao.getInstance();

    if(bdao.updateanswer(id, answer) == BoardDao.ANSWER_UPDATE_SUCCESS){
%>
        <script>
            alert("수정 완료");
            location.href="inquiryList.jsp"
        </script>
<%
    }
    else{
%>
        <script>
            alert("수정 중 오류가 발생했습니다.");
            location.href="inquiryList.jsp"
        </script>
<%
    }
%>
