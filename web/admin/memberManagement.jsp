<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-16
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int Row = (currentPage - 1) * pageSize;
    int count = dao.getCount();
    List<UserDto> userDtoList = dao.getUserPaging(Row, pageSize);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../navigation.css">
</head>
<link rel="stylesheet" type="text/css" href="/member/main.css">
<body>
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="contents">
            <div class="details">
                <table>
                    <tr>
                        <td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>유형</td><td>예약 가능 상태</td><td>경고</td><td>버튼</td>
                    </tr>
                    <%
                        for(int i=0; i<userDtoList.size(); i++){
                    %>
                    <form action="modifyForm.jsp" method="post">
                        <tr>
                            <td><%=i+1%></td>
                            <td><input type="text" name="id" value="<%=userDtoList.get(i).getId()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getName()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getEmail()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getPhone()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getPosition()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getState()%>" readonly></td>
                            <td><input type="text" value="<%=userDtoList.get(i).getWarning()%>" readonly></td>
                            <td><input type="submit" value="수정"></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="8" align="center">
                            <%
                                if(count > 0){
                                    int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                                    int pageBlock = 10;
                                    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                                    int endPage = startPage + pageBlock - 1;
                                    if(endPage > pageCount){
                                        endPage = pageCount;
                                    }
                                    if(startPage > pageBlock){
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                            <%
                                }

                                for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                    if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                            %>
                            <%=i %>
                            <%
                            }else{ // 현재 페이지가 아닌 경우 링크 설정
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=i%>">[<%=i %>]</a>
                            <%
                                    }
                                } // for end
                                if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                            %>
                            <a href="memberManagement.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
                            <%
                                    }
                                }
                            %>
                        </td>
                    </tr>
                </table>
                <input type="button" onclick="location.href='../home/joinform.jsp'" value="회원 추가">
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
