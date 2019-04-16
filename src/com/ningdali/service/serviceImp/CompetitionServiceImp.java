package com.ningdali.service.serviceImp;

import com.ningdali.dao.CompetitionDao;
import com.ningdali.dao.daoImp.CompetitionDaoImp;
import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;
import com.ningdali.service.CompetitionService;
import com.ningdali.utils.JDBCUtils;
import com.ningdali.utils.MyUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class CompetitionServiceImp implements CompetitionService {
    CompetitionDao competitionDao = new CompetitionDaoImp();
    //获取该比赛的报名报名人数
    @Override
    public int getCompetitionMemberCount(Competition competition) throws Exception {
        return competitionDao.getCompetitionMemberCount(competition);
    }

    @Test
    public void fun1() throws Exception {
        Competition competition = new Competition();
        competition.setCid("2");

    }
    //将每个比赛中比赛人数查出放进去
    @Override
    public void setCompetitionTotalOfList(List<Competition> list) throws Exception {

        for (Competition competition : list){
            competition.setTotal(getCompetitionMemberCount(competition));

        }
    }

    //将user中的比赛集合中的报名人信息加入到user中
    @Override
    public void getCompetitionMember(User user) throws Exception {
        //获取user中的比赛链表
        List<Competition> list = user.getCompetitionList();

        //判断该人是否有发布比赛
        if (list == null){
            return;
        }
        //将每一个比赛取出，查询其中的报名人数，放进数组中
        for (Competition competition : list){
            competition.setPersonList(competitionDao.getCompetitionMember(competition));

        }

    }

    //获取报名人信息
    @Override
    public List<Person> getMemberInfoOfCompetitionApply(Person person ,User user) throws Exception {

        if (person.getCompetitionName() != null && !"".equals(person.getCompetitionName())){
            Competition competition = MyUtils.getCompetitionByCname(person.getCompetitionName());
            person.setCompetition(competition.getCid());
        }
        return competitionDao.getMemberInfoOfCompetitionApply(person,user);

    }

    //添加一个新的活动
    @Override
    public void AddNewCompetition(Competition competition, User user) throws Exception {
        competitionDao.AddNewCompetition(competition,user);
    }

    //遍历user对象中的competition，查看是否有cid与user中的相等，将其取出返回至客户端
    @Override
    public Competition getCompetitionByUserWithCid(User user, String cid) {
        List<Competition> list = user.getCompetitionList();

        //遍历该user对象中的competition即可
        for (Competition competition : list){
            if (competition.getCid().equals(cid)){
                return competition;
            }
        }
        System.out.println("没有这个比赛");
        return null;
    }

    //修改比赛内容
    @Override
    public void updateCompetition(Competition competition) throws Exception {
        competitionDao.updateCompetition(competition);
    }

    //更新user中的比赛信息
    @Override
    public void updateCompetitionOfUser(User user, Competition competition)  throws Exception {
        //获取到该user中的比赛集合
        List<Competition> list = user.getCompetitionList();
        CopyOnWriteArrayList<Competition> list1 = new CopyOnWriteArrayList<>();
        List<Competition> list2 = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            list1.add(list.get(i));
        }

        for (int i = 0; i < list1.size(); i++) {
            if (list1.get(i).getCid().equals(competition.getCid())){
                list1.remove(i);
                list1.add(competition);
            }
        }

        for (int i = 0; i < list1.size(); i++) {
            list2.add(list1.get(i));
        }
        user.setCompetitionList(list2);

    }

    @Override
    public List<Competition> getCompetitionList() throws Exception {
        return competitionDao.getCompetitionList();
    }


}
