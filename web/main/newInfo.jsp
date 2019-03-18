<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/3/18
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="data_list ">
    <div id="newsListNav">
        ${newsNav}
    </div>
    <div class="datas" >
        <h3 class="news_title" style="text-align: center;">${news.title}</h3>
        <div class="row news_info" style="text-align: center;">
            <div class="col-md-4">
                日期：【<fmt:formatDate value="${news.pushDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>】
            </div>
            <div class="col-md-4">
                作者：${news.author}
            </div>
            <div class="col-md-4">
                访问次数：[${news.click}]
            </div>
        </div>
        <div class="news_content" style="margin-top: 10px;margin-bottom: 20px; padding: 10px;">
            ${news.context}
        </div>
    </div>
    <div class="newsUpAndDown">
        ${newsUpAndDown}
    </div>
</div>