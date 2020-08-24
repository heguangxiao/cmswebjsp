/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cmswebjsp.repo;

import java.util.ArrayList;

public interface BaseRepository<H> {
    ArrayList<H> findAll();
    H findById(int id);
    boolean save(H h);
    boolean update(H h);
    boolean delete(int id);
}
