package com.zr.news.dao.daoImpl;

import com.zr.news.dao.NewsDao;
import com.zr.news.entity.News;
import com.zr.news.entity.PageBean;
import com.zr.news.framework.JdbcUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class NewsDaoImpl implements NewsDao {
    @Override
    public void addClick(int newsId) {
        String sql ="update news set click = click+1 where  news_id = ?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,newsId);
            int i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close();
        }
    }

    @Override
    public News findUpNewsById(int id) {
        String sql="select * from news where push_date>(select push_date from news where news_id=?)  " +
                "order by push_date DESC limit 1;\n";
        News news =  new News();
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPushDate(rs.getDate("push_date"));
                news.setIsImg(rs.getInt("is_img"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }

    @Override
    public News findDownNewsById(int id) {
        String sql="select * from news where push_date<(select push_date from news where news_id=?)  " +
                "order by push_date DESC limit 1;\n";
        News news =  new News();
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPushDate(rs.getDate("push_date"));
                news.setIsImg(rs.getInt("is_img"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }

    //通过id查询某条新闻
    @Override
    public News findNewsById(int id){
        String sql="select n.*,t.type_name from news n, news_type  t  " +
                "where n.type_id = t.type_id and news_id=?";
        News news =  new News();
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPushDate(rs.getDate("push_date"));
                news.setIsImg(rs.getInt("is_img"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
                news.setTypeName(rs.getString("type_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }


    //通过类别把此类别的所有新闻数目查询到
    @Override
    public int findNewsCountByType(int typeId) {
        String sql="select count(*)  count from news where type_id=?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,typeId);
            rs = ps.executeQuery();
            while (rs.next()){
                int count = rs.getInt("count");
                return  count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return 0;
    }


    //通过类型找到此类型的所有新闻，limit 页面索引号，每页条数
    @Override
    public List<News> findNewsListByType(int typeId, PageBean pageBean) {
        String sql="select * from news where type_id="+typeId+" " +
                "order by push_date desc limit "+pageBean.getIndex()+","+pageBean.getPageCount();
        return  getNewsList(sql);
    }

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
        return getNewsList(sql).get(0);//取第一个
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

    //预处理sql语句方便上面引用此方法？
    @Override
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
