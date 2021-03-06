package com.zr.news.service;

import com.zr.news.dao.NewsDao;
import com.zr.news.dao.daoImpl.NewsDaoImpl;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;
import com.zr.news.util.StringUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class NewsService {
    private NewsDao newsDao = new NewsDaoImpl();

    public List<News> findAll() {
        return newsDao.findAll();
    }

    public List<News> findImgNews() {
        return newsDao.findImgNews();
    }

    public News findHeadNews() {
        //return newsDao.findHeadNews();
        News headNews = newsDao.findHeadNews();
        String context = headNews.getContext();
        //html2Text把有标签的html转换成text
        String text = StringUtil.html2Text(context);
        //内容大于40字就截取
        if (text.length() >= 40) {
            text = text.substring(0, 40);
        }
        headNews.setContext(text);
        return headNews;
    }

    public List<News> findHotNews() {
        return newsDao.findHotNews();
    }

    public List<News> findNewNews() {
        return newsDao.findNewNews();
    }

    //分成几个类，每个类提取几条信息，所以嵌套
    public List<List<News>> findNewsByType() {
        List<List<News>> listsnewsLists = new ArrayList<>();
        //分类需要用到news和news_type共有的属性type_id
        NewsTypeService service = new NewsTypeService();
        List<NewsType> typeList = service.findAll();
        //遍历所有的类别
        for (NewsType newsType : typeList) {
            List<News> newsList = newsDao.findNewsByType(newsType.getTypeId());
            listsnewsLists.add(newsList);
        }
        return listsnewsLists;
    }

    public List<News> findClickNews(){
        return newsDao.findClickNews();
    }

    public List<News> findNewsListPage(int typeId, PageBean pageBean){
        List<News> newsList = newsDao.findNewsListByType(typeId,pageBean);
        return newsList;
    }

    public int findNewsCountByType(int typeId){
        return  newsDao.findNewsCountByType(typeId);
    }

    public News findNewsById(int id){
        newsDao.addClick(id);
        return newsDao.findNewsById(id);
    }

    public List<News> getNewsUpAndDown(int newsId){
        List<News> newsUpAndDownList =  new ArrayList<>();
        News upNews = newsDao.findUpNewsById(newsId);
        News downNews = newsDao.findDownNewsById(newsId);
        newsUpAndDownList.add(upNews);
        newsUpAndDownList.add(downNews);
        return newsUpAndDownList;
    }
}
