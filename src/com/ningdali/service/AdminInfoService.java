package com.ningdali.service;

import com.ningdali.domain.Competition;
import com.ningdali.domain.User;

import java.util.List;

public interface AdminInfoService {
    User login(User user) throws Exception;

    List<Competition> queryAdminInfoByAaccount(User user) throws Exception;

    void setMemberCount(User user);
}
