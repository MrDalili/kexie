package com.ningdali.web.servlet;

import com.ningdali.domain.Competition;
import com.ningdali.domain.User;
import com.ningdali.service.AdminInfoService;
import com.ningdali.service.CompetitionService;
import com.ningdali.service.serviceImp.AdminInfoServiceImp;
import com.ningdali.service.serviceImp.CompetitionServiceImp;
import com.ningdali.utils.MyUtils;
import com.ningdali.web.base.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/AdminInfoServlet")
public class AdminInfoServlet extends BaseServlet {
    AdminInfoService adminInfoService = new AdminInfoServiceImp();
    CompetitionService competitionService = new CompetitionServiceImp();
    public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //获取登陆页面传输的账号密码
        String account = req.getParameter("account");
        String key = req.getParameter("password");
        //创建一个实体对象，将账号密码放入对象中
        User user = new User();
        user.setAaccount(account);
        user.setApassword(key);
        //调用业务层判断账号密码是否正确
        User user1 = adminInfoService.login(user);
        //判断user1其他属性是否为空，如果为空那么账号密码错误，给登陆的人账号或密码错误的提示信息
        if (user1 == null){
            req.setAttribute("msg","账号或密码错误，请重新输入");
            //请求转发至当前页面，显示该信息
            return "admin/login.jsp";
        }
        user1.setAaccount(account);
        //调用业务层获取到该用户发布的活动
        //返回一个list集合
        List<Competition> list = adminInfoService.queryAdminInfoByAaccount(user1);
        //调用业务层方法将list中的所有比赛中的比赛人数记录放进去
        competitionService.setCompetitionTotalOfList(list);
        //将对应的比赛目录与user关联
        user1.setCompetitionList(list);
        //调用业务层获取该user下的比赛中的报名人信息
        competitionService.getCompetitionMember(user1);
        //将总发布比赛个数与总报名人数放入user中
        adminInfoService.setMemberCount(user1);
        //获取该用户所发布比赛中报名人员所报名的比赛名称
        MyUtils.setCompetitionNameForPersonOfUser(user1);
        //将用户信息存入session中以方便后去管理
        req.getSession().setAttribute("user",user1);
        //转发到admin/home.jsp
        return "admin/jsp/welcome.jsp";

    }
    //查询所发布的比赛
    //queryCompetitionInfoByAaccount
    public String queryCompetitionInfoByAaccount(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //获取到数据转发到这个界面
        return "admin/jsp/competitionList.jsp";
    }

    //查询发布比赛中的报名人员信息
    //queryMemberOfCid
    public String queryMemberOfCid(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //转发到响应的页面
        return "admin/jsp/CompetitionInfo.jsp";
    }

    //个人信息页面
    //queryMemberOfCid
    public String queryAdminInfo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //转发到响应的页面
        return "admin/jsp/AdminInfo.jsp";
    }
    //注销
    public String signOut(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //消除session
        req.getSession().invalidate();
        //转发到登陆页面
        return "admin/login.jsp";

    }
    //跳转到主页
    //method=goHomePage
    public String goHomePage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //转发到主页面
        return "admin/jsp/welcome.jsp";
    }

    @Override
    public void init() throws ServletException {
        System.out.println("admin");
    }
}
