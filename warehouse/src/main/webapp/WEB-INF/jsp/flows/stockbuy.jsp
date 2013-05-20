<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2>Buying the product - <c:out value="${product_name}"/></h2>

<form:form method="POST" commandName="outflow">
    <table cellspacing="10px" class="simple">
        <tr>
            <td>Customer:</td>
            <td>
                <form:select path="customer.id" items="${customers}"
                    itemValue="id" itemLabel="name" />
            </td>
            <td><form:errors path="customer" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Amount:</td>
            <td><form:input path="amount" /></td>
            <td><form:errors path="amount" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Inflow date:</td>
            <td><form:input path="outflowdate" /></td>
            <td><form:errors path="outflowdate" cssClass="error" /></td>
        </tr>
        <form:hidden path="inflow.id" />
        <tr>
            <td colspan="2" align="center"><input type="submit" class="btn"
                                                onmouseover="this.className='btnhov'"
                                                onmouseout="this.className='btn'"
                                                value="Create">
            </td>
        </tr>
    </table>
</form:form>