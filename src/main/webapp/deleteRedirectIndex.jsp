<%@ page import="com.navi.model.Studentdata" %>
<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleting</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("deleteId"));
    StudentDataDao studentDao = new StudentDataDao();
    studentDao.delete(id);
    response.sendRedirect("/Students_war_exploded/index.jsp");
%>

</body>
</html>
