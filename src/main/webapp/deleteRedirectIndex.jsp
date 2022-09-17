<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleting</title>
</head>
<body>
<%
    //Checking for if the id existsbin the database
    int id = Integer.parseInt(request.getParameter("deleteId"));
    StudentDataDao studentDao = new StudentDataDao();
    boolean idExists = studentDao.isIdExists(id);

    if (idExists) { //if id exits then perform this task
        studentDao.delete(id);
        response.sendRedirect("/index.jsp");
    }else response.sendRedirect("/error.jsp");
%>

</body>
</html>
