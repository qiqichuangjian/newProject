package com.zr.news.dao;

import com.zr.news.entity.Link;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public interface LinkDao {
    public List<Link> findAll();
    public int getCount();
    public List<Link> queryPageList(PageBean pageBean);
    public int addLink(Link link);
    public int deleteLink(int linkId);
    public int updateLink(Link link);
    public Link queryOne(int linkId);
}
