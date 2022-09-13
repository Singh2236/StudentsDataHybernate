<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage='true' %>
<html>
<head>
    <title>redirect</title>
</head>
<body>
<%
    StudentDataDao studentDao = new StudentDataDao();
    String name = request.getParameter("name");
    String course = request.getParameter("course");
    String matri = request.getParameter("matri");
    studentDao.save(new String[]{name, course, matri});
    response.sendRedirect("/Students_war_exploded/index.jsp");
%>

</body>
</html>
