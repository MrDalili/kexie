package com.ningdali.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("666");
        fun1();
    }

    public String fun1(){
        return "123";
    }

    @Override
    public void init() throws ServletException {
        System.out.println("page");
    }
}
