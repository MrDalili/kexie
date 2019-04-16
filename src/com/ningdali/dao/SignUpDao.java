package com.ningdali.dao;

import com.ningdali.domain.Person;

import java.sql.SQLException;

public interface SignUpDao {

    void signUp(Person person) throws SQLException;
}
