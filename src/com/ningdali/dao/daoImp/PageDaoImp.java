package com.ningdali.dao.daoImp;

import com.ningdali.dao.PageDao;
import com.ningdali.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class PageDaoImp implements PageDao {
    QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
    @Override
    public int getPageAccessNum() throws Exception {
        String sql = "select * from Page";
        int accessNum = (int) queryRunner.query(sql,new ScalarHandler());
        return accessNum;
    }

    @Override
    public void setPageAccessNum(int accesssNumber) throws Exception {
        String sql = "UPDATE Page SET access = ?";
        queryRunner.update(sql,accesssNumber);
    }
}
