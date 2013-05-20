<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>The list of outflows</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th width="10%">No</th>
        <th width="15%">Product</th>
        <th width="15%">Amount</th>
        <th width="15%">Price</th>
        <th width="15%">Cost</th>
        <th width="15%">Customer</th>
        <th width="15%">Date</th>
    </tr>
    
    <c:set var="i" value="${0}" />
    <c:forEach var="outflow" items="${outflows}">
        <c:set var="i" value="${i + 1}" />
        <tr align="center">
            <td><c:out value="${i}"/></td>
            <td><c:out value="${outflow.inflow.product.name}"/></td>
            <td><c:out value="${outflow.amount} ${outflow.inflow.product.units}"/></td>
            <td><c:out value="${outflow.inflow.price}"/></td>
            <td><c:out value="${outflow.inflow.price * outflow.amount}"/></td>
            <td><c:out value="${outflow.customer.name}"/></td>
            <td><c:out value="${outflow.outflowdate}"/></td>
        </tr>
    </c:forEach>
</table>