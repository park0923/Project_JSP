<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  if (session.getAttribute("isLogin") != null) {
    pageContext.forward("mainForm.jsp");
  }
%>
<html>
  <head>
    <script src="../member/form.js"></script>
    <title>Login</title>
    <style>
      *
      {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body
      {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 60%;
        background: linear-gradient(#4682B4,#FFFFFF);
      }
      .container
      {
        position: relative;
        width: 20%;
        min-width: 300px;
        min-height: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        background: aliceblue;
        box-shadow: 25px 25px 25px rgba(0,0,0,0.1);
        border-radius: 30px;
        padding: 50px;
      }
      form
      {
        position: relative;
        width: 100%;
      }
      .container h3
      {
        color: #000000;
        font-weight: 600;
        font-size: 2em;
        width: 100%;
        text-align: center;
        margin-bottom: 30px;
        letter-spacing: 2px;
        text-transform: uppercase;
      }
      .inputbox
      {
        position: relative;
        width: 100%;
        margin-bottom: 20px;
      }
      .inputbox span
      {
        display: inline-block;
        color: black;
        margin-bottom: 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 0.75em;
        border-left: 4px solid black;
        padding-left: 4px;
        line-height: 1em;
      }
      .inputbox .box
      {
        display: flex;

      }
      .inputbox .box .icon
      {
        position: relative;
        min-width: 40px;
        height: 40px;
        background: #4682B4;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        margin-right: 10px;
        font-size: 1.15em;
        box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
      }
      .inputbox .box input
      {
        position: relative;
        width: 100%;
        border: none;
        outline: black;
        padding: 10px 10px;
        border-radius: 30px;
        box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
      }
      .inputbox .box input[type="submit"]
      {
        background: lightskyblue;
        border-radius: 30px;
        box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
        color: white;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-weight: 600;
        margin-top: 10px;
      }
      .inputbox .box input[type="submit"]:hover
      {
        color: #4682B4;
      }
      .inputbox .box input[type="button"]
      {
        background: lightskyblue;
        border-radius: 30px;
        box-shadow: 5px 5px 7px rgba(0,0,0,0.2);
        color: white;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-weight: 600;
        margin-top: 10px;
      }
      .inputbox .box input[type="button"]:hover
      {
        color: #4682B4;
      }
    </style>
  </head>
  <body>
      <div class="container">
        <form action="loginProcess.jsp" method="post" name="login_form">
          <h3>Log In</h3>
          <div class="inputbox">
            <span>ID</span>
            <div class="box">
              <div class="icon"><ion-icon name="person"></ion-icon></div>
              <input type="text" name="id">
            </div>
          </div>
          <div class="inputbox">
            <span>Password</span>
            <div class="box">
              <div class="icon"><ion-icon name="lock-closed"></ion-icon></div>
              <input type="password" name="pw">
            </div>
          </div>
          <div class="inputbox">
            <div class="box">
              <input type="submit" value="Log in">
              <input type="button" value="main" onclick="location.href='../index.jsp'">
            </div>
          </div>
        </form>
      </div>

  </body>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</html>
