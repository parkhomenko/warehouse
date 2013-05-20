<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The stock</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="10%">No</th>
        <th width="15%">Product</th>
        <th width="10%">Amount</th>
        <th width="10%">Price</th>
        <th width="15%">Shipper</th>
        <th width="15%">Warehouse</th>
        <th width="10%">Write-off</th>
        <th width="15%"></th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="inflow" items="${inflows}">
        <c:if test="${inflow.left > 0}">
            <c:set var="i" value="${i + 1}" />
            <tr align="center">
                <td><c:out value="${i}"/></td>
                <td><c:out value="${inflow.product.name}"/></td>
                <td><c:out value="${inflow.left} ${inflow.product.units}"/></td>
                <td><c:out value="${inflow.price}"/></td>
                <td><c:out value="${inflow.shipper.name}"/></td>
                <td><c:out value="${inflow.warehouse.name}"/></td>
                <td><c:out value="${inflow.price * inflow.left / inflow.amount}"/></td>
                <td><a href="<c:url value="/stock/buy/${inflow.id}" />">Buy</a></td>
            </tr>
        </c:if>
    </c:forEach>
</table>