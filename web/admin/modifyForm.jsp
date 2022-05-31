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
    <link rel="stylesheet" type="text/css" href="/member/main.css">
<style>

    .details .inquiryBox
    {
        position: relative;
        width: 100%;
        padding: 20px;
        display: flex;
        flex-direction: column;
        margin-top: 40px;
        border-radius: 20px;
        box-shadow: 0 7px 25px rgba(0,0,0,0.5);


    }
    .cardHeader
    {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }
    .cardHeader h2
    {
        font-weight: 600;
        color: var(--blue);
    }
    .btn
    {
        position: relative;
        padding: 5px 10px;
        background: var(--blue);
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn:hover
    {
        background: var(--blue2);
        color: var(--blue);
    }
    .btn_up
    {
        position: relative;
        padding: 5px 10px;
        background: blue;
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn_up:hover
    {
        background: var(--blue2);
        color: var(--white);
    }
    .btn_del
    {
        position: relative;
        padding: 5px 10px;
        background: #FE2E2E;
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }
    .btn_del:hover
    {
        background: #F78181;
        color: var(--white);
    }

    .details .inquiryBox table
    {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    .details .inquiryBox table thead td
    {
        font-weight: 600;
        text-align: center;
    }
    .details .inquiryBox table tr
    {
        color: var(--black1);
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }
    .details .inquiryBox table tr:last-child
    {
        border-bottom: none;
    }

    .details .inquiryBox table tr td .view
    {
        text-decoration: none;
        color:  var(--black1);
    }
    .details .inquiryBox table tr td .view:hover
    {
        text-decoration: none;
        color:  var(--white);
    }
    .details .inquiryBox table tr td
    {
        padding: 10px;
        text-align: center;
    }
    .details .inquiryBox table tbody tr td:nth-child(6)
    {
        text-align: end;
    }

    input[type=text]{
        size: 100px;
        width: 100%;
        border: 0;
        text-align: center;
        border:none;
        border-left: none;
        border-bottom: none;
        border-top: none;
        border-right: none;
        outline: none;
    }
    input[type=password]{
        size: 100px;
        width: 100%;
        border: 0;
        text-align: center;
        border:none;
        border-left: none;
        border-bottom: none;
        border-top: none;
        border-right: none;
        outline: none;
    }
    input[type=number]{
        size: 100px;
        width: 100%;
        border: 0;
        text-align: center;
        outline: none;
    }



    .custom-btn2 {
        width: 200px;
        height: 50px;
        color: #fff;
        border-radius: 5px;
        padding: 10px 5px;
        font-family: 'Lato', sans-serif;
        font-weight: bold;
        font-size: large;
        background: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        position: center;
        display: inline-block;
        box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
        7px 7px 20px 0px rgba(0,0,0,.1),
        4px 4px 5px 0px rgba(0,0,0,.1);
        outline: none;
    }
    .btn-2 {
        background: rgb(19, 109, 252);
        background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
        border: none;
    }
    .btn-2:hover {
        background: rgb(0,3,255);
        background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
    }
</style>

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
                <h1>회원정보 수정</h1>
                <hr/>
                <div class="inquiryBox">

                <form action="modifyProcess.jsp" method="post" name="admin_modify_form">
                    <table>
                        <tr>
                            <td>ID</td>
                            <td><input type="text" name="id" value="<%= user.getId()%>" ></td>
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
                                <select  name="position"style="padding-right: 26px; width:100px;" >
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
                                <select name="state"style="padding-right: 26px; width:100px;" >
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
                        <input type="button" class="custom-btn2 btn-2" value="수정" onclick="confirmModify()" >
                        <input type="button" class="custom-btn2 btn-2" value="취소" onclick="location.href='../member/mainForm.jsp'">

                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    function confirmModify() {
        if(document.admin_modify_form.id.value === ""){
            alert("아이디를 입력하세요.");
            document.admin_modify_form.id.focus();
            return;
        }
        if(document.admin_modify_form.pw.value === ""){
            alert("비밀번호를 입력하세요.");
            document.admin_modify_form.pw.focus();
            return;
        }
        if(document.admin_modify_form.name.value === ""){
            alert("이름을 입력하세요.");
            document.admin_modify_form.id.focus();
            return;
        }
        if(document.admin_modify_form.phone.value === ""){
            alert("전화번호를 입력하세요.");
            document.admin_modify_form.id.focus();
            return;
        }
        if(document.admin_modify_form.email.value === ""){
            alert("이메일을 입력하세요.");
            document.admin_modify_form.id.focus();
            return;
        }
        document.admin_modify_form.submit();
    }
</script>
</body>
</html>