/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.utils;

import com.mycompany.cmswebjsp.config.MyContext;
import org.apache.log4j.Logger;

public class Tool {

    static Logger logger = Logger.getLogger(Tool.class);
    
    public static void debug(String input) {
        String fullClassName = Thread.currentThread().getStackTrace()[2].getClassName();
        String className = fullClassName.substring(fullClassName.lastIndexOf(".") + 1);
        int lineNumber = Thread.currentThread().getStackTrace()[2].getLineNumber();
        if (MyContext.DE_BUG) {
            System.out.println("Tool.debug: " + className + ".class:[d" + lineNumber + "] " + input);
        }
    }

    public static void debug(int input) {
        String fullClassName = Thread.currentThread().getStackTrace()[2].getClassName();
        String className = fullClassName.substring(fullClassName.lastIndexOf(".") + 1);
        int lineNumber = Thread.currentThread().getStackTrace()[2].getLineNumber();
        if (MyContext.DE_BUG) {
            System.out.println("Tool.debug: " + className + ".class:[d" + lineNumber + "] " + input);
        }
    }

    public static String getLogMessage(Exception ex) {
        StackTraceElement[] trace = ex.getStackTrace();
        String str = DateProc.createTimestamp() + "||" + ex.getMessage() + "||";
        for (StackTraceElement trace1 : trace) {
            str += trace1 + "\t\n";
        }
        return str;
    }

    public static String validStringRequest(String input) {
        if (input != null) {
            input = input.trim();
        } else {
            input = "";
        }
        return input;
    }
}
