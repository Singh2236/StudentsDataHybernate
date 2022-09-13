<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%@ page import="java.util.List" %>
<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page import="com.navi.model.Studentdata" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    StudentDataDao studentDao = new StudentDataDao();
    List<Studentdata> all = studentDao.getAll();
%>
<!DOCTYPE html>
<html>
<head>
    <title>StudentData</title>
</head>
<body>
<h1>Student Data</h1>
<h3>Update information</h3>

<form action="/Students_war_exploded/updateRedirectIndex.jsp" method="post">
    <table>

        <tr>
            <td>Id</td>
            <td><input type="text" name="id" placeholder="valid available id"></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Course:</td>
            <td><input type="text" name="course"></td>
        </tr>
        <tr>
            <td>Matriculation Number:</td>
            <td><input type="text" name="matri"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit"></td>
        </tr>
    </table>
</form>
<h3><a href="index.jsp">Home</a></h3>

<br/>
<div class="table-responsive">
    <table id="registraion" class="table table-sm table-dark">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Course</th>
            <th scope="col">Matriculation No.</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Studentdata s : all) {
        %>
        <tr>
            <td><%=s.getId()%>
            </td>
            <td><%=s.getName()%>
            </td>
            <td><%=s.getCourse()%>
            </td>
            <td><%=s.getMatri()%>
            </td>
            <td><input type="button" value="edit" formaction="/StudentData_war_exploded/update.jsp"></td>
            <td><input type="button" value="delete"></td>

        </tr>

        <%
            }
        %>
        </tbody>
    </table>
</div>
<a href="/Students_war_exploded/index.jsp">Refresh</a>
</body>
</html>