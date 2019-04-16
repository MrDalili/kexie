package com.ningdali.dao;

import com.ningdali.domain.Competition;
import com.ningdali.domain.Person;
import com.ningdali.domain.User;

import java.util.List;

public interface CompetitionDao {
    int getCompetitionMemberCount(Competition competition) throws Exception;
    List<Person> getCompetitionMember(Competition competition) throws Exception;

    Competition getCompetitionById(String cid) throws Exception;

    List<Person> getMemberInfoOfCompetitionApply(Person person, User user) throws Exception;

    Competition getCompetitionByCname(String cname) throws Exception;

    void AddNewCompetition(Competition competition, User user) throws Exception;

    void updateCompetition(Competition competition) throws Exception;

    List<Competition> getCompetitionList() throws Exception;
}
