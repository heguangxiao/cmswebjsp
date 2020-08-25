/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.model;

import org.apache.log4j.Logger;

/**
 *
 * @author HTC-PC
 */
public class ServiceCdr {    
    static final Logger logger = Logger.getLogger(ServiceCdr.class);
    
    private int id;
    private String phone;
    private String money;
    private String chargAt;
    private String topupAt;
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

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getChargAt() {
        return chargAt;
    }

    public void setChargAt(String chargAt) {
        this.chargAt = chargAt;
    }

    public String getTopupAt() {
        return topupAt;
    }

    public void setTopupAt(String topupAt) {
        this.topupAt = topupAt;
    }

    public String getTelco() {
        return telco;
    }

    public void setTelco(String telco) {
        this.telco = telco;
    }
}
