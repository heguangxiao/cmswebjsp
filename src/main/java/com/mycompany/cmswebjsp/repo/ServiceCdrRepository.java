/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.repo;

import com.mycompany.cmswebjsp.db.DBPool;
import com.mycompany.cmswebjsp.model.ServiceCdr;
import com.mycompany.cmswebjsp.utils.Tool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author HIEU
 */
public class ServiceCdrRepository implements BaseRepository<ServiceCdr> {
    static final Logger logger = Logger.getLogger(ServiceCdrRepository.class);

    @Override
    public ArrayList<ServiceCdr> findAll() {
        ArrayList all = new ArrayList();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM service_cdr WHERE 1 = 1";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                ServiceCdr h = new ServiceCdr();
                h.setId(rs.getInt("ID"));
                h.setPhone(rs.getString("PHONE"));
                h.setMoney(rs.getString("MONEY"));
                h.setChargAt(rs.getString("CHARGAT"));
                h.setTopupAt(rs.getString("TOPUPAT"));
                h.setTelco(rs.getString("TELCO"));
                all.add(h);
            }
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return all;
    }

    @Override
    public ServiceCdr findById(int id) {
        ServiceCdr h = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM service_cdr WHERE ID = ?";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setInt(i++, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                h = new ServiceCdr();
                h.setId(rs.getInt("ID"));
                h.setPhone(rs.getString("PHONE"));
                h.setMoney(rs.getString("MONEY"));
                h.setChargAt(rs.getString("CHARGAT"));
                h.setTopupAt(rs.getString("TOPUPAT"));
                h.setTelco(rs.getString("TELCO"));
            }
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return h;
    }

    @Override
    public boolean save(ServiceCdr h) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "INSERT INTO service_cdr(PHONE, MONEY, CHARGAT, TOPUPAT, TELCO) VALUES(?, ?, ?, ?, ?)";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setString(i++, h.getPhone());
            pstm.setString(i++, h.getMoney());
            pstm.setString(i++, h.getChargAt());
            pstm.setString(i++, h.getTopupAt());
            pstm.setString(i++, h.getTelco());
            result = pstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return result;
    }

    @Override
    public boolean update(ServiceCdr h) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "UPDATE service_cdr SET PHONE = ?, MONEY = ?, CHARGAT = ?, TOPUPAT = ?, TELCO = ? WHERE ID = ?";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setString(i++, h.getPhone());
            pstm.setString(i++, h.getMoney());
            pstm.setString(i++, h.getChargAt());
            pstm.setString(i++, h.getTopupAt());
            pstm.setString(i++, h.getTelco());
            pstm.setInt(i++, h.getId());
            result = pstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return result;
    }

    @Override
    public boolean delete(int id) {
        boolean result = false;
        ServiceCdr h = findById(id);
        if (h != null) {
            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            String sql = "DELETE FROM service_cdr WHERE ID = ?";
            try {
                conn = DBPool.getConnection();
                pstm = conn.prepareStatement(sql);
                int i = 1;
                pstm.setInt(i++, id);
                result = pstm.executeUpdate() == 1;
            } catch (SQLException ex) {
                logger.error(Tool.getLogMessage(ex));
            } finally {
                DBPool.freeConn(rs, pstm, conn);
            } 
        }
        return result; 
    }
    
    
}
