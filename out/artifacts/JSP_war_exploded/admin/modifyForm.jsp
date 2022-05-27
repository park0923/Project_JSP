<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-18
  Time: 오전 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    String id = request.getParameter("id");
    UserDto user = dao.getUser(id);
    session.setAttribute("id", user.getId());
%>
<head>
    <script src="../member/form.js"></script>
    <link rel="stylesheet" type="text/css" href="/member/main.css">
</head>
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
                <form action="modifyProcess.jsp" method="post" name="modify_form">
                    <table>
                        <tr>
                            <td>ID</td>
                            <td><input type="text" name="id" value="<%= user.getId()%>"></td>
                        </tr>

                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="pw" value="<%=user.getPw()%>"></td>
                        </tr>

                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="name" value="<%= user.getName()%>"></td>
                        </tr>

                        <tr>
                            <td>Phone</td>
                            <td><input type="text" name="phone" value="<%= user.getPhone()%>"></td>
                        </tr>

                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="<%= user.getEmail()%>"></td>
                        </tr>

                        <tr>
                            <td>Position</td>
                            <td>
                                <select name="position" >
                                    <option><%= user.getPosition()%></option>
                                    <%
                                        if(user.getPosition().equals("admin")){
                                    %>
                                    <option>user</option>
                                    <%
                                    }else{
                                    %>
                                    <option>admin</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>State</td>
                            <td>
                                <select name="state" >
                                    <option><%= user.getState()%></option>
                                    <%
                                        if(user.getState().equals("good")){
                                    %>
                                    <option>bad</option>
                                    <%
                                    }else{
                                    %>
                                    <option>good</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>warning</td>
                            <td><input type="number" name="warning" min="0" max="10" step="1" value="<%= user.getWarning()%>"></td>
                        </tr>
                    </table>
                    <br/>
                    <div class="c">
                        <input type="submit" value="수정" onclick="AdminModifySendId(id)">
                        <input type="button" value="취소" onclick="location.href='main.jsp'">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>