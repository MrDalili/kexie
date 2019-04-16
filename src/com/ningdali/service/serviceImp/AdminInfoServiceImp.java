package com.ningdali.service.serviceImp;

import com.ningdali.dao.AdminInfoDao;
import com.ningdali.dao.daoImp.AdminInfoDaoImp;
import com.ningdali.domain.Competition;
import com.ningdali.domain.User;
import com.ningdali.service.AdminInfoService;

import java.util.List;

public class AdminInfoServiceImp implements AdminInfoService {
    AdminInfoDao adminInfoDao = new AdminInfoDaoImp();
    @Override
    public User login(User user) throws Exception {

        return adminInfoDao.login(user);
    }

    @Override
    public List<Competition> queryAdminInfoByAaccount(User user) throws Exception {

        return adminInfoDao.queryAdminInfoByAaccount(user);

    }
    //添加user的总共发布的比赛个数，以及所办的比赛一共有多少人报名
    public void setMemberCount(User user){
        List<Competition> list = user.getCompetitionList();
        int count = 0;
        int num = 0;
        for (Competition competition: list){
            count += competition.getTotal();
            num++;
        }
        user.setSingUpNum(count);
        user.setCompetitionNum(num);
    }
}
