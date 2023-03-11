<%@ page import="com.demo.demo.Log" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: Tabs
  Date: 2023-03-09
  Time: 12:50 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Loggy</title>
</head>
<body>

    <!-- Message -->
    <p><%=request.getAttribute("message")%></p>

    <!-- Form -->
    <form method="post">
        <label for="title">Title: </label>
        <input type="text" name="title" id="title" required autofocus>
        <br>
        <label for="content">Content: </label>
        <input type="text" name="content" id="content" required>
        <br>
        <input type="submit" value="submit">
    </form>

    <!-- Display -->
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Title</th>
                <th>Content</th>
            </tr>
        </thead>
        <tbody>

        <!-- Generate Entries -->
        <%
            List<Log> logs = (List<Log>)request.getAttribute("logs");

            for(int i = 0; i < logs.size(); i++){

               %><tr>
                    <td><%=logs.get(i).getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))%></td>
                    <td><%=logs.get(i).getTitle()%></td>
                    <td><%=logs.get(i).getContent()%></td>
                 </tr><%
            }
        %>


        </tbody>
    </table>


</body>
</html>