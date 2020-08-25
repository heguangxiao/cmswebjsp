/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.repo;

import com.mycompany.cmswebjsp.db.DBPool;
import com.mycompany.cmswebjsp.model.HistoryCharg;
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
public class HistoryChargRepository implements BaseRepository<HistoryCharg>{
    static final Logger logger = Logger.getLogger(HistoryChargRepository.class);

    @Override
    public ArrayList<HistoryCharg> findAll() {
        ArrayList all = new ArrayList();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM history_charg WHERE 1 = 1";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                HistoryCharg h = new HistoryCharg();
                h.setId(rs.getInt("ID"));
                h.setPhone(rs.getString("PHONE"));
                h.setId(rs.getInt("MONEY"));
                h.setChargAt(rs.getTimestamp("CHARGAT"));
                h.setTelco(rs.getString("TELCO"));
                h.setTopupId(rs.getInt("TOPUP_ID"));
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
    public HistoryCharg findById(int id) {
        HistoryCharg h = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM history_charg WHERE ID = ?";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setInt(i++, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                h = new HistoryCharg();
                h.setId(rs.getInt("ID"));
                h.setPhone(rs.getString("PHONE"));
                h.setId(rs.getInt("MONEY"));
                h.setChargAt(rs.getTimestamp("CHARGAT"));
                h.setTelco(rs.getString("TELCO"));
                h.setTopupId(rs.getInt("TOPUP_ID"));
            }
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return h;
    }

    @Override
    public boolean save(HistoryCharg h) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "INSERT INTO history_charg(PHONE, MONEY, CHARGAT, TELCO, TOPUP_ID) VALUES(?, ?, ?, ?, ?)";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setString(i++, h.getPhone());
            pstm.setInt(i++, h.getMoney());
            pstm.setTimestamp(i++, h.getChargAt());
            pstm.setString(i++, h.getTelco());
            pstm.setInt(i++, h.getTopupId());
            result = pstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            logger.error(Tool.getLogMessage(ex));
        } finally {
            DBPool.freeConn(rs, pstm, conn);
        }
        return result;
    }

    @Override
    public boolean update(HistoryCharg h) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "UPDATE history_charg SET PHONE = ?, MONEY = ?, CHARGAT = ?, TELCO = ?, TOPUP_ID = ? WHERE ID = ?";
        try {
            conn = DBPool.getConnection();
            pstm = conn.prepareStatement(sql);
            int i = 1;
            pstm.setString(i++, h.getPhone());
            pstm.setInt(i++, h.getMoney());
            pstm.setTimestamp(i++, h.getChargAt());
            pstm.setString(i++, h.getTelco());
            pstm.setInt(i++, h.getTopupId());
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
        HistoryCharg h = findById(id);
        if (h != null) {
            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            String sql = "DELETE FROM history_charg WHERE ID = ?";
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
