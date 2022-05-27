<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="beans.testDTO" %>

<%@ page import="mysql.testDAO" %>
<%@ page import="java.io.PrintWriter"%>

<%
    request.setCharacterEncoding("UTF-8");

    String schedule_name = null;
    String schedule_lectureroom_num= null;
    String schedule_class_Stime= null;
    String schedule_class_Etime= null;
    String schedule_week= null;

    if (request.getParameter("schedule_name") != null)
    { schedule_name = (String) request.getParameter("schedule_name"); }

    if (request.getParameter("schedule_lectureroom_num") != null)
    { schedule_lectureroom_num = (String) request.getParameter("schedule_lectureroom_num"); }

    if (request.getParameter("schedule_class_Stime") != null)
    { schedule_class_Stime = (String) request.getParameter("schedule_class_Stime"); }

    if (request.getParameter("schedule_class_Etime") != null)
    { schedule_class_Etime = (String) request.getParameter("schedule_class_Etime"); }

    if (request.getParameter("schedule_week") != null)
    { schedule_week = (String) request.getParameter("schedule_week"); }

    if (schedule_name == null || schedule_lectureroom_num == null||schedule_class_Stime == null || schedule_class_Etime == null||schedule_week == null)
    { PrintWriter script = response.getWriter(); script.println("<script>");

        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("</script>"); script.close(); return;
    }

    testDAO testDAO = new testDAO();
    int result = testDAO.join(schedule_name, schedule_lectureroom_num,schedule_class_Stime,schedule_class_Etime,schedule_week);
    if (result == 1) { PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('등록에 성공했습니다.')");
        script.println("location.href='test.jsp';");
        script.println("</script>"); script.close();
        return; }
%>
