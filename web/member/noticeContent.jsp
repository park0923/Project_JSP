<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-04-15
  Time: 오후 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <table border="1">
        <tr><td> 글 번호 </td><td> 제목 </td><td> 내용 </td> <td> 작성자 </td> <td> 생성 날짜 </td> <td> 업데이트 날짜 </td> <td> 조회수 </td></tr>
            <%
                    BoardDao dao = BoardDao.getInstance();
                    BoardDto boardDto = dao.getBoardId(request.getParameter("id"));
            %>
        <tr><td><%=boardDto.getBoard_index()%> </td>
            <td><%=boardDto.getBoard_title()%> </td>
            <td><%=boardDto.getBoard_inquiry()%></td>
            <td><%=boardDto.getB0ard_studentID()%> </td>
            <td><%=boardDto.getCreate_date()%> </td>
        </tr>
        <button onclick="location.href='notice.jsp'">뒤로 가기</button>
<%
           if(session.getAttribute("name").equals(boardDto.getB0ard_studentID())){
%>
        <button onclick="location.href='deleteProcess.jsp?id=<%=boardDto.getBoard_index()%>'">삭제하기</button>
        <%
            }else{
               System.out.println(session.getAttribute("name"));
               System.out.println(boardDto.getB0ard_studentID());
            }
        %>
</div>
</body>
</html>
