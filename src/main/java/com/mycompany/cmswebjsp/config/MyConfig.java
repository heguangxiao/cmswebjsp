/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.config;

import org.apache.log4j.Logger;
import org.jconfig.Configuration;

public class MyConfig {

    public static Configuration config;
    static Logger logger = Logger.getLogger(MyConfig.class);

    public static int getInt(String properties, int defaultVal, String categoryName) {
        try {
            return Integer.parseInt(config.getProperty(properties, defaultVal + "", categoryName));
        } catch (NumberFormatException e) {
            logger.error(e);
            return defaultVal;
        }
    }

    public static long getLong(String properties, long defaultVal, String categoryName) {
        try {
            return Long.parseLong(config.getProperty(properties, defaultVal + "", categoryName));
        } catch (NumberFormatException e) {
            logger.error(e);
            return defaultVal;
        }
    }

    public static Double getDouble(String properties, Double defaultVal, String categoryName) {
        try {
            return Double.parseDouble(config.getProperty(properties, defaultVal + "", categoryName));
        } catch (NumberFormatException e) {
            logger.error(e);
            return defaultVal;
        }
    }

    public static String getString(String properties, String defaultVal, String categoryName) {
        try {
            return config.getProperty(properties, defaultVal, categoryName);
        } catch (Exception e) {
            logger.error(e);
            return defaultVal;
        }
    }

    public static boolean getBoolean(String properties, boolean defaultVal, String categoryName) {
        try {
            return config.getProperty(properties, "0", categoryName).equals("1");
        } catch (Exception e) {
            logger.error(e);
            return defaultVal;
        }
    }
}
