package com.zr.news.util;

import com.zr.news.entity.NewsType;

/**
 * @Acthor:孙琪; date:2019/3/18;
 */
//路径导航
public class NavUtil {
    public static  String getNavNewsListByType(NewsType newsType){
        StringBuffer sb = new StringBuffer("<ul class=\"breadcrumb\">");
        sb.append("<li><a href=\"GoIndex\">主页</a></li>");
        sb.append("<li><a href=\"NewsServlet?action=query&typeId="+newsType.getTypeId()+"\">"+newsType.getTypeName()+"</a></li>");
        sb.append("</ul>");
        return sb.toString();
    }
    public static  String getNavNewsById(int typeId,String typeName,String title){
        StringBuffer sb = new StringBuffer("<ul class=\"breadcrumb\">");
        sb.append("<li><a href=\"goIndex\">主页</a></li>");
        sb.append("<li><a href=\"NewsServlet?action=query&typeId="+typeId+"\">"+typeName+"</a></li>");
        sb.append("<li class=\"active\">"+title+"</li>");
        sb.append("</ul>");
        return sb.toString();
    }
}
