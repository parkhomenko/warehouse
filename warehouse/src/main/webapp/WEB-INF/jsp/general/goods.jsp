<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The list of goods</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="10%">No</th>
        <th width="45%">Name</th>
        <th width="45%">Units</th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="product" items="${goods}">
        <c:set var="i" value="${i + 1}" />
        <tr align="center">
            <td><c:out value="${i}"/></td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.units}"/></td>
        </tr>
    </c:forEach>
</table>

<a class="top" href="<c:url value="/goods/create" />">Create a new product</a>