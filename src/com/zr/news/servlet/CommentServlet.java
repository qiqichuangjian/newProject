package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;
import com.zr.news.entity.Comment;
import com.zr.news.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


/**
 * @Acthor:孙琪; date:2019/3/19;
 */
@WebServlet(name = "CommentServlet",urlPatterns ="/CommentServlet")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");
        //System.out.println(action);控制台显示add方法就说明添加进去了
        if("add".equals(action)){
            String newsId = request.getParameter("newsId");
            String content = request.getParameter("content");
            String ipAddr = request.getRemoteAddr();
            Comment comment= new Comment(Integer.parseInt(newsId),content,ipAddr,new Date(System.currentTimeMillis()));
            CommentService commentService =  new CommentService();
            int i = commentService.addComment(comment);
            if(i>0){
                // 将对象转为json字符串
                String strjson = JSONObject.toJSONString(comment);
                response.getWriter().print(strjson);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
