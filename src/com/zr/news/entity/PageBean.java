package com.zr.news.entity;

/**
 * @Acthor:孙琪; date:2019/3/18;
 */
public class PageBean {
    private int count;//条数
    private int pageIndex=1;//页面索引号  初始化第一页？
    private int pageCount;//每页条数

    //总页数
    public int getPages() {
        return (count+pageCount-1)/pageCount;
    }

    //每页开始索引号
    public int getIndex() {
        return (pageIndex-1)*pageCount;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
}
