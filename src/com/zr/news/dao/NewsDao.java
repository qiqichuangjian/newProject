package com.zr.news.dao;

import com.zr.news.entity.News;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public interface NewsDao {
    public List<News> findNewsByType(int typeId);
    public List<News> findAll();
    public List<News> findImgNews();
    public News findHeadNews();
    public List<News> findHotNews();
    public List<News> findNewNews();
    public List<News> findClickNews();


}
