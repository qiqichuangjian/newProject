package com.zr.news.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.NewsDao;
import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoImpl.NewsDaoImpl;
import com.zr.news.dao.daoImpl.NewsTypeDaoImpl;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.ResultCode;
import com.zr.news.service.NewsTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/21;
 */
@WebServlet(name = "NewsTypeServlet", urlPatterns = "/NewsTypeServlet")
public class NewsTypeServlet extends HttpServlet {
    NewsTypeService ntservice=new NewsTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //防止乱码
        request.setCharacterEncoding("utf-8");
        response.setContentType("type/html;charset=utf-8");

        String action = request.getParameter("action");
        if("query".equals(action)){
            query(request, response);
        }else if("add".equals(action)){
            add(request, response);
        }else if("update".equals(action)){
            update(request, response);
        }else if("delete".equals(action)){
            delete(request, response);
        }else if("deleteAll".equals(action)){
            deleteAll(request, response);
        }else if("queryOne".equals(action)){
            queryOne(request, response);
        }
    }
    protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NewsType> typeList=ntservice.findAll();
        JSONArray jsonArray = (JSONArray)JSONArray.toJSON(typeList);
        JSONObject array = new JSONObject();
        array.put("code",0);
        array.put("msg","");
        array.put("count",typeList.size());
        array.put("data",jsonArray);
        response.getWriter().print(array);




    }
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
        int id = Integer.parseInt(typeId);
        NewsDao ndao=new NewsDaoImpl();
        int newsCount = ndao.findNewsCountByType(id);
        ResultCode resultCode = new ResultCode();
        if(newsCount==0){
            NewsTypeDao ntdao=new NewsTypeDaoImpl();
            int i = ntdao.deleteNewsType(id);
            if(i>0){
                resultCode.setCode("2001");
                resultCode.setMessage("新闻类型删除成功");
            }else{
                resultCode.setCode("2002");
                resultCode.setMessage("新闻类型已删除或不存在");
            }
        }else{
            resultCode.setCode("2003");
            resultCode.setMessage("新闻类型下有新闻不可删除");
        }
        String json = JSONObject.toJSONString(resultCode);
        response.getWriter().print(json);


    }
    protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void queryOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
