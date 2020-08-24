/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.model;

import java.sql.Timestamp;
import org.apache.log4j.Logger;

public class HistoryCharg {
    static final Logger logger = Logger.getLogger(HistoryCharg.class);
    
    private int id;
    private String phone;
    private int money;
    private Timestamp chargAt;
    private String telco;
    private int topupId;

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

    public Timestamp getChargAt() {
        return chargAt;
    }

    public void setChargAt(Timestamp chargAt) {
        this.chargAt = chargAt;
    }

    public String getTelco() {
        return telco;
    }

    public void setTelco(String telco) {
        this.telco = telco;
    }

    public int getTopupId() {
        return topupId;
    }

    public void setTopupId(int topupId) {
        this.topupId = topupId;
    }
}
