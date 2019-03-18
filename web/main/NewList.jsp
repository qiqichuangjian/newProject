<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/18
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="data_list ">
<div id="newsListNav">
    ${newsListNav}
</div>
    <div class="datas type_news_list">
        <ul>
            <c:forEach items="${newsList}" var="news">
                <li>
                    <a href="#?${news.newsId}" title="${news.title}">
                        [ <fmt:formatDate value="${news.pushDate}" pattern="yyyy-MM-dd"/> ]&nbsp;
                            ${fn:substring(news.title, 0, 15)}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="newListPage">
    ${newListPager}
</div>