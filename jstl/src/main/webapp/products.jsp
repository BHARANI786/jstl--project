<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>Products List</title>
</head>
<body>

<h2>Available Products</h2>

<!-- Database Connection -->
<sql:setDataSource var="db"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/productdb"
    user="root"
    password="root"
/>

<!-- SQL Query -->
<sql:query dataSource="${db}" var="result">
    SELECT * FROM products;
</sql:query>

<!-- Display Data -->
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (₹)</th>
    </tr>

    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td>${row.id}</td>
            <td>${row.name}</td>
            <td>${row.description}</td>
            <td>${row.price}</td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="index.jsp">Back</a>

</body>
</html>
