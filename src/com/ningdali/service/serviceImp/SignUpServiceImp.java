package com.ningdali.service.serviceImp;

import com.ningdali.dao.SignUpDao;
import com.ningdali.dao.daoImp.SignUpDaoImp;
import com.ningdali.domain.Person;
import com.ningdali.service.SignUpService;

import java.sql.SQLException;

public class SignUpServiceImp implements SignUpService {

    //注册或报名
    @Override
    public void signUp(Person person) throws SQLException {
        SignUpDao signUpDao = new SignUpDaoImp();

        signUpDao.signUp(person);
    }
}
