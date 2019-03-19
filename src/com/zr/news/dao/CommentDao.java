package com.zr.news.dao;

import com.zr.news.entity.Comment;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/19;
 */
public interface CommentDao {
    public int addComment(Comment comment);

    public List<Comment> queryByNewsId(int newsId);
}

