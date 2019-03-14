<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/8
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-8">
        <a href="/GoIndexServlet">
            <img src="<%=request.getContextPath() %>/static/img/logo.png" alt="天天新闻"/>
        </a>
    </div>
    <div class="col-md-4"></div>
</div>
<div class="row">
    <div class="col-md-12">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active">
                        <a href="GoIndexServlet">首页</a>
                    </li>

                    <c:forEach var="type" items="${typeList}">
                        <li>
                            <%--TypeServlet还未写--%>
                            <a href="TypeServlet?id=${type.typeId}">${type.typeName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
    </div>
</div>