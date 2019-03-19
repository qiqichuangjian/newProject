package com.zr.news.entity;

import java.util.Date;

/**
 * @Acthor:孙琪; date:2019/3/19;
 */
public class Comment {
    private int cId;
    private int newsId;
    private String content;
    private String ipAddr;
    private Date commentDate;


    public Comment(int newsId, String content, String ipAddr, Date commentDate) {
        this.newsId = newsId;
        this.content = content;
        this.ipAddr = ipAddr;
        this.commentDate = commentDate;
    }
    public Comment() {
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }


}
