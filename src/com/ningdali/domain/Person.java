package com.ningdali.domain;

import java.util.Date;

public class Person {
    private String u_id;//学号
    private String u_name;//姓名
    private String major;//专业
    private String academy;//学院
    private String competition;//比赛------>后续会加入序号
    private String competitionName;//比赛名称
    private String grade;//成绩
    private Date signUpTime;//报名时间
    private String QQ;//QQ号
    private String telephone;//手机号
    private String u_describe;//备注或描述
    public Person() {
    }

    public String getCompetitionName() {
        return competitionName;
    }

    public void setCompetitionName(String competitionName) {
        this.competitionName = competitionName;
    }

    @Override
    public String toString() {
        return "Person{" +
                "u_id='" + u_id + '\'' +
                ", u_name='" + u_name + '\'' +
                ", major='" + major + '\'' +
                ", academy='" + academy + '\'' +
                ", competition='" + competition + '\'' +
                ", competitionName='" + competitionName + '\'' +
                ", grade='" + grade + '\'' +
                ", signUpTime=" + signUpTime +
                ", QQ='" + QQ + '\'' +
                ", telephone='" + telephone + '\'' +
                ", u_describe='" + u_describe + '\'' +
                '}';
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy;
    }

    public String getCompetition() {
        return competition;
    }

    public void setCompetition(String competition) {
        this.competition = competition;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Date getSignUpTime() {
        return signUpTime;
    }

    public void setSignUpTime(Date signUpTime) {
        this.signUpTime = signUpTime;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getU_describe() {
        return u_describe;
    }

    public void setU_describe(String u_describe) {
        this.u_describe = u_describe;
    }

}
