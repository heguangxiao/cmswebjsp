/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.model;

import com.mycompany.cmswebjsp.utils.Tool;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

public class Role {
    static final Logger logger = Logger.getLogger(Role.class);  
    
    public String toJson() {
        JSONObject obj = JSONObject.fromObject(this);
        String str = obj.toString();
        return str;
    }

    public static Role json2Objec(String str) {
        Role result = null;
        try {
            JSONObject inputObj = JSONObject.fromObject(str);
            result = (Role) JSONObject.toBean(inputObj, Role.class);
            if (result == null) {
                result = new Role();
            }
        } catch (Exception e) {
            result = new Role();
            logger.error(Tool.getLogMessage(e));
        }
        return result;
    } 
}
