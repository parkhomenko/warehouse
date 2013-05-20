<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The list of shippers</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="10%">No</th>
        <th width="45%">Name</th>
        <th width="45%">Representative</th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="shipper" items="${shippers}">
        <c:set var="i" value="${i + 1}" />
        <tr align="center">
            <td><c:out value="${i}"/></td>
            <td><c:out value="${shipper.name}"/></td>
            <td><c:out value="${shipper.representative}"/></td>
        </tr>
    </c:forEach>
</table>

<a class="top" href="<c:url value="/shippers/create" />">Create a new shipper</a>