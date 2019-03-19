<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/16
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>分类新闻</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/news.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath() %>/static/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--  动态引入文件  --%>
    <jsp:include page="commons/header.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-8">
            <jsp:include page="${mainJsp}"></jsp:include>
        </div>
        <div class="col-md-4">
            <%--最近更新  start--%>
            <div class="data_list " style="height: 300px;">
                <div class="dataHeader">最新新闻</div>
                <div class="datas">
                    <ul>
                        <c:forEach items="${newNewsList}" var="news">
                            <li>
                                <a href="NewsServlet?action=queryOne&newsId=${news.newsId}" title="${news.title}">${fn:substring(news.title, 0, 15)}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <%--最近更新 end--%>
            <%--热点新闻 start--%>
            <div class="data_list " style="height: 300px; margin-top: 20px">
                <div class="dataHeader">热门新闻</div>
                <div class="datas">
                    <ul>
                        <c:forEach items="${clickNewsList}" var="news">
                            <li>
                                <a href="NewsServlet?action=queryOne&newsId=${news.newsId}" title="${news.title}">${fn:substring(news.title, 0, 15)}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <%--热点新闻 end--%>
    </div>
    <jsp:include page="commons/footer.jsp"></jsp:include>
</div>
</body>
</html>
