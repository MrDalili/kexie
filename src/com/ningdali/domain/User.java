package com.ningdali.domain;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String aname;
    private String aidentity;
    private int ajurisdiction;
    private String aaccount;
    private String apassword;
    private List<Competition> competitionList = new ArrayList<Competition>();
    private int competitionNum;

    private int singUpNum;

    public int getSingUpNum() {
        return singUpNum;
    }



    public void setSingUpNum(int singUpNum) {
        this.singUpNum = singUpNum;
    }

    public int getCompetitionNum() {
        return competitionNum;
    }

    public void setCompetitionNum(int competitionNum) {
        this.competitionNum = competitionNum;
    }

    public User() {
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAidentity() {
        return aidentity;
    }

    public void setAidentity(String aidentity) {
        this.aidentity = aidentity;
    }

    public int getAjurisdiction() {
        return ajurisdiction;
    }

    public void setAjurisdiction(int ajurisdiction) {
        this.ajurisdiction = ajurisdiction;
    }

    public String getAaccount() {
        return aaccount;
    }

    public void setAaccount(String aaccount) {
        this.aaccount = aaccount;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public List<Competition> getCompetitionList() {
        return competitionList;
    }

    public void setCompetitionList(List<Competition> competitionList) {
        this.competitionList = competitionList;
    }

    @Override
    public String toString() {
        return "User{" +
                "aname='" + aname + '\'' +
                ", aidentity='" + aidentity + '\'' +
                ", ajurisdiction=" + ajurisdiction +
                ", aaccount='" + aaccount + '\'' +
                ", apassword='" + apassword + '\'' +
                ", competitionList=" + competitionList +
                '}';
    }
}
