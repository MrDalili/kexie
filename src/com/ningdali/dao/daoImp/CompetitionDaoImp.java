package com.ningdali.dao.daoImp;

import com.ningdali.dao.CompetitionDao;
import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;
import com.ningdali.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import sun.security.x509.CertificatePolicyMap;

import java.util.ArrayList;
import java.util.List;


public class CompetitionDaoImp implements CompetitionDao {
    QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
    @Override
    public int getCompetitionMemberCount(Competition competition) throws Exception {
        String sql = "select count(*) from person where competition =?";
        Long num =  (Long)queryRunner.query(sql,new ScalarHandler(),competition.getCid());
        return num.intValue();
    }

    //通过所给的比赛id获取数据库中比赛报名的人员信息
    @Override
    public List<Person> getCompetitionMember(Competition competition) throws Exception {
        String sql = "select * from person where competition = ?";
        return queryRunner.query(sql,new BeanListHandler<Person>(Person.class),competition.getCid());
    }

    //通过比赛id获取比赛名称
    @Override
    public Competition getCompetitionById(String cid) throws Exception {
        String sql = "select * from competition where cid = ?";
        return queryRunner.query(sql,new BeanHandler<Competition>(Competition.class),cid);
    }

    //多条件查询报名人的信息
    @Override
    public List<Person> getMemberInfoOfCompetitionApply(Person person, User user) throws Exception {
        String sql = "select * from person p,competition c where c.`cuser`= ? and p.`competition`=c.`cid` ";
        List list = new ArrayList();
        list.add(user.getAaccount());
        //获取到person中的属性然后判断其是否为空
        if (person.getAcademy() != null && !"".equals(person.getAcademy())){
            sql += " and p.`academy`=?";
            list.add(person.getAcademy());
        }
        if (person.getU_name() != null && !"".equals(person.getU_name())){
            sql +=" and p.`u_name`=?";
            list.add(person.getU_name());
        }
        if (person.getCompetition() != null && !"".equals(person.getCompetition())){
            sql +=" and p.`competition`=?";
            list.add(person.getCompetition());
        }
        if (person.getMajor() != null  && !"".equals(person.getMajor())){
            sql +=" and p`major`=?";
            list.add(person.getMajor());
        }
        if (person.getU_id() != null && !"".equals(person.getU_id())){
            sql +=" and p.`competition`=?";
            list.add(person.getU_id());
        }
        return queryRunner.query(sql,new BeanListHandler<Person>(Person.class),list.toArray());
    }

    //通过比赛名称取出competition对象
    @Override
    public Competition getCompetitionByCname(String cname) throws Exception {
        String sql = "select * from competition where cname=?";
        return queryRunner.query(sql,new BeanHandler<Competition>(Competition.class),cname);
    }

    //向数据库中插入一个比赛
    @Override
    public void AddNewCompetition(Competition competition, User user) throws Exception {
        String sql = "INSERT competition VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {competition.getCid(),competition.getCname(),user.getAaccount(),competition.getcStartTime(),
                competition.getCcost(),competition.getTotal(),competition.getcEndTime(),competition.getCflag(),
                competition.getCdescribe(),competition.getCorganizer(),competition.getCimage()};
        queryRunner.update(sql,params);
    }

    @Override
    public void updateCompetition(Competition competition) throws Exception {
        String sql = "update competition set cname=?,cStartTime=?,ccost=?,ctotal=?,cEndTime=?,cflag=?" +
                ",cdescribe=?,corganizer=? where cid=?";
        Object[] params = {competition.getCname(),competition.getcStartTime()
                ,competition.getCcost(),competition.getTotal(),competition.getcEndTime(),competition.getCflag(),
                competition.getCdescribe(),competition.getCorganizer(),competition.getCid()};
        queryRunner.update(sql,params);
    }

    @Override
    public List<Competition> getCompetitionList() throws Exception {
        String sql = "select * from competition";
        return queryRunner.query(sql,new BeanListHandler<Competition>(Competition.class));
    }


}
