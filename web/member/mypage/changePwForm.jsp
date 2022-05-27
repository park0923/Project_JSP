<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-17
  Time: 오후 5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>

    #main{
      width:60%;
      margin:auto;
    }
    table{
      border: 2px solid #d2d2d2;
      border-collapse: collapse;
      font-size: 0.9em;
    }
    th, td{
      border: 1px solid #d2d2d2;
      border-collapse: collapse;
    }
    th{
      height: 5px;
    }
    td {
      width: 90px;
      height: 60px;
    }
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    ul,
    li {
      list-style: none;
    }
    a {
      text-decoration: none;
      color: inherit;
    }
    .register{
      width: 550px;
      height: 600px;
      margin: 200px auto 0;
      padding: 15px 15px;
      background: white;
      color: #2b2e4a;
      font-size: 14px;
      text-align: left;
      box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    }
    .register h3{
      font-size: 20px;
      margin-bottom: 20px;
      text-align: center;
    }
    .register input{
      width: 100%;
      height: 40px;
      outline: none;
      padding: 10px;
      border: 1px solid #707070;
      transition: 0.3s;
    }
    .register input:valid, .register input:focus{
      border: 1px solid #2b2e4a;
    }
    .register .center{
      display: flex;
      align-items: center;
    }
    .register .flex{
      display: flex;
      flex-direction: column;
    }
    .register .flex .container{
      display: grid;
      grid-template-columns: 1fr 3fr 1fr;
      margin-bottom: 10px;
    }
    .register .flex .container .item:first-child{
      margin-right: 10px;
    }
    .register .flex .container .item .idcheck{
      height: 100%;
      margin-left: 10px;
      padding: 5px 15px;
      background: #2b2e4a;
      border: 1px solid #2b2e4a;
      color: white;
      font-size: 12px;
      transition: 0.3s;
    }
    .register .flex .container .item .idcheck:hover{
      background: white;
      color: #2b2e4a;
    }
    .register .flex .container .item select{
      height: 40px;
      padding: 10px;
      border: 1px solid #2b2e4a;

    }
    .register .submit{
      width: 100%;
      height: 40px;
      color: white;
      border: none;
      border: 1px solid #2b2e4a;
      background: #2b2e4a;
      transition: 0.3s;
    }
    .register .flex .container:last-child{
      margin: 0;
    }
    .register .submit:hover{
      width: 100%;
      height: 40px;
      border: none;
      border: 1px solid #2b2e4a;
      color: #2b2e4a;
      background: white;
    }
    table {
      /*width: 100%;*/
      border: 1px solid #444444;
      padding: 5px;
      margin-left: auto;
      margin-right: auto;
    }

    td {
      /*width: 100%;*/
      /*border: 1px solid #444444;*/
    }

    .c {
      text-align: center;
    }
    .custom-btn2 {
      width: 200px;
      height: 20px;
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

    .left {
      width: 50%;
      float: left;
      margin-top: 200px;

    }
    .right {
      width: 50%;
      float: right;
      display: inline-block;
    }

  </style>
  <script src="../form.js?ver=5"></script>
  <title>Title</title>
</head>
<body>
<form action="changePwProcess.jsp" method="post" name="change_form">

  <div class="register" style="padding-left: 40px; margin-top: 100px;">
    <h3 style="margin-bottom: 50px; border-left-width: 0px; margin-left: 0px; padding-top: 50px;">비밀번호 변경</h3>
    <div class="flex">
      <ul class="container">
        <li class="item center" style="width: 110px;">
          현재 비밀번호
        </li>
        <li class="item">
          <input type="password" name="before_pw">
        </li>
        <li class="item">
        </li>
      </ul>
      <ul class="container">
        <li class="item center" style="width: 110px;">
          새로운 비밀번호
        </li>
        <li class="item">
          <input type="password" name="after_pw">
        </li>
        <li class="item">
        </li>
      </ul>
      <ul class="container">
        <li class="item center" style="width: 110px;">
          비밀번호 확인
        </li>
        <li class="item">
          <input type="password" name="check_after_pw">
        </li>
        <li class="item">
        </li>
      </ul>

      </table>
      <div>
        <input class="custom-btn2 btn-2" style="width: 200px; height: 40px;" type="button" value="변경" onclick="confirmChange(this)" >
        <input class="custom-btn2 btn-2" style="width: 200px; height: 40px;" type="button" onclick="window.close()" value="취소">
      </div>
    </div>
  </div>
</form>

</body>
</html>
