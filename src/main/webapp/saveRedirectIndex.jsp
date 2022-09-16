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
    int matri = Integer.parseInt(request.getParameter("matri"));


    studentDao.save(name,course,matri);
    response.sendRedirect("/index.jsp");
%>

</body>
</html>
