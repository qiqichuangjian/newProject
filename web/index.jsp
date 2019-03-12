<%@ page import="com.zr.news.entity.News" %>
<%@ page import="com.zr.news.entity.NewsType" %>
<%@ page import="com.zr.news.service.NewsService" %>
<%@ page import="com.zr.news.service.NewsTypeService" %>
<%@ page import="com.zr.news.util.DateUtil" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/8
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<div class="container">
    <%--  动态引入文件  --%>
    <jsp:include page="main/commons/header.jsp"></jsp:include>
    <jsp:include page="main/banner.jsp"></jsp:include>
    <%--第二行   开始--%>
    <%
        //分类需要用到news和news_type共有的属性type_id
        NewsService newsService = new NewsService();
        NewsTypeService newsTypeService = new NewsTypeService();
        List<NewsType> typeList = newsTypeService.findAll();
        List<List<News>> newsByType = newsService.findNewsByType();
        for (int i = 0; i < newsByType.size(); i++) {
            // 行开始
            if (i % 3 == 0) {
    %>
    <div class="row">
        <%
            }
        %>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader"><%=typeList.get(i).getTypeName()%><span class="more"><a
                        href="#?<%=typeList.get(i).getTypeId()%>">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <%
                            List<News> newsList = newsByType.get(i);
                            if (newsList.get(0).getTypeId() == typeList.get(i).getTypeId()) {
                                for (News news : newsList) {
                                    String date = DateUtil.formatDate(news.getPushDate(), "yyyy-MM-dd");
                                    String title = news.getTitle().length() >= 10 ? news.getTitle().substring(0, 10) + "..." : news.getTitle();
                        %>
                        <li>
                            <a href="#?<%=news.getNewsId()%>" title="<%=news.getTitle() %>">[<%=date %>
                                ]&nbsp; <%=title%>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>

        <%
            // 行结束
            if (i % 3 == 2 || i == newsByType.size() - 1) {
        %>
    </div>
    <%
            }
        }
    %>
    <%--第二行   结束--%>
    <jsp:include page="main/commons/link.jsp"></jsp:include>
    <jsp:include page="main/commons/footer.jsp"></jsp:include>
</div>
</body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
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
