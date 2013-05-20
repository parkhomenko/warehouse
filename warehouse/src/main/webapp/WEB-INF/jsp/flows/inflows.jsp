<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The list of inflows</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="10%">No</th>
        <th width="15%">Product</th>
        <th width="10%">Amount</th>
        <th width="10%">Price</th>
        <th width="10%">Cost</th>
        <th width="15%">Shipper</th>
        <th width="15%">Warehouse</th>
        <th width="15%">Date</th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="inflow" items="${inflows}">
        <c:set var="i" value="${i + 1}" />
        <tr align="center">
            <td><c:out value="${i}"/></td>
            <td><c:out value="${inflow.product.name}"/></td>
            <td><c:out value="${inflow.amount} ${inflow.product.units}"/></td>
            <td><c:out value="${inflow.price}"/></td>
            <td><c:out value="${inflow.price * inflow.amount}"/></td>
            <td><c:out value="${inflow.shipper.name}"/></td>
            <td><c:out value="${inflow.warehouse.name}"/></td>
            <td><c:out value="${inflow.inflowdate}"/></td>
        </tr>
    </c:forEach>
</table>

<a class="top" href="<c:url value="/inflows/create" />">Create a new inflow</a>