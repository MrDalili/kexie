package com.ningdali.dao.daoImp;

import com.ningdali.dao.AdminInfoDao;
import com.ningdali.domain.Competition;
import com.ningdali.domain.User;
import com.ningdali.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class AdminInfoDaoImp implements AdminInfoDao {
    QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
    @Override
    public User login(User user) throws Exception {
        String sql = "select * from admin where aaccount=? and apassword=?";

        return queryRunner.query(sql,new BeanHandler<User>(User.class),user.getAaccount(),user.getApassword());
    }

    @Override
    public List<Competition> queryAdminInfoByAaccount(User user) throws Exception {
        String sql = "select * from competition where cuser=?";
        return queryRunner.query(sql,new BeanListHandler<Competition>(Competition.class),user.getAaccount());
    }


}
