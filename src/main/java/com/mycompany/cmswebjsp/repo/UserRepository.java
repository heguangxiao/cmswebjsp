/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.repo;

import com.mycompany.cmswebjsp.db.DBPool;
import com.mycompany.cmswebjsp.model.User;
import com.mycompany.cmswebjsp.utils.Tool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author HTC-PC
 */
public class UserRepository {
    static final Logger logger = Logger.getLogger(UserRepository.class);
    public static final HashMap<Integer, User> CACHE = new HashMap<>();
    
    static {
        try {
            UserRepository dao = new UserRepository();
            ArrayList<User> cache = dao.findAll();
            for (User one : cache) {
                CACHE.put(one.getId(), one);
            }
        } catch (Exception e) {
            System.out.println("Error when initialize : " + e);
        }
    }
    
    public static User getUser(HttpSession session) {
        User user = null;
        try {
            user = (User) session.getAttribute("userlogin");
            if (user != null) {
                // Lay Lai Doi tuong moi neu da bi Reload
                user = getUser(user.getId());
            }
        } catch (Exception e) {
            logger.error("User.getUser:" + Tool.getLogMessage(e));
        }
        return user;
    }

    public static User getUser(int id) {
        synchronized (CACHE) {
            return CACHE.get(id);
        }
    }

    public static User getUser(String user) {
        synchronized (CACHE) {
            User result = null;
            Collection<User> coll = CACHE.values();
            for (User one : coll) {
                if (one.getUserName().equals(user)) {
                    result = one;
                    break;
                }
            }
            CACHE.notifyAll();
            return result;
        }
    }

    public ArrayList<User> findAll() {
        ArrayList all = new ArrayList();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM account ";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                all.add(user);
            }
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return all;
    }
}
