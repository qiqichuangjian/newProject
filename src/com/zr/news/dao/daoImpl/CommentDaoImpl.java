package com.zr.news.dao.daoImpl;

import com.zr.news.dao.CommentDao;
import com.zr.news.entity.Comment;
import com.zr.news.framework.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/19;
 */
public class CommentDaoImpl implements CommentDao {
    private QueryRunner qr = new QueryRunner();
    @Override
    public int addComment(Comment comment) {
        String sql="insert into comment (news_id,content,ip_addr,comment_date) values(?,?,?,?)";
        Object[] objs = {comment.getNewsId(),comment.getContent(),comment.getIpAddr(),comment.getCommentDate()};
        try {
            return qr.update(JdbcUtils.getConnection(),sql, objs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Comment> queryByNewsId(int newsId) {
        String sql="select * from comment where news_id= ? order by comment_date desc ";
        try {
            //sql, new BeanListHandler<>(Comment.class), newsId???
            List<Comment> commentList = qr.query(JdbcUtils.getConnection(),sql, new BeanListHandler<>(Comment.class), newsId);
            return commentList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
