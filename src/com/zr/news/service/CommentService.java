package com.zr.news.service;

import com.zr.news.dao.CommentDao;
import com.zr.news.dao.daoImpl.CommentDaoImpl;
import com.zr.news.entity.Comment;

/**
 * @Acthor:孙琪; date:2019/3/19;
 */
public class CommentService {
    private CommentDao cdao =new CommentDaoImpl();
    public int addComment(Comment comment){
        return cdao.addComment(comment);
    }
//    public List<Comment> queryByNewsId(int newsId) {
//        return cdao.queryByNewsId(newsId);
//    }
}
