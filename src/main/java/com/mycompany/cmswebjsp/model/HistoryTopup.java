/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.model;

import java.sql.Timestamp;
import org.apache.log4j.Logger;

/**
 *
 * @author HTC-PC
 */
public class HistoryTopup {
    static final Logger logger = Logger.getLogger(HistoryTopup.class);
    
    private int id;
    private String phone;
    private int money;
    private Timestamp topupAt;
    private String telco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public Timestamp getTopupAt() {
        return topupAt;
    }

    public void setTopupAt(Timestamp topupAt) {
        this.topupAt = topupAt;
    }

    public String getTelco() {
        return telco;
    }

    public void setTelco(String telco) {
        this.telco = telco;
    }
    
}
