package com.ningdali.dao.daoImp;

import com.ningdali.dao.SignUpDao;
import com.ningdali.domain.Person;
import com.ningdali.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import java.sql.SQLException;

public class SignUpDaoImp implements SignUpDao {
    @Override
    public void signUp(Person person) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "insert into person values(?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {person.getU_id(),person.getU_name(),person.getMajor(),person.getAcademy()
                ,person.getCompetition(),person.getGrade(),person.getSignUpTime(),person.getQQ(),
                person.getTelephone(), person.getU_describe()};
        qr.update(sql,params);
    }

}
