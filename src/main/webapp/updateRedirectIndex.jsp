<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updating</title>
</head>
<body>

<%
    //Geting Parameters from the front end
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDataDao studentDao = new StudentDataDao();
    boolean idExists = studentDao.isIdExists(id);
    if (idExists) {
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String matri = request.getParameter("matri");
        studentDao.update(id, new String[]{name,course,matri});
        response.sendRedirect("/index.jsp");
    }else response.sendRedirect("/error.jsp");
%>

</body>
</html>
