package com.ningdali.web.servlet;

import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.service.CompetitionService;
import com.ningdali.service.SignUpService;
import com.ningdali.service.serviceImp.CompetitionServiceImp;
import com.ningdali.service.serviceImp.SignUpServiceImp;
import com.ningdali.utils.MyUtils;
import com.ningdali.web.base.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/SignUp")
public class SignUpServlet extends BaseServlet {

    public String apply(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //设置请求编码格式
        req.setCharacterEncoding("utf-8");
        //设置相应编码格式
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/xml;charset=utf-8");
        String cid = req.getParameter("cid");
        Competition competition = MyUtils.getCompetitionById(cid);
        //如果url正确
        if (competition != null){
            req.setAttribute("cid",cid);
            req.setAttribute("cname",competition.getCname());
            req.setAttribute("cimage",competition.getCimage());
            return "apply.jsp";
        }
        //url无效则跳转到失败界面
            return "admin/pages/samples/error-404.html";
    }
    //报名指定的比赛
    public String signUp(HttpServletRequest req,HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("utf-8");
        //设置相应编码格式
        resp.setContentType("text/html;charset=utf-8");
        //从request中取出数据
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String major = req.getParameter("major");
        String academy = req.getParameter("academy");
        String QQ = req.getParameter("QQ");
        String telephone= req.getParameter("telephone");
        String cid = req.getParameter("cid");
        //将去除数据放入对象中进行传输
        Person person = new Person();
        person.setU_id(id);
        person.setU_name(name);
        person.setAcademy(academy);
        person.setMajor(major);
        person.setQQ(QQ);
        person.setTelephone(telephone);
        person.setSignUpTime(new Date());
        person.setCompetition(cid);
        SignUpService signUpService = new SignUpServiceImp();
        try {
            signUpService.signUp(person);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("出错了!");
            req.setAttribute("flag",2);
            req.getRequestDispatcher("apply.jsp").forward(req,resp);
            return  null;
        }
        System.out.println("成功了！");
        req.setAttribute("flag",1);
        req.getRequestDispatcher("apply.jsp").forward(req,resp);
        return  null;
    }

    //转发到指定页面competition
    public String competition(HttpServletRequest req,HttpServletResponse resp) throws Exception {
        //从数据库中查询总共的比赛
        CompetitionService competitionService = new CompetitionServiceImp();
        List<Competition> list = competitionService.getCompetitionList();
        //将比赛放进session中
        req.getSession().setAttribute("list",list);
        return "Competition.jsp";
    }
}
