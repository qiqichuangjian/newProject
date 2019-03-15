<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/8
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>天天新闻网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/link.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/lunbo.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/toutiao.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/hotnews.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/newsfenlei.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath() %>/static/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--  动态引入文件  --%>
    <jsp:include page="main/commons/header.jsp"></jsp:include>
    <jsp:include page="main/banner.jsp"></jsp:include>
    <c:forEach items="${newsByTypeList}" var="newsList" varStatus="i">
        <c:if test="${i.index%3==0}">
            <div class="row">
        </c:if>
        <c:forEach var="news" items="${newsList}" varStatus="newsIndex">
            <c:if test="${newsIndex.first}">
                <c:forEach items="${typeList}" var="type">
                    <c:if test="${news.typeId==type.typeId }">
                        <div class="col-md-4">
                        <div class="data_list news_list">
                        <div class="dataHeader">${type.typeName}<span class="more"><a href="#?${type.typeId}">更多...</a></span>
                        </div>
                        <div class="datas">
                        <ul>
                    </c:if>
                </c:forEach>
            </c:if>
            <li>
                <a href="#?${news.newsId}" title="${news.title}">
                    [ <fmt:formatDate value="${news.pushDate}" type="date" pattern="MM-dd"/> ]&nbsp;
                        ${fn:substring(news.title, 0, 12)}
                </a>
            </li>
            <c:if test="${newsIndex.last}">

                </ul>
                </div>
                </div>
                </div>
            </c:if>
        </c:forEach>

        <c:if test="${i.index%3==2 || i.last}">
            </div>
        </c:if>
    </c:forEach>
    <jsp:include page="main/commons/link.jsp"></jsp:include>
    <jsp:include page="main/commons/footer.jsp"></jsp:include>
</div>
</body>
<script>
    $(function () {
        var nav = document.getElementsByClassName("nav")[0];
        var olis = nav.getElementsByTagName("li");
        for (var i = 0; i < olis.length; i++) {
            olis[i].onclick = function (ev) {
                for (var j = 0; j < olis.length; j++) {
                    olis[j].className = "";
                }
                this.className = "active";
            }
        }
    })
</script>
</html>
