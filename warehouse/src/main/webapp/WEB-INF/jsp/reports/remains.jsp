<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h2>The remains report</h2>

<table cellpadding="0" cellspacing="0" width="100%">
    
    <tr>
        <th></th>
        <c:forEach var="warehouse" items="${warehouses}">
            <th><c:out value="${warehouse.name}"/></th>
        </c:forEach>
    </tr>
    
    <c:set var="prev_product" value="${0}"/>
    <c:set var="prev_warehouse" value="${0}"/>
    <c:set var="sum_amount" value="${0}"/>
    <c:set var="sum_cost" value="${0}"/>
    <c:set var="w_index" value="${0}"/>
    <c:set var="prev_product_units" value=""/>
    
    <c:forEach var="inflow" items="${inflows}">
        <c:if test="${inflow.left > 0}">
            <c:if test="${((inflow.product.id != prev_product) or
                            (inflow.warehouse.id != prev_warehouse)) and
                            (prev_warehouse != 0)}">
                <c:forEach var="j" begin="${w_index}" end="${fn:length(warehouses) - 1}">
                    <c:if test="${(warehouses[j].id <= prev_warehouse) or (inflow.product.id != prev_product)}">
                        <td class="right">
                            <c:if test="${warehouses[j].id == prev_warehouse}">
                                <p><c:out value="${sum_cost} $"/></p>
                                <p><c:out value="${sum_amount} ${prev_product_units}"/></p>
                            </c:if>
                        </td>
                        <c:set var="w_index" value="${w_index + 1}"/>
                    </c:if>
                </c:forEach>
                <c:set var="prev_warehouse" value="${inflow.warehouse.id}"/>
                <c:set var="sum_amount" value="${0}"/>
                <c:set var="sum_cost" value="${0}"/>
            </c:if>
            <c:if test="${inflow.product.id != prev_product}">
                <c:if test="${prev_product != 0}">
                    </tr>
                </c:if>
                <tr>
                <td class="center"><c:out value="${inflow.product.name}"/></td>
                <c:set var="prev_product" value="${inflow.product.id}"/>
                <c:set var="prev_product_units" value="${inflow.product.units}"/>
                <c:set var="w_index" value="${0}"/>
                <c:set var="prev_warehouse" value="${inflow.warehouse.id}"/>
            </c:if>
        
            <c:set var="sum_amount" value="${sum_amount + inflow.left}"/>
            <c:set var="sum_cost" value="${sum_cost + inflow.left * inflow.price}"/>
        </c:if>
    </c:forEach>
    <c:forEach var="j" begin="${w_index}" end="${fn:length(warehouses) - 1}">
        <td class="right">
            <c:if test="${warehouses[j].id == prev_warehouse}">
                <p><c:out value="${sum_cost} $"/></p>
                <p><c:out value="${sum_amount} ${prev_product_units}"/></p>
            </c:if>
        </td>
    </c:forEach>
    </tr>
    
</table>