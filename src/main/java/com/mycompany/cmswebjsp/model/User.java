/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.model;

import java.util.HashMap;
import org.apache.log4j.Logger;

/**
 *
 * @author HIEU
 */
public class User {
    
    static final Logger logger = Logger.getLogger(User.class);
    public static final HashMap<Integer, User> CACHE = new HashMap<>();
    
    private int id;
    private String userName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
}
