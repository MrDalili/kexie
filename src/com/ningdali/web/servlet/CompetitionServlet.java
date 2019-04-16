package com.ningdali.web.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;
import com.ningdali.service.CompetitionService;
import com.ningdali.service.serviceImp.CompetitionServiceImp;
import com.ningdali.utils.DateUtil;
import com.ningdali.utils.MyUtils;
import com.ningdali.utils.UUIDUtils;
import com.ningdali.utils.UploadUtils;
import com.ningdali.web.base.BaseServlet;
import com.sun.javaws.security.AppContextUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@WebServlet("/CompetitionServlet")
public class CompetitionServlet extends BaseServlet {

     CompetitionService competitionService =new CompetitionServiceImp();
     //查询比赛人信息，通过客户端传来的请求
    public void getMemberInfoOfCompetitionApply(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //设置请求编码格式
         req.setCharacterEncoding("utf-8");
         //设置相应编码格式
         resp.setCharacterEncoding("utf-8");
         resp.setContentType("application/json;charset=utf-8");
         //获取请求信息
         User user = (User) req.getSession().getAttribute("user");
         String id = req.getParameter("id");
         String name = req.getParameter("name");  //需要查询的人的人名
         String major = req.getParameter("major");
         String academy = req.getParameter("academy");
         String competitionName = req.getParameter("competitionName");

         //创建一个person类，将传入的数据放入即可
         Person person = new Person();
         person.setU_id(id);
         person.setU_name(name);
         person.setMajor(major);
         person.setAcademy(academy);
         person.setCompetitionName(competitionName);
         //调用业务层，查询满足以上条件的报名人员
         CompetitionService competitionService = new CompetitionServiceImp();
         //返回一个结果集
         List<Person> list = null;
         try {
             //调用方法通过传来的参数查询出所满足条件的报名的人的集合
              list = competitionService.getMemberInfoOfCompetitionApply(person,user);
              //获取到每个人所报名的比赛名称
              MyUtils.setCompetitionNameForPersonList(list);
         } catch (Exception e) {
              e.printStackTrace();
         }
         //将结果集转化为json格式发给前端
         Gson gson = new Gson();
         String msg = gson.toJson(list);
         resp.getWriter().write(msg);
    }

    //发布一个新的比赛--->向数据库中插入一条比赛
    //AddNewCompetition
//    public String AddNewCompetition(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//         //获取数据
//         User user = (User) req.getSession().getAttribute("user");
//         String cname = req.getParameter("competitionName");
//         String organizerName = req.getParameter("organizerName");
//         String startTime = req.getParameter("startTime");
//         String endTime = req.getParameter("endTime");
//         Date start = DateUtil.parseDate(startTime);
//         Date end = DateUtil.parseDate(endTime);
//         String competitionDescribe = req.getParameter("competitionDescribe");
//         double cost = Double.parseDouble(req.getParameter("cost"));
//         System.out.println("cost:"+cost);
//         String cid = UUIDUtils.getId();
//         //将数据放入类中，方便传递
//         Competition competition = new Competition();
//         competition.setCid(cid);
//         competition.setCname(cname);
//         competition.setcStartTime(start);
//         competition.setcEndTime(end);
//         competition.setCorganizer(organizerName);
//         competition.setCdescribe(competitionDescribe);
//         competition.setCcost(cost);
//         competition.setUser(user);
//         competition.setTotal(0);
//         competition.setCflag(1);
//         //调用业务层方法
//         CompetitionService competitionService = new CompetitionServiceImp();
//         competitionService.AddNewCompetition(competition,user);
//         //跟新user
//         user.getCompetitionList().add(competition);
//         req.getSession().setAttribute("user",user);
//         //页面转发到competitionList.jsp
//         return "admin/jsp/competitionList.jsp";
//    }

    public String AddNewCompetition(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //使用Map接受网页发来的消息
        Map<String,Object> map = new HashMap<String,Object>();
        //新建一个Comppetition用来接收数据
        Competition competition = new Competition();
        try {
            //利用request.getInputStream();请求实体中的全部数据，进行拆分以及封装
            DiskFileItemFactory df = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(df);
            List<FileItem>list = sfu.parseRequest(req);
            //遍历集合
            for (FileItem fileItem : list){
                //如果fileItem是普通项
                if (fileItem.isFormField()){
                    //将普通项上的键与值放进map中
                    if ("cStartTime".equals(fileItem.getFieldName())){
                        Date cStartTime = DateUtil.parseDate(fileItem.getString("utf-8"));
                        map.put("cStartTime",cStartTime);
                        continue;
                    }else if ("cEndTime".equals(fileItem.getFieldName())){
                        Date cEndTime = DateUtil.parseDate(fileItem.getString("utf-8"));
                        map.put("cEndTime",cEndTime);
                        continue;
                    }
                    map.put(fileItem.getFieldName(),fileItem.getString("utf-8"));
                }else {
                    //如果当前的File对象是上传项
                    //获取到原始的文件名
                    String oldFileName = fileItem.getName();
                    //获取到要保存的文件的名称
                    String newFileName = UploadUtils.getUUIDName(oldFileName);
                    //通过FileItem获取到输入流对象，通过输入流可以获取到图片二进制数据
                    InputStream is = fileItem.getInputStream();
                    //获取到当前项目下image下的真实路径
                    String realPath = getServletContext().getRealPath("/imageOfCompetition");
                    String dir = UploadUtils.getDir(newFileName);
                    String path = realPath+dir;
                    //内存中申明一个项目
                    File newDir = new File(path);
                    //查看该文件是否存在
                    if (!newDir.exists()){
                        newDir.mkdirs();
                    }
                    File finalFile = new File(newDir,newFileName);
                    if (!finalFile.exists()){
                        finalFile.createNewFile();
                    }
                    //建立和空文件的对应的输出流
                    OutputStream os = new FileOutputStream(finalFile);
                    //将输入流中的数据刷到输入流中
                    IOUtils.copy(is,os);
                    //释放资源
                    IOUtils.closeQuietly(is);
                    IOUtils.closeQuietly(os);
                    //项map中存入一个键值对的数据
                    map.put("cimage","/imageOfCompetition/"+dir+"/"+newFileName);
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        //数据遍历完了以后
        //利用beanButils将map中的数据填充到Compeition上
        BeanUtils.populate(competition,map);
        //将一些其他信息自己手动补全
        competition.setCid(UUIDUtils.getId());
        competition.setCflag(1);
        competition.setTotal(0);
        User user = (User) req.getSession().getAttribute("user");
        competition.setUser(user);
        //调用业务层增加比赛
        CompetitionService competitionService = new CompetitionServiceImp();
        competitionService.AddNewCompetition(competition,user);
        //跟新user
        user.getCompetitionList().add(competition);
        req.getSession().setAttribute("user",user);
        //页面转发到competitionList.jsp
         return "admin/jsp/competitionList.jsp";
    }
    //通过比赛id查询比赛详情
    //queryCompetitionDetails
    public void queryCompetitionDetails(HttpServletRequest req, HttpServletResponse resp) throws Exception {
         fun1(req,resp);
         //转发当该页面
         resp.getWriter().write("admin/jsp/competitionDetails.jsp");
    }
    //抽取了以下方法，看不惯黄线。。。强迫症
    private void fun1(HttpServletRequest req, HttpServletResponse resp){
         String cid = req.getParameter("cid");
         User user = (User) req.getSession().getAttribute("user");
         resp.setCharacterEncoding("utf-8");
         resp.setContentType("text/html;charset=utf-8");
         //调用业务层将该遍历user对象中competition，将其返回
         Competition competition= competitionService.getCompetitionByUserWithCid(user,cid);
         //将该competition放进session中
         req.getSession().removeAttribute("com");
         req.getSession().setAttribute("com",competition);
    }

    //queryCompetitionDetailsToUpdate
    public void queryCompetitionDetailsToUpdate(HttpServletRequest req, HttpServletResponse resp) throws Exception {
         fun1(req,resp);
         resp.getWriter().write("admin/jsp/updateCompetition.jsp");
    }

    //修改比赛属性
    //updateCompetitionDetails
     public void updateCompetitionDetails (HttpServletRequest req, HttpServletResponse resp) throws Exception {
         resp.setCharacterEncoding("utf-8");
         resp.setContentType("text/html;charset=utf-8");
         //获取修改后的数据
         String cid = req.getParameter("cid");
         String ccost = req.getParameter("ccost");
         String cdescribe = req.getParameter("cdescribe");
         String cEndTime = req.getParameter("cEndTime");
         String cStartTime = req.getParameter("cStartTime");
         String ccorganizer = req.getParameter("corganizer");
         Competition competition = MyUtils.getCompetitionById(cid);
         competition.setCcost(Double.parseDouble(ccost));
          Date start = DateUtil.parseDate(cStartTime);
          Date end = DateUtil.parseDate(cEndTime);
         competition.setcStartTime(start);
         competition.setcEndTime(end);
         competition.setCdescribe(cdescribe);
         competition.setCorganizer(ccorganizer);
         competition.setTotal(competitionService.getCompetitionMemberCount(competition));
         //调用业务层将该competition存入数据库，不同的地方修改即可
          competitionService.updateCompetition(competition);
          User user = (User) req.getSession().getAttribute("user");
          //更新user中的competitionList
          competitionService.updateCompetitionOfUser(user,competition);
          req.getSession().setAttribute("user",user);

          //告诉ajax转发页面
          resp.getWriter().write("competitionList.jsp");
     }
     //showPersonInfo
     //显示用户全部信息

    public void showPersonInfo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.getSession().setAttribute("uid",req.getParameter("uid"));
        req.getSession().setAttribute("uname",req.getParameter("uname"));
        req.getSession().setAttribute("umajor",req.getParameter("umajor"));
        req.getSession().setAttribute("uacademy",req.getParameter("uacademy"));
        req.getSession().setAttribute("ugrade",req.getParameter("ugrade"));
        req.getSession().setAttribute("usignUpTime",req.getParameter("usignUpTime"));
        req.getSession().setAttribute("uQQ",req.getParameter("uQQ"));
        req.getSession().setAttribute("utelephone",req.getParameter("utelephone"));
        req.getSession().setAttribute("udescribe",req.getParameter("udescribe"));
        resp.getWriter().write("admin/jsp/PersonInfo.jsp");
    }


}
