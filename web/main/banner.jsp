<%@ page import="com.zr.news.service.NewsService" %>
<%@ page import="com.zr.news.entity.News" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/11
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--第一行   开始--%>
<div class="row">
    <div class="col-md-9">
        <!-- Carousel  start -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <%
                    NewsService newsService = new NewsService();
                    List<News> imglist = newsService.findImgNews();
                    for (int i = 0; i < imglist.size(); i++) {
                        if (i == 0) {
                %>
                <div class="item active">
                    <a href="#<%=imglist.get(i).getNewsId()%>"><img
                            src="<%=request.getContextPath() %>/newsImg/<%=imglist.get(i).getImageUrl()%>"
                            alt="<%=imglist.get(i).getTitle()%>"
                            title="<%=imglist.get(i).getTitle()%>"></a>

                </div>
                <%
                } else {
                %>

                <div class="item">
                    <a href="#<%=imglist.get(i).getNewsId()%>"><img
                            src="<%=request.getContextPath() %>/newsImg/<%=imglist.get(i).getImageUrl()%>"
                            alt="<%=imglist.get(i).getTitle()%>"
                            title="<%=imglist.get(i).getTitle()%>"></a>

                </div>

                <%
                        }
                    }
                %>
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
            <%
                News headNews = newsService.findHeadNews();
            %>
            <div class="newsHeader">
                <h3><a href="#?<%=headNews.getNewsId()%>" title="<%=headNews.getTitle()%>">
                    <%=headNews.getTitle().length() >= 8 ? headNews.getTitle().substring(0, 8) + "..." : headNews.getTitle()%>
                </a></h3>
                <p><%=headNews.getContext()%>
                    <a href="#?<%=headNews.getNewsId()%>">[查看全文]</a>
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
                        <%
                            List<News> newNews = newsService.findNewNews();
                            for (int i = 0; i < newNews.size(); i++) {
                                String title = newNews.get(i).getTitle().length() >= 8 ? newNews.get(i).getTitle().substring(0, 8) + "..." : newNews.get(i).getTitle();
                                //01234...模为0时开始建表格
                                if (i % 2 == 0) {
                        %>
                        <tr>
                            <%
                                }
                            %>

                            <td width="50%">
                                <a href="#?<%=newNews.get(i).getNewsId()%>" title="<%=title %>"><%=title %>
                                </a>
                            </td>

                            <%
                                //模为1时结束表格
                                if (i % 2 == 1) {
                            %>
                        </tr>
                        <%
                                }
                            }
                        %>
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

                    <%
                        List<News> hotNews = newsService.findHotNews();
                        if (hotNews != null) {
                            for (News news : hotNews) {
                                String title = news.getTitle().length() >= 15 ? news.getTitle().substring(0, 15) + "..." : news.getTitle();
                    %>
                    <li>
                        <a href="#?<%=news.getNewsId()%>" title="<%=news.getTitle() %>"><%=title%>
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
    <%--热点新闻   结束--%>
</div>
<%--第一行   结束--%>

