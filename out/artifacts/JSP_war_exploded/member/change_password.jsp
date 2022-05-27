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
  <script src="form.js?ver=5"></script>
    <title>Title</title>
</head>
<body>
<form action="change_password_process.jsp" method="post" name="change_form">
  <table>
    <tr>
      <td>비밀번호 변경 창</td>
    </tr>

    <tr>
      <td>현재 비밀번호</td>
      <td><input type="password" name="before_pw"></td>
    </tr>

    <tr>
      <td>변경할 비밀번호</td>
      <td><input type="password" name="after_pw"></td>
    </tr>

    <tr>
      <td>비밀번호 확인</td>
      <td><input type="password" name="check_after_pw"></td>
    </tr>
  </table>
    <div>
      <input type="button" value="변경" onclick="confirmChange()" >
      <input type="button" onclick="window.close()" value="취소">
    </div>
</form>

</body>
</html>
