<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%@ page import="java.util.List" %>
<%@ page import="com.navi.service.StudentDataDao" %>
<%@ page import="com.navi.model.Student" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    StudentDataDao studentDao = new StudentDataDao();
    List<Student> all = studentDao.getAll();
%>
<!DOCTYPE html>
<html>
<head>
    <title>StudentData</title>
    <link rel="stylesheet" href="styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<h1>Student Data</h1>

<div class="summary-table">
    <table class="table table-sm">
        <tr>
            <td id="Registraion">
                <h3>Registration Form</h3>
                <form action="/saveRedirectIndex.jsp" method="post">
                    <table>
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
            </td>
            <td id="Update Information">
                <h3>Update Information form</h3>
                <form action="/updateRedirectIndex.jsp" method="post">
                    <div CLASS="summary-table">
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
                    </div>
                </form>
            </td>
            <td id="Delete">
                <h3>Delete</h3>
                <form action="/deleteRedirectIndex.jsp" method="post">
                    <table>
                        <tr>
                            <td>Id</td>
                            <td><input type="text" name="deleteId" placeholder="valid available id"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit"></td>
                        </tr>
                    </table>
                </form>

            </td>
        </tr>
    </table>
</div>
<br/>

<div class="table-responsive">
    <table class="table table-sm table-dark">
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
            for (Student s : all) {
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
            <%--<td><input type="button" value="edit" formaction="/StudentData_war_exploded/update.jsp"></td>
            <td><input type="button" value="delete 1"></td>--%>

        </tr>

        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>