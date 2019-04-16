package com.ningdali.web.Filter;

import com.ningdali.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter" ,urlPatterns="/admin/jsp/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //使用强行转换，获取session
        HttpServletRequest httpRequest = (HttpServletRequest)req;
        User user = (User) httpRequest.getSession().getAttribute("user");
        //判断用户是否登陆
        if (user == null){
            System.out.println("拦截啦");
            //将页面转发至登陆页面
            req.setAttribute("msg","请先登陆哦");
            httpRequest.getRequestDispatcher("/admin/login.jsp").forward(req,resp);
        }
        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
