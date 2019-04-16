package com.ningdali.utils;

import com.ningdali.dao.CompetitionDao;
import com.ningdali.dao.daoImp.CompetitionDaoImp;
import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;
import com.ningdali.service.CompetitionService;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;

public class MyUtils {
    public static Competition  getCompetitionById(String cid) throws Exception {

        //通过查询将该比赛的名称取出
        CompetitionDao competitionDao = new CompetitionDaoImp();
        Competition competition = competitionDao.getCompetitionById(cid);
        return competition;
    }

    //传进来一个List<Person> list，遍历list用conpetition属性拿出比赛名称
    public static void setCompetitionNameForPersonList(List<Person> list) throws Exception {
        for (Person person:list){
            setCompetitionNameForPerson(person);
        }
    }
    //通过person中的competition属性获取到该competition的名字
    public static void setCompetitionNameForPerson(Person person) throws Exception {
        //获取到person中的competition的id
        String cid = person.getCompetition();
        //通过工具类取出id=cid的比赛类
        Competition competition = getCompetitionById(cid);
        //将competition的名字添加给该person
        person.setCompetitionName(competition.getCname());
    }

    //传入一个user将其中的所发布的比赛中所报名的人的比赛名称设置
    public static void setCompetitionNameForPersonOfUser(User user) throws Exception {
        //获取该user中的比赛集合
        List<Competition> list = user.getCompetitionList();
        for(Competition competition : list){
            //获取比赛中的报名人员集合
            List<Person> personList = competition.getPersonList();
            for (Person person : personList){
                //调用方法将每个per都赋予比赛名称
                setCompetitionNameForPerson(person);
            }
        }
    }

    //通过比赛名称取出比赛类
    public static Competition getCompetitionByCname(String cname) throws Exception{
        CompetitionDao competitionDao = new CompetitionDaoImp();
        return competitionDao.getCompetitionByCname(cname);
    }

}
