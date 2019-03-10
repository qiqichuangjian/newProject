<%--
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
    <%--第一行   开始--%>
    <div class="row">
        <div class="col-md-9">
            <!-- Carousel  start -->
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <a href="#1"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/1.jpg"
                                          alt="First slide"
                                          title="标题 1"></a>
                        <div class="text-caption">标题 1</div>
                    </div>
                    <div class="item">
                        <a href="#2"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/2.jpg"
                                          alt="Second slide"
                                          title="标题 2"></a>
                        <div class="text-caption">标题 2</div>
                    </div>
                    <div class="item">
                        <a href="#3"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/3.jpg"
                                          alt="Third slide"
                                          title="标题 3"></a>
                        <div class="text-caption">标题 3</div>
                    </div>
                    <div class="item">
                        <a href="#4"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/4.jpg"
                                          alt="Third slide"
                                          title="标题 4"></a>
                        <div class="text-caption">标题 4</div>
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Carousel  end -->
            <%--今日头条   开始--%>
            <div class="newsHeader_list">
                <div class="newsHeader">
                    <h3><a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便</a></h3>
                    <p>;　中新网月日电据香港《文汇报》报道，香港牛头角彩盈鸷发生店铺盗窃案，名少年男女...
                        <a href="news?action=show&newsId=104">[查看全文]</a>
                    </p>
                </div>
                <div class="currentUpdate">
                    <div class="currentUpdateHeader">最近更新</div>
                    <div class="currentUpdateDatas">
                        <table width="100%">
                            <tr>
                                <td width="50%">
                                    <a href="news?action=show&newsId=105" title="吊">吊</a>
                                </td>
                                <td width="50%">
                                    <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店</a>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <a href="news?action=show&newsId=103"
                                       title="昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥">昆明火车站暴恐案直击:暴</a>
                                </td>
                                <td width="50%">
                                    <a href="news?action=show&newsId=102" title="西安幼儿园被指近3年都给孩子吃过药">西安幼儿园被指近3年都给</a>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <a href="news?action=show&newsId=94" title="小道新闻1">小道新闻1</a>
                                </td>
                                <td width="50%">
                                    <a href="news?action=show&newsId=95" title="小道新闻5">小道新闻5</a>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <a href="news?action=show&newsId=96" title="小道新闻5">小道新闻5</a>
                                </td>
                                <td width="50%">
                                    <a href="news?action=show&newsId=97" title="小道新闻5">小道新闻5</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <%--今日头条   结束--%>
        </div>
        <%--热点新闻   开始--%>
        <div class="col-md-3">
            <div class="data_list hotspot_news_list">
                <div class="dataHeader">热点新闻</div>
                <div class="datas">
                    <ul>
                        <li>
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=103" title="昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥">昆明火车站暴恐案直击:暴徒见人</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=102" title="西安幼儿园被指近3年都给孩子吃过药">西安幼儿园被指近3年都给孩子吃</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=52" title="娱乐新闻1">娱乐新闻1</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=51" title="马来西亚巫师作法再寻失联飞机：这次更奇葩">马来西亚巫师作法再寻失联飞机：</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=50" title="汪峰是互联网上名副其实的King">汪峰是互联网上名副其实的Kin</a>
                        </li>
                        <li>
                            <a href="news?action=show&newsId=49" title="2133啊">2133啊</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--热点新闻   结束--%>
    </div>
    <%--第一行   结束--%>
    <%--第二行   开始--%>
    <div class="row">
        <%--分类1 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">娱乐新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类1 结束--%>
        <%--分类2 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">政治新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类2 结束--%>
        <%--分类3 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">经济新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类3 结束--%>
    </div>
    <%--第二行   结束--%>
    <%--第三行   开始--%>
    <div class="row">
        <%--分类4 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">文化新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类4 结束--%>
        <%--分类5 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">小道新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类5 结束--%>
        <%--分类6 开始--%>
        <div class="col-md-4">
            <div class="data_list news_list">
                <div class="dataHeader">军事新闻<span class="more"><a href="news?action=list&typeId=1">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>
                        <li>03-14&nbsp;
                            <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食被捕2</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=64" title="娱乐新闻3">娱乐新闻3</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=65" title="娱乐新闻4">娱乐新闻4</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=66" title="娱乐新闻5">娱乐新闻5</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=67" title="娱乐新闻6">娱乐新闻6</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=68" title="娱乐新闻7">娱乐新闻7</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=69" title="娱乐新闻8">娱乐新闻8</a>
                        </li>
                        <li>03-13&nbsp;
                            <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--分类6 结束--%>
    </div>
    <%--第三行   结束--%>
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
