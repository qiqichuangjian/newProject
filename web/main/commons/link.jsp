<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/8
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="link ">
            <div class="linkHeader ">友情链接</div>
            <div class="datas">
                <ul>
                    <c:forEach var="link" items="${linkList}">
                        <li>
                            <a href="${link.linkUrl}" target="_blank ">${link.linkName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
