package com.ningdali.web.Listener;

import com.ningdali.dao.PageDao;
import com.ningdali.dao.daoImp.PageDaoImp;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener()
public class AccessWebListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {

    public void attributeAdded(HttpSessionBindingEvent sce) {
        PageDao pageDao = new PageDaoImp();
        try {
            int accesssNumber = pageDao.getPageAccessNum();
            accesssNumber++;
            pageDao.setPageAccessNum(accesssNumber);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
