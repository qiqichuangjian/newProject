package com.zr.news.servlet;

import com.zr.news.dao.CommentDao;
import com.zr.news.dao.daoImpl.CommentDaoImpl;
import com.zr.news.entity.Comment;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;
import com.zr.news.service.NewsService;
import com.zr.news.service.NewsTypeService;
import com.zr.news.util.NavUtil;
import com.zr.news.util.NewsUpAndDownUtil;
import com.zr.news.util.PageUtil;
import com.zr.news.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/16;
 */
@WebServlet(name = "NewsServlet",urlPatterns = "/NewsServlet",initParams ={@WebInitParam(name="pageCount",value="10")})
public class NewsServlet extends HttpServlet {

    private NewsService newsService = new NewsService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if("query".equals(action)){
            query(request, response);
        }else if("queryOne".equals(action)){
            String newsId = request.getParameter("newsId");
            News news = newsService.findNewsById(Integer.parseInt(newsId));
            request.setAttribute("news",news);
            // 导航栏
            String newsNav = NavUtil.getNavNewsById(news.getTypeId(), news.getTypeName(), news.getTitle());
            request.setAttribute("newsNav",newsNav);
            List<News> newsUpAndDown = newsService.getNewsUpAndDown(Integer.parseInt(newsId));
            String upAndDown = NewsUpAndDownUtil.getUpAndDown(newsUpAndDown);
            request.setAttribute("newsUpAndDown",upAndDown);
//            CommentService commentService = new CommentService();
//            List<Comment> commentList = commentService.queryByNewsId(Integer.parseInt(newsId));
//            request.setAttribute("commentList",commentList);
            CommentDao dao = new CommentDaoImpl();
            List<Comment> commentList = dao.queryByNewsId(Integer.parseInt(newsId));
            request.setAttribute("commentList",commentList);
            request.setAttribute("mainJsp","newInfo.jsp");
            request.getRequestDispatcher(request.getContextPath()+"main/NewsModel.jsp").forward(request,response);
        }
    }

    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
        String pageIndex = request.getParameter("pageIndex");
        PageBean pageBean =  new PageBean();
        if(!StringUtil.isEmpty(pageIndex)){
            pageBean.setPageIndex(Integer.parseInt(pageIndex));
        }
        String pageCount = getInitParameter("pageCount");
        pageBean.setPageCount(Integer.parseInt(pageCount));

        //通过类别把此类别的所有新闻查询到
        pageBean.setCount(newsService.findNewsCountByType(Integer.parseInt(typeId)));
        List<News> newsList = newsService.findNewsListPage(Integer.parseInt(typeId), pageBean);
        request.setAttribute("newsList",newsList);

        NewsTypeService typeService =  new NewsTypeService();
        NewsType newsType = typeService.findTypeById(Integer.parseInt(typeId));
        //导航栏
        String newsListNav = NavUtil.getNavNewsListByType(newsType);
        request.setAttribute("newsListNav",newsListNav);
        //分页
        String newListPager= PageUtil.getPager(Integer.parseInt(typeId),pageBean);
        request.setAttribute("newListPager",newListPager);
        request.setAttribute("mainJsp","NewList.jsp");
        request.getRequestDispatcher(request.getContextPath()+"main/NewsModel.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
