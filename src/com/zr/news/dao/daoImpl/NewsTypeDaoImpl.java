package com.zr.news.dao.daoImpl;

import com.zr.news.dao.NewsTypeDao;
import com.zr.news.entity.NewsType;
import com.zr.news.framework.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class NewsTypeDaoImpl implements NewsTypeDao {
    private QueryRunner qr=new QueryRunner();
    @Override
    public List<NewsType> findAll() {
        String sql="select * from news_type";
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<NewsType> list=new ArrayList<>();
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                NewsType newsType=new NewsType();
                int typeId = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                newsType.setTypeId(typeId);
                newsType.setTypeName(typeName);
                list.add(newsType);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs!=null){
                    rs.close();
                }
                if (ps!=null){
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();

        }
        return list;
    }

    @Override
    public NewsType findTypeById(int id) {
        NewsType newsType =  new NewsType();
        String sql="select * from news_type where type_id=?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int typeId = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                newsType.setTypeId(typeId);
                newsType.setTypeName(typeName);
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
        return newsType;
    }

    @Override
    public int addNewsType(NewsType newsType) {
        String sql="insert into news_type(type_name) values(?)";
        try {
            int i = qr.update(JdbcUtils.getConnection(), sql, newsType.getTypeName());
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteNewsType(int id) {
        String sql="delete from news_type where type_id=?";
        try {
            int i = qr.update(JdbcUtils.getConnection(), sql, id);
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateNewsType(NewsType newsType) {
        String sql="update news_type set type_name where type_id=?";
        try {
            int i = qr.update(JdbcUtils.getConnection(), sql, newsType.getTypeName(),newsType.getTypeId());
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public NewsType queryOne(int id) {
        return null;
    }
}
