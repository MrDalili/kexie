package com.ningdali.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Competition {
    private String cid;  //活动id
    private String cname;  //活动名称
    private User user;   //活动创建者
    private Date cStartTime;  //活动开始时间
    private double ccost;  //活动报名费
    private int total;  //活动报名人数
    private Date cEndTime;  //活动截止时间
    private int cflag;  //活动当前状态
    private List<Person> personList = new ArrayList<Person>();  //活动报名人员
    private String cdescribe;  //活动描述
    private String corganizer;  //活动发起组织
    private String cimage;  //活动二维码


    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }

    public String getCorganizer() {
        return corganizer;
    }

    public void setCorganizer(String corganizer) {
        this.corganizer = corganizer;
    }




    public String getCdescribe() {
        return cdescribe;
    }

    public void setCdescribe(String cdescribe) {
        this.cdescribe = cdescribe;
    }


    @Override
    public String toString() {
        return "Competition{" +
                "cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", user=" + user +
                ", cStartTime=" + cStartTime +
                ", ccost=" + ccost +
                ", total=" + total +
                ", cEndTime=" + cEndTime +
                ", cflag=" + cflag +
                ", cdescribe='" + cdescribe + '\'' +
                ", corganizer='" + corganizer + '\'' +
                ", cimage='" + cimage + '\'' +
                '}';
    }

    public List<Person> getPersonList() {
        return personList;
    }

    public void setPersonList(List<Person> personList) {
        this.personList = personList;
    }



    public int getCflag() {
        return cflag;
    }

    public void setCflag(int cflag) {
        this.cflag = cflag;
    }

    public Competition() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getcStartTime() {
        return cStartTime;
    }

    public void setcStartTime(Date cStartTime) {
        this.cStartTime = cStartTime;
    }

    public double getCcost() {
        return ccost;
    }

    public void setCcost(double ccost) {
        this.ccost = ccost;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getcEndTime() {
        return cEndTime;
    }

    public void setcEndTime(Date cEndTime) {
        this.cEndTime = cEndTime;
    }
}
