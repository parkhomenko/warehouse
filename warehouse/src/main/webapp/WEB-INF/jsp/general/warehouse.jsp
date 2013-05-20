<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2>The new warehouse creation</h2>

<form:form method="POST" commandName="warehouse">
    <table cellspacing="10px" class="simple">
        <tr>
            <td>Name:</td>
            <td><form:input path="name" /></td>
            <td><form:errors path="name" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><form:input path="address" /></td>
            <td><form:errors path="address" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Number of employees:</td>
            <td><form:input path="employees" /></td>
            <td><form:errors path="employees" cssClass="error" /></td>
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