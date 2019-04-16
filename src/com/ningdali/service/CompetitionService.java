package com.ningdali.service;

import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;

import java.util.List;

public interface CompetitionService {
    //获取当前比赛的人数
    int getCompetitionMemberCount(Competition competition) throws Exception;

    void setCompetitionTotalOfList(List<Competition> list) throws Exception;

    void getCompetitionMember(User user) throws Exception;

    List<Person> getMemberInfoOfCompetitionApply(Person person,User user) throws Exception;

    void AddNewCompetition(Competition competition, User user) throws Exception;

    Competition getCompetitionByUserWithCid(User user, String cid);

    void updateCompetition(Competition competition) throws Exception;

    void updateCompetitionOfUser(User user, Competition competition) throws Exception;

    List<Competition> getCompetitionList() throws Exception;
}
