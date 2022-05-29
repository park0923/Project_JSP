<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-23
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.BoardDao" %>

<%
    String id = request.getParameter("id");
    BoardDao bdao = BoardDao.getInstance();

    if(bdao.deleteBoard(id) == BoardDao.NOTICE_DELETE_SUCCESS){
%>
        <script>
            alert("삭제 완료");
            location.href="inquiryList.jsp"
        </script>
<%
    }
    else{
%>
        <script>
            alert("삭제 중 오류가 발생했습니다.");
            location.href="inquiryList.jsp"
        </script>
<%
    }
%>