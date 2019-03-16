<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/11
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
    <div class="col-md-9">
        <!-- Carousel  start -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <c:forEach items="${imageNewsList}" var="image" varStatus="i">
                    <c:if test="${i.first}">
                        <div class="item active">
                            <a href="#">
                                <img src="newsImg/${image.imageUrl}"
                                     alt="${image.title}"
                                     title="${image.title}"/>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${!i.first}">
                        <div class="item ">
                            <a href="#">
                                <img src="newsImg/${image.imageUrl}"
                                     alt="${image.title}"
                                     title="${image.title}"/>
                            </a>
                        </div>
                    </c:if>

                </c:forEach>

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
        <div class="newsHeader_list">
            <%--头条新闻 start--%>
            <div class="newsHeader">
                <h3><a href="#?${headNews.newsId}" title="${headNews.title}">
                    ${fn:substring(headNews.title, 0, 8)}...

                </a></h3>
                <p>   ${fn:substring(headNews.context, 0, 40)}...
                    <a href="#?${headNews.newsId}">[查看全文]</a>
                </p>
            </div>
            <%--头条新闻 end--%>
                <%--最近更新  start--%>
            <div class="currentUpdate">
                <div class="currentUpdateHeader">最近更新</div>
                <div class="currentUpdateDatas">
                    <table width="100%">
                        <c:forEach items="${newNewsList}" var="newNews" varStatus="i">
                            <c:if test="${i.index%2==0}">
                                <tr>
                            </c:if>
                            <td width="50%">
                                <a href="#?${newNews.newsId}" title="${newNews.title}">${fn:substring(newNews.title, 0, 15)}</a>
                            </td>
                            <c:if test="">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <%--最近更新 end--%>
    </div>
    <%--热点新闻 start--%>
    <div class="col-md-3">
        <div class="data_list hotspot_news_list">
            <div class="dataHeader">热点新闻</div>
            <div class="datas">
                <ul>
                    <c:forEach items="${hotNewsList}" var="hotNews">
                        <li>
                            <a href="#?${hotNews.newsId}"
                               title="${hotNews.title}">${fn:substring(hotNews.title, 0, 15)}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%--热点新闻 end--%>
</div>