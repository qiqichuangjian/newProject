package com.zr.news.service;

import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoImpl.NewsTypeDaoImpl;
import com.zr.news.entity.NewsType;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class NewsTypeService {
    private NewsTypeDao ntdao=new NewsTypeDaoImpl();
    public List<NewsType> findAll(){
        return ntdao.findAll();
    }
    public NewsType findTypeById(int typeId){
        return  ntdao.findTypeById(typeId);
    }
}
