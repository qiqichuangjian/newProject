package com.zr.news.entity;

import java.util.Date;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class News {
    private int newsId;
    private String title;
    private String context;
    private String author;
    private int typeId;
    private Date pushDate;
    private int isImg;
    private String imageUrl;
    private int click;
    private int isHot;

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public Date getPushDate() {
        return pushDate;
    }

    public void setPushDate(Date pushDate) {
        this.pushDate = pushDate;
    }

    public int getIsImg() {
        return isImg;
    }

    public void setIsImg(int isImg) {
        this.isImg = isImg;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public News() {
    }

    public News(int newsId, String title, String context, String author, int typeId, Date pushDate, int isImg, String imageUrl, int click, int isHot) {
        this.newsId = newsId;
        this.title = title;
        this.context = context;
        this.author = author;
        this.typeId = typeId;
        this.pushDate = pushDate;
        this.isImg = isImg;
        this.imageUrl = imageUrl;
        this.click = click;
        this.isHot = isHot;
    }
}
