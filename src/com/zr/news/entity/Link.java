package com.zr.news.entity;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class Link {
    private int linkId;
    private String linkName;
    private String linkUrl;
    private String email;
    private int linkOrder;

    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public int getLinkOrder() {
        return linkOrder;
    }

    public void setLinkOrder(int linkOrder) {
        this.linkOrder = linkOrder;
    }

    public Link() {
    }

    public Link(int linkId, String linkName, String linkUrl,String email, int linkOrder) {
        this.linkId = linkId;
        this.linkName = linkName;
        this.linkUrl = linkUrl;
        this.email = email;
        this.linkOrder = linkOrder;
    }
    public Link( String linkName,  String linkUrl,String email, int linkOrder) {
        this.linkName = linkName;
        this.linkUrl = linkUrl;
        this.email = email;
        this.linkOrder = linkOrder;
    }
}
