<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Warehouse</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/site.css" />">
    </head>
    <body>
        <div class="page">
	 
            <div id="header">
            </div>
            
            <div id="menucontainer">
                <ul id="menu">              
                    <li><a href="<c:url value="/" />">Home</a></li>
                    <li><a href="<c:url value="/warehouses" />">Warehouses</a></li>
                    <li><a href="<c:url value="/shippers" />">Shippers</a></li>
                    <li><a href="<c:url value="/customers" />">Customers</a></li>
                    <li><a href="<c:url value="/goods" />">Goods</a></li>
                    <li><a href="<c:url value="/inflows" />">Inflows</a></li>
                    <li><a href="<c:url value="/outflows" />">Outflows</a></li>
                    <li><a href="<c:url value="/stock" />">Stock</a></li>
                    <li><a href="<c:url value="/report" />">Report</a></li>
                </ul>
            </div>
            
            <div id="main">
                <tiles:insertAttribute name="content" />
            </div>
	 
            <div id="footer">
                <p>Something goes here...</p>
            </div>
    </body>
</html>