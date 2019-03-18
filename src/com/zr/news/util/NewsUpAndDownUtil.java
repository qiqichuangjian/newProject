package com.zr.news.util;

import com.zr.news.entity.News;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/18;
 */
public class NewsUpAndDownUtil {
    public static String getUpAndDown(List<News> list) {
        StringBuffer sb = new StringBuffer("<ul>");
        //数组里只有两个元素，0，1；0代表上一条，1代表下一条
        News upNews = list.get(0);
        News downNews = list.get(1);
        //id从1开始，0代表没有id了
        if(upNews.getNewsId()==0){
            sb.append("<li>上一条: 到顶了</li>");
        }else {
            sb.append("<li>上一条: <a href='NewsServlet?action=queryOne&newsId=" + upNews.getNewsId() + "'>" + upNews.getTitle() + "</a></li>");
        }
        if(downNews.getNewsId()==0){
            sb.append("<li>下一条: 到底了</li>");
        }else {
            sb.append("<li>下一条: <a href='NewsServlet?action=queryOne&newsId=" + downNews.getNewsId() + "'>" + downNews.getTitle() + "</a></li>");
        }
        sb.append("</ul>");
        return sb.toString();
    }
}
