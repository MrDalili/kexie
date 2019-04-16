package com.ningdali.dao;

import com.ningdali.domain.Competition;
import com.ningdali.domain.User;

import java.util.List;

public interface AdminInfoDao {
    User login(User user) throws Exception;

    List<Competition> queryAdminInfoByAaccount(User user) throws Exception;


}
