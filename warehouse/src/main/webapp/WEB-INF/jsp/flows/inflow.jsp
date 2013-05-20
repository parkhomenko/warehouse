<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2>The new inflow creation</h2>

<form:form method="POST" commandName="inflow">
    <table cellspacing="10px" class="simple">
        <tr>
            <td>Product:</td>
            <td>
                <form:select path="product.id" items="${goods}"
                    itemValue="id" itemLabel="name" />
            </td>
            <td><form:errors path="product" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Amount:</td>
            <td><form:input path="amount" /></td>
            <td><form:errors path="amount" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><form:input path="price" /></td>
            <td><form:errors path="price" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Shipper:</td>
            <td>
                <form:select path="shipper.id" items="${shippers}"
                    itemValue="id" itemLabel="name" />
            </td>
            <td><form:errors path="shipper" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Warehouse:</td>
            <td>
                <form:select path="warehouse.id" items="${warehouses}"
                    itemValue="id" itemLabel="name" />
            </td>
            <td><form:errors path="warehouse" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Inflow date:</td>
            <td><form:input path="inflowdate" /></td>
            <td><form:errors path="inflowdate" cssClass="error" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" class="btn"
                                                onmouseover="this.className='btnhov'"
                                                onmouseout="this.className='btn'"
                                                value="Create">
            </td>
        </tr>
    </table>
</form:form>