<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-14
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 예약 시스템</title>
    <link rel="stylesheet" type="text/css" href="/mainview.css">
    <style>
        .nav{
            width: 20%;
            height: 100%;
            float: left;
        }
        .main{
            width: 80%;
            float: right;
        }
        .header{
            width: 100%;
            padding-bottom: 5%;
        }
        .contents{
            height: 100%;
            width: 100%;
            position: relative;

        }
        .details{
            height: 90%;
            width: 90%;
            top: 5%;
            left: 5%;
            position: absolute;
            background-color: white;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "../home/loginForm.jsp";
</script>
<%
    }
    BoardDao dao = BoardDao.getInstance();
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    int pageSize = 10;
    int currentPage = Integer.parseInt(pageNum);
    int Row = (currentPage - 1) * pageSize;
    List<BoardDto> boardDtoList = dao.getNoticeInquiry(Row, pageSize);
    int count = boardDtoList.size();

%>
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="main">
        <div class="header">
            <%@ include file="../header.jsp" %>
        </div>
        <div class="cardBox">
            <div class="card">
                <div>
                    <div onclick="location.href='/member/reservation.jsp'" class="cardName">강의실 예약</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="today"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick="location.href='/member/reservationCheck.jsp'" class="cardName">예약 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="search"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick="location.href='/member/classroomLookUpForm.jsp'" class="cardName">강의실 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="calendar-clear"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick="location.href='/member/inquiry/inquiryList.jsp'" class="cardName">문의하기</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="chatbox-ellipses"></ion-icon>
                </div>
            </div>
        </div>
        <div class="contents">
            <div class="details">
                <div class="title">
                    <h1>공지사항</h1>
                    <hr/>
                </div>
                <div class="inquiryBox">
                    <div class="cardHeader">
                        <h2>공지사항</h2>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <td> 글 번호 </td>
                            <td> 제목 </td>
                            <td> 작성자 </td>
                            <td> 작성일 </td>
                            <td> 분류</td>
                        </tr>

                        </thead>
                        <tbody>
                        <%
                            int number = count - (currentPage - 1) * pageSize;
                            for(int i=0; i<boardDtoList.size(); i++){
                        %>
                        <tr>
                            <td><%=number--%></td>
                            <td>
                                <a class="view" href="inquiryview.jsp?id=<%=boardDtoList.get(i).getBoard_index()%>"><%=boardDtoList.get(i).getBoard_title()%></a>
                            </td>
                            <td><%=boardDtoList.get(i).getB0ard_studentID()%></td>
                            <td><%=boardDtoList.get(i).getCreate_date()%></td>
                            <td><%=boardDtoList.get(i).getBoard_classfication()%></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="8" align="center">
                                <%
                                    if(count > 0){
                                        // 총 페이지의 수
                                        int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                                        // 한 페이지에 보여줄 페이지 블럭(링크) 수
                                        int pageBlock = 10;
                                        // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                                        int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                                        int endPage = startPage + pageBlock - 1;

                                        // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                                        if(endPage > pageCount){
                                            endPage = pageCount;
                                        }

                                        if(startPage > pageBlock){
                                %>
                                <a href="mainForm.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
                                <%
                                    }

                                    for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
                                %>
                                <%=i %>
                                <%
                                }else{ // 현재 페이지가 아닌 경우 링크 설정
                                %>
                                <a href="mainForm.jsp?pageNum=<%=i%>">[<%=i %>]</a>
                                <%
                                        }
                                    } // for end
                                    if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
                                %>
                                <a href="mainForm.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
                                <%
                                        }
                                    }
                                %>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
