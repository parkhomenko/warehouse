<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The list of warehouses</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="5%">No</th>
        <th width="25%">Name</th>
        <th width="45%">Address</th>
        <th width="25%">Employees</th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="warehouse" items="${warehouses}">
        <c:set var="i" value="${i + 1}" />
        <tr align="center">
            <td><c:out value="${i}"/></td>
            <td><c:out value="${warehouse.name}"/></td>
            <td><c:out value="${warehouse.address}"/></td>
            <td><c:out value="${warehouse.employees}"/></td>
        </tr>
    </c:forEach>
</table>

<a class="top" href="<c:url value="/warehouses/create" />">Create a new warehouse</a>