package com.ningdali.service;

import com.ningdali.domain.Person;

import java.sql.SQLException;

public interface SignUpService {
    //进行比赛的报名
    void signUp(Person person) throws SQLException;
}
