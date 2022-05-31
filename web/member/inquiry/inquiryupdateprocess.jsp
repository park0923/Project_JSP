<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-23
  Time: 오후 7:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String id = request.getParameter("id");
    String body = request.getParameter("inquiry");
    Date date = new Date();
    SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
    String strDate = sDate.format(date);

    UserDao udao = UserDao.getInstance();
    UserDto udto = udao.getUser((String) session.getAttribute("id"));
    BoardDao bdao = BoardDao.getInstance();

    if(udto.getPosition().equals("user")){
        if(bdao.updateinquiry(id, body, strDate) == BoardDao.NOTICE_UPDATE_SUCCESS){

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
    }
    else if (udto.getPosition().equals("admin")){
        if(bdao.updateinquiry(id, body, strDate) == BoardDao.NOTICE_UPDATE_SUCCESS){
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
    }
%>
