<%@ page import="com.navi.studentdata.service.StudentDao" %>
<%@ page import="com.navi.model.Studentdata" %>
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
    String name = request.getParameter("name");
    String course = request.getParameter("course");
    String matri = request.getParameter("matri");

    StudentDataDao studentDao = new StudentDataDao();

    studentDao.update(id, new String[]{name,course,matri});

    response.sendRedirect("/Students_war_exploded/index.jsp");
%>

</body>
</html>
