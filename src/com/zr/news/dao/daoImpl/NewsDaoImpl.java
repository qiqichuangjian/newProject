package com.zr.news.dao.daoImpl;

import com.zr.news.dao.NewsDao;
import com.zr.news.entity.News;
import com.zr.news.framework.JdbcUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class NewsDaoImpl implements NewsDao {

    @Override
    public List<News> findNewsByType(int typeId) {
        //每个类别的新闻都提取8条
        String sql = "select * from news where type_id=" + typeId + " order by push_date desc limit 0,8";
        return getNewsList(sql);
    }

    @Override
    public List<News> findAll() {
        String sql = "select * from news";
        return getNewsList(sql);
    }


    @Override
    public List<News> findImgNews() {
        String sql = "select * from news where is_img=1 order by push_date desc limit 0,4";
        return getNewsList(sql);
    }

    @Override
    public News findHeadNews() {
        String sql = "select * from news order by push_date desc";
        return getNewsList(sql).get(0);
    }

    @Override
    public List<News> findHotNews() {
        String sql = "select * from news where is_hot=1 order by push_date desc limit 0,8";
        return getNewsList(sql);
    }

    @Override
    public List<News> findNewNews() {
        String sql = "select * from news order by push_date desc limit 0,8";
        return getNewsList(sql);
    }

    @Override
    public List<News> findClickNews() {
        String sql = "select * from news order by click desc limit 0,8";
        return getNewsList(sql);
    }

    public List<News> getNewsList(String sql) {
        List<News> newslist = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News();
                int newsId = rs.getInt("news_id");
                String title = rs.getString("title");
                String context = rs.getString("context");
                String author = rs.getString("author");
                int typeId = rs.getInt("type_id");
                Date pushDate = rs.getDate("push_date");
                int isImg = rs.getInt("is_img");
                String imageUrl = rs.getString("image_url");
                int click = rs.getInt("click");
                int isHot = rs.getInt("is_hot");
                news.setNewsId(newsId);
                news.setTitle(title);
                news.setContext(context);
                news.setAuthor(author);
                news.setTypeId(typeId);
                news.setPushDate(pushDate);
                news.setIsImg(isImg);
                news.setImageUrl(imageUrl);
                news.setClick(click);
                news.setIsHot(isHot);
                newslist.add(news);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return newslist;
    }

}
