/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.config;

import com.mycompany.cmswebjsp.db.DBPool;
import com.mycompany.cmswebjsp.db.PoolMng;
import com.mycompany.cmswebjsp.model.User;
import com.mycompany.cmswebjsp.utils.DateProc;
import com.mycompany.cmswebjsp.utils.Tool;
import java.io.File;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jconfig.Configuration;
import org.jconfig.ConfigurationManager;
import org.jconfig.ConfigurationManagerException;
import org.jconfig.handler.XMLFileHandler;

/**
 *
 * @author HIEU
 */
public class MyContext implements ServletContextListener, HttpSessionListener {

    static Logger logger = Logger.getLogger(MyContext.class);
    
    private static final Map<String, HttpSession> SESSION_ONLINE = new HashMap<>();
    public static boolean DE_BUG;
    public static String configDir;
    public static String ROOT_DIR;
    public static boolean running = false;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        running = true;
        System.setProperty("java.awt.headless", "true");    // Fix Error java.lang.NoClassDefFoundError: Could not initialize class sun.awt.X11GraphicsEnvironmen
        ROOT_DIR = sc.getRealPath("/");
        Tool.debug("ROOT_DIR:" + ROOT_DIR);
        configDir = sc.getInitParameter("config");
        configDir = ROOT_DIR + configDir;
        loadLog4j(configDir + "/Log4j.properties");
        MyConfig.config = getConfig("config.xml");
        PoolMng.CreatePool();
        DE_BUG = MyConfig.getBoolean("DE_BUG", false, "General");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        running = false;
        MyConfig.config.resetCreated();
        //---
        DBPool.release();
        PoolMng.release();
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                Tool.debug(" Deregis Driver:" + driver.toString());
                logger.log(Level.INFO, String.format("deregistering jdbc driver: %s", driver));
            } catch (SQLException e) {
                logger.log(Level.ERROR, String.format("Error deregistering driver %s", driver), e);
            }
        }
        Tool.debug(" contextDestroyed ............");
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        if (session.isNew()) {
            Tool.debug("Event New sessionCreated: " + se.getSession().getId() + ":" + DateProc.createTimestamp());
        } else {
            Tool.debug("Event Old sessionCreated ?? : " + se.getSession().getId() + ":" + DateProc.createTimestamp());
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession evtSession = se.getSession();
        synchronized (SESSION_ONLINE) {
            Collection<HttpSession> listSession = SESSION_ONLINE.values();
            if (listSession != null && listSession.size() > 0) {
                for (HttpSession oneSession : listSession) {
                    if (oneSession.getId().equals(evtSession.getId())) {
                        User userlogin = (User) oneSession.getAttribute("userLogin");
                        if (userlogin != null) {
                            SESSION_ONLINE.remove(userlogin.getUserName());
                            Tool.debug("Ngon lay duoc User [" + userlogin.getUserName() + "] Theo Session [" + oneSession.getId() + "]:" + DateProc.createTimestamp());
                        } else {
                            Tool.debug("Khong lay duoc User theo Session [" + oneSession.getId() + "]:" + DateProc.createTimestamp());
                        }
                        oneSession.invalidate();
                        break;
                    }
                }
            }
            SESSION_ONLINE.notify();
        }
    }

    private static void loadLog4j(String log4jPath) {
        if (log4jPath == null) {
            Tool.debug("---> - log4j-properties-location init param, so initializing log4j with BasicConfigurator");
            BasicConfigurator.configure();
        } else {
            File yoMamaYesThisSaysYoMama = new File(log4jPath);
            if (yoMamaYesThisSaysYoMama.exists()) {
                Tool.debug("--->Initializing Log4j:" + log4jPath);
                PropertyConfigurator.configure(log4jPath);
            } else {
                Tool.debug("---> " + log4jPath + " file not found, so initializing log4j with BasicConfigurator");
                BasicConfigurator.configure();
            }
        }
    }

    private static Configuration getConfig(String configFile) {
        Configuration _config = null;
        String configPath = configDir + "/" + configFile;
        configPath = configPath.replaceAll("\\\\", "/");
        File file = new File(configPath);
        logger.info(file.getName());
        XMLFileHandler handler = new XMLFileHandler();
        handler.setFile(file);
        try {
            logger.debug("trying to load file config");
            ConfigurationManager cm = ConfigurationManager.getInstance();
            cm.load(handler, "engineConfig");
            logger.info("file config successfully processed");
            logger.info("get Config From ConfigurationManager");
            _config = ConfigurationManager.getConfiguration("engineConfig");
        } catch (ConfigurationManagerException e) {
            System.out.println(e);
        }
        return _config;
    }
    
}
